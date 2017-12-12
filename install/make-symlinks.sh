#!/usr/bin/env bash

set -eu

repo=$DOTFILES

config_files=(
  "$repo/alacritty"
  "$repo/git"
)

main() {
  make_config_symlinks
}

make_config_symlinks() {
  for src in "${config_files[@]}"; do
    link="$HOME/.config/$(basename "$src")"
    make_symlink "$src" "$link"
  done
}

make_symlink() {
  local src=$1 link=$2

  if already_exists "$link"; then
    backup="${link}-backup-$(date +%s)"
    echo "$link already exists. Backing up to $backup"
    mv -i "$link" "$backup"
  fi

  mkdir -p $(dirname "$link")
  ln -svnf "$src" "$link" | grep -Fe '->'
}

already_exists() {
  # non-empty && not a symlink
  [ -s "$1" ] && [ ! -L "$1" ]
}

main
