export PS1='\[\033[38;5;9m\][\u';
if [[ "$(who am i)" =~ .*(\(.*\)) ]]
then
    export PS1="$PS1"'\[\033[00m\]@\[\033[01;32m\]\h'
fi
export PS1="$PS1"']\[\033[1;34m\](\w)\[\033[m\]\[\e[0m\]$\[\033[00m\] '
if [ $SHLVL -gt 1 ]
then
    export PS1="($SHLVL) $PS1"
fi
