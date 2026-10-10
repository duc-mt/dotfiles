#!/bin/bash
# ==============================================================================
# Script Name:   md2pdf_syn_bullet_prop.sh
# Description:   Implementation and logic for md2pdf_syn_bullet_prop.
# Author:        Mai Tan Duc <ducmai.network@gmail.com>
# Created:       2026-10-10
# Version:       1.0.0
# License:       MIT
# ==============================================================================
# Usage:         ./md2pdf_syn_bullet_prop.sh [options] [arguments]
# Notes:         Automated bash utility script
# ==============================================================================

pandoc "$1" \
    -f gfm \
    --include-in-header chapter_break.tex \
    --include-in-header inline_code.tex \
    --include-in-header bullet_style.tex \
    --include-in-header pdf_properties.tex \
    --highlight-style pygments.theme \
    -V linkcolor:blue \
    -V geometry:a4paper \
    -V geometry:margin=2cm \
    -V mainfont="DejaVu Serif" \
    -V monofont="DejaVu Sans Mono" \
    --pdf-engine=xelatex \
    -o "$2"

