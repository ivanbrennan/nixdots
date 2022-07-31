eval "$(direnv hook bash)"
export ODEKO_PREFIX=$HOME/Development/odeko

if test -f ~/.bashrc.local
then
    . ~/.bashrc.local
fi
