#!/usr/bin/env bash

columns=${COLUMNS:-`tput cols`}
tmpfile="$1"
encoding="${2:-utf-8}"

# Need to copy the file because mutt will delete it before Vim can read it.
tmpDir=$(mktemp -d)
cp "$tmpfile" "$tmpDir/preview"
preview="$tmpDir/preview"

if [ -z "$TMUX" ]; then
    trap "rm -rf '$tmpDir'" EXIT
    vim -MR "+set encoding=$encoding" '+set filetype=mail' '+set nofoldenable' "$preview"
elif [ "$columns" -gt 180 ]; then
    tmux split-window -p 50 -h "
        trap 'rm -rf \"$tmpDir\"' EXIT
        vim -MR \"+set encoding=$encoding\" '+set filetype=mail' '+set nofoldenable' \"$preview\"
    "
else
    tmux split-window -p 50 -v "
        trap 'rm -rf \"$tmpDir\"' EXIT
        vim -MR \"+set encoding=$encoding\" '+set filetype=mail' '+set nofoldenable' \"$preview\"
    "
fi
