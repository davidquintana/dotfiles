# echo "IN .bashrc"

# Color codes, use like "${BLUE}"
  COLOR_NONE="\[\e[0m\]"
       BLACK="\[\e[0;30m\]"
   DARK_GRAY="\[\e[1;30m\]"
         RED="\[\e[0;31m\]"
    DARK_RED="\[\e[1;31m\]"
       GREEN="\[\e[0;32m\]"
  DARK_GREEN="\[\e[1;32m\]"
       BROWN="\[\e[0;33m\]"
      YELLOW="\[\e[1;33m\]"
        BLUE="\[\e[0;34m\]"
   DARK_BLUE="\[\e[1;34m\]"
     MAGENTA="\[\e[0;35m\]"
DARK_MAGENTA="\[\e[1;35m\]"
        CYAN="\[\e[0;36m\]"
   DARK_CYAN="\[\e[1;36m\]"
  LIGHT_GRAY="\[\e[0;37m\]"
       WHITE="\[\e[1;37m\]"

# Prompt
#export PS1="${GREEN}(${DARK_GRAY}\u${GREEN})-(${DARK_GRAY}\h${GREEN})-(${DARK_GRAY}\w${GREEN})\n(${DARK_GRAY}\@ \d${GREEN}) \m \$ ${COLOR_NONE}"
#export PS1="${DARK_BLUE}\u${DARK_CYAN}@${DARK_BLUE}\h${DARK_CYAN}:${CYAN}\w${DARK_GRAY}\$${COLOR_NONE} "
#export PS1="${DARK_GRAY}\u@\h${COLOR_NONE}:${CYAN}\w${COLOR_NONE} \$ "
export PS1="${DARK_GREEN}[${GREEN}\$(date +%H:%M:%S)${DARK_GREEN}] ${DARK_GRAY}\u@\h${COLOR_NONE}:${CYAN}\w${COLOR_NONE} \$ "

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
