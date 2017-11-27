#!/bin/sh

set -eu

{ # Prevent execution if this script was only partially downloaded

while [ $# -gt 0 ]; do
  case "$1" in
    -g|--github-host)
      arg_github_host="$2"
      shift
      ;;
    *)
      printf 'Usage: bash %s [-g|--github-host HOST]\n' "$0"
      exit 1
      ;;
  esac
  shift
done

github_host="${arg_github_host:-github.com}"
dotfiles="$HOME/Development/resources/dotfiles"

if [ ! -d "$dotfiles" ]; then
  mkdir -p "$dotfiles"

  git clone \
      "git@${github_host}:ivanbrennan/nixdots.git" \
      "$dotfiles"
fi

"$dotfiles/install/make-symlinks.sh"
"$dotfiles/X11/gsettings"

} # End of wrapping
