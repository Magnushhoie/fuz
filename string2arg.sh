#!/bin/bash
# https://stackoverflow.com/questions/55186799/multi-process-bash-within-fzf-preview-feature
set -euo pipefail
string2arg() {
    export arg_filename=$(cut -d":" -f1 <<< "$*");
    export arg_linenum=$(cut -d":" -f2 <<< "$*");

    min_offset=3
    let max_offset="min_offset*10"
    min=0
    if (($min_offset < $arg_linenum)); then
        let min="arg_linenum-$min_offset"
    fi
    let max="arg_linenum+$max_offset"
    bat --color=always --highlight-line "$arg_linenum" \
    --style=header,grid,numbers \
    --line-range "$min":"$max" "$arg_filename";
}
