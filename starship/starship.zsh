# ~/.config/starship/starship.zsh        (tested: zsh 5.9, Starship 1.27.0)
#
# Put this ONE line in ~/.zshrc, in place of `eval "$(starship init zsh)"`:
#     source ~/.config/starship/starship.zsh
#
# Gives you:  1) config selection (Nerd Font <-> plain ASCII)   2) transient prompt
#             3) terminal tab title (host: dir / running cmd)   4) `starship_theme`

# ── 1. Config selection ───────────────────────────────────────────────────────
# Starship re-reads STARSHIP_CONFIG on every prompt, so switching is instant.
: ${STARSHIP_DIR:=${XDG_CONFIG_HOME:-$HOME/.config}/starship}

starship_fancy() { export STARSHIP_CONFIG=$STARSHIP_DIR/starship.toml;       __ss_char='❯' }
starship_plain() { export STARSHIP_CONFIG=$STARSHIP_DIR/starship-plain.toml; __ss_char='>' }

# Linux virtual console / KVM / serial can't draw Nerd Font glyphs -> ASCII config.
# Force it anywhere with `STARSHIP_PLAIN=1` or by running `starship_plain`.
if [[ $TERM == linux || -n $STARSHIP_PLAIN || ! -r $STARSHIP_DIR/starship.toml ]]; then
  [[ -r $STARSHIP_DIR/starship-plain.toml ]] && starship_plain || starship_fancy
else
  starship_fancy
fi

# ── init (skipped if your .zshrc already ran it) ──────────────────────────────
(( $+functions[prompt_starship_precmd] )) || eval "$(starship init zsh)"

# ── 2. Transient prompt ───────────────────────────────────────────────────────
# After you press Enter, the finished 2-line prompt collapses to a bare `❯ cmd`,
# so scrollback stays readable (and copy-paste of old commands stays clean).
__ss_zle_line_init() {
  emulate -L zsh
  [[ $CONTEXT == start ]] || return 0
  while true; do                                  # keep Ctrl-D behaving normally
    zle .recursive-edit
    local -i ret=$?
    [[ $ret == 0 && $KEYS == $'\4' ]] || break
    [[ -o ignore_eof ]] || exit 0
  done
  local saved_prompt=$PROMPT saved_rprompt=$RPROMPT
  PROMPT="%B%F{blue}${__ss_char:-❯}%f%b "
  RPROMPT=''
  zle .reset-prompt
  PROMPT=$saved_prompt RPROMPT=$saved_rprompt
  if (( ret )); then zle .send-break; else zle .accept-line; fi
  return ret
}
zle -N zle-line-init __ss_zle_line_init

# ── 3. Terminal title: "host: ~/dir" over SSH, "~/dir" locally; cmd name while running
case $TERM in
  xterm*|rxvt*|screen*|tmux*|alacritty*|foot*|wezterm*|kitty*|ghostty*|st-*)
    autoload -Uz add-zsh-hook
    __ss_title_precmd()  {
      local h=; [[ -n $SSH_CONNECTION ]] && h='%m: '
      print -Pn "\e]0;${h}%~\a"
    }
    __ss_title_preexec() {
      local h=; [[ -n $SSH_CONNECTION ]] && h='%m: '
      local c=${${(z)1}[1]}
      print -Pn "\e]0;${h}"; print -rn -- "${(V)c}"; print -n "\a"
    }
    add-zsh-hook precmd  __ss_title_precmd
    add-zsh-hook preexec __ss_title_preexec
    ;;
esac

# ── 4. Theme switcher ─────────────────────────────────────────────────────────
#   starship_theme            -> list palettes
#   starship_theme nord       -> switch (applies to both the fancy and plain file)
starship_theme() {
  local f=$STARSHIP_DIR/starship.toml
  if [[ -z $1 ]]; then sed -n 's/^\[palettes\.\(.*\)\]$/\1/p' $f; return; fi
  grep -q "^\[palettes\.$1\]" $f || { print -u2 "no such palette: $1  (try: starship_theme)"; return 1 }
  local g
  for g in $f $STARSHIP_DIR/starship-plain.toml; do
    [[ -w $g ]] && sed -i.bak "s/^palette *=.*/palette = \"$1\"/" $g && rm -f $g.bak
  done
}
