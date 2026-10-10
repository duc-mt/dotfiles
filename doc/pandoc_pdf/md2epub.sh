#!/bin/bash
# ==============================================================================
# Script Name:   md2epub.sh
# Description:   Implementation and logic for md2epub.
# Author:        Mai Tan Duc <ducmai.network@gmail.com>
# Created:       2026-10-10
# Version:       1.0.0
# License:       MIT
# ==============================================================================
# Usage:         ./md2epub.sh [options] [arguments]
# Notes:         Automated bash utility script
# ==============================================================================

pandoc  "$1" \
        -f gfm \
        --toc \
        --standalone \
        --top-level-division=chapter \
        --highlight-style pygments.theme \
        --css epub.css \
        --metadata=title:"My awesome book" \
        --metadata=author:"learnbyexample" \
        --metadata=lang:"en-US" \
        --metadata=cover-image:"cover.png" \
        -o "$2"

