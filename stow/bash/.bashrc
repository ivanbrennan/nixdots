eval "$(direnv hook bash)"

PATH="$HOME/.config/emacs/bin:$PATH"

export ODEKO_PREFIX=$HOME/Development/odeko

if test -f ~/.bashrc.local
then
    . ~/.bashrc.local
fi
