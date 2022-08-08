eval "$(direnv hook bash)"

PATH="$HOME/.emacs.d/bin:$PATH"

export ODEKO_PREFIX=$HOME/Development/odeko

if test -f ~/.bashrc.local
then
    . ~/.bashrc.local
fi
