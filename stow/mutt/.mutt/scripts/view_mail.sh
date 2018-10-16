#!/usr/bin/env bash

columns=${COLUMNS:-`tput cols`}
tmpfile="$1"
encoding="${2:-utf-8}"

# Need to copy the file because mutt will delete it before Vim can read it.
dir=$(mktemp -d)
cp "$tmpfile" "$dir/preview"
preview="$dir/preview"

if [ -z "$TMUX" ]; then
  vim -MR "+set encoding=$encoding" '+set filetype=mail' '+set nofoldenable' "$preview"
elif [ "$columns" -gt 180 ]; then
  tmux split-window -p 50 -h \
    vim -MR "+set encoding=$encoding" '+set filetype=mail' '+set nofoldenable' "$preview"
else
  tmux split-window -p 50 -v \
    vim -MR "+set encoding=$encoding" '+set filetype=mail' '+set nofoldenable' "$preview"
fi
