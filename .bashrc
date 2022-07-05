# echo "IN .bashrc"

# Color in console
# don't do this for dumb terminals
if [ "$TERM" != "dumb" ]; then
 if [ $(uname) == "Linux"  ]; then
   # Linux
   alias ls='ls --color=auto'
   LS_COLORS='di=33:fi=0:ln=95:pi=5:so=5:bd=5:cd=5:or=37:mi=0:ex=31:*.rpm=90'
 else
   # OS X   
   alias ls='ls -G'
   export LSCOLORS=ExFxCxDxBxegedabagacad
 fi
 #This is for everyone       
 export CLICOLOR=1
fi

# Set the proper text editor
export EDITOR=vim

# History settings
export HISTFILESIZE=50000
export HISTSIZE=50000
export HISTTIMEFORMAT="%Y-%m-%d %H:%M:%S:  "
export HISTCONTROL=ignoreboth
## Append to history file
shopt -s histappend

# Ensure $LINES and $COLUMNS always get updated
shopt -s checkwinsize

# Enable bash completion
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Improve output of less for binary files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Load aliases if they exist.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# echo "OUT .bashrc"
