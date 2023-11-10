#!/bin/bash
# https://stackoverflow.com/questions/55186799/multi-process-bash-within-fzf-preview-feature
set -euo pipefail
string2arg() {
  export arg_filename=$(cut -d":" -f1 <<<"$*")
  export arg_linenum=$(cut -d":" -f2 <<<"$*")

  min_offset=3
  let max_offset="min_offset*10"
  min=0
  if (($min_offset < $arg_linenum)); then
    let min="arg_linenum-$min_offset"
  fi
  let max="arg_linenum+$max_offset"
  bat --color=always --highlight-line "$arg_linenum" \
    --style=header,grid,numbers \
    --line-range "$min":"$max" "$arg_filename"
}

# Ctrl + E: Vim edit
# file="$dir/$file"
# Input: $file, $linematch
function _fze_read() {
  file=${1:-.""}
  linematch=${2:-0}

  # If valid file, open with vim if edit (-e) flag, else less
  if [[ -f $file ]]; then
    # Less w/ colors, highlight match, insensitive+incremental search, enable CTRL+C
    lineopen=$((${linematch:-0} >= 1 ? ${linematch:-0} - 1 : 0))
    bat "$file" --color=always --style plain \
      --highlight-line "${linematch:-0}" \
      --pager="less -R +${lineopen:-0}g --ignore-case"
  fi
}

# Ctrl + F: Less preview
# file="$dir/$file"
# Input: $file, $linematch
function _fze_write() {
  file=${1:-.""}
  linematch=${2:-0}
  if [[ -f $file ]]; then
    # Vim mouse-mode, start at top, softwrap, no numbering/highlight, clipboard copy-paste
    ${EDITOR:-vim} \
      +":set mouse=a" +":silent! normal g;" \
      +":set number nohlsearch" \
      +":set wrap linebreak nolist" \
      +":set textwidth=0 showbreak= colorcolumn= conceallevel=0 " \
      +":set clipboard^=unnamed,unnamedplus" \
      +"${linematch:-0}" +"normal zt" \
      "$file"
  fi
}

function _fz_read() {
  # Extract filename and linenumber from match
  dir="$1"
  filematch="$2"
  file=$(cut -d":" -f1 <<<"$filematch")
  file="$dir/$file"
  linematch=$(cut -d":" -f2 <<<"$filematch")

  # If valid file, open with vim if edit (-e) flag, else less
  if [[ -f $file ]]; then
    # Less w/ colors, highlight match, insensitive+incremental search, enable CTRL+C
    lineopen=$((${linematch:-0} >= 1 ? ${linematch:-0} - 1 : 0))
    bat "$file" --color=always --style plain \
      --highlight-line "${linematch:-0}" \
      --pager="less -R +${lineopen:-0}g --ignore-case"
  fi
}

function _fz_write() {
  # Extract filename and linenumber from match
  dir="$1"
  filematch="$2"
  file=$(cut -d":" -f1 <<<"$filematch")
  file="$dir/$file"
  linematch=$(cut -d":" -f2 <<<"$filematch")

  # If valid file, open with vim if edit (-e) flag, else less
  if [[ -f $file ]]; then
    # Vim mouse-mode, start at top, softwrap, no numbering/highlight, clipboard copy-paste
    ${EDITOR:-vim} \
      +":set mouse=a" +":silent! normal g;" \
      +":set number nohlsearch" \
      +":set wrap linebreak nolist" \
      +":set textwidth=0 showbreak= colorcolumn= conceallevel=0 " \
      +":set clipboard^=unnamed,unnamedplus" \
      +"${linematch:-0}" +"normal zt" \
      "$file"
  fi
}
