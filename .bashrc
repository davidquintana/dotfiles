# echo "IN .bashrc"

# PATH and env for non-login shells (Ubuntu GUI terminals)
if [ -f "$HOME/.path" ]; then
    . "$HOME/.path"
fi
export EDITOR=vim
export COLORTERM=truecolor
export LC_COLLATE=C

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# Color in console
# don't do this for dumb terminals
if [ "$TERM" != "dumb" ]; then
 if [ $(uname) == "Linux"  ]; then
   # Linux
   alias ls='ls --color=auto'
   export LS_COLORS='di=33:fi=0:ln=95:pi=5:so=5:bd=5:cd=5:or=37:mi=0:ex=31:*.rpm=90'
 else
   # OS X
   alias ls='ls -G'
   export LSCOLORS=ExFxCxDxBxegedabagacad
 fi
 #This is for everyone
 export CLICOLOR=1
fi

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
if [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
elif [ -f /opt/homebrew/etc/profile.d/bash_completion.sh ]; then
    . /opt/homebrew/etc/profile.d/bash_completion.sh
elif [ -f /usr/local/etc/profile.d/bash_completion.sh ]; then
    . /usr/local/etc/profile.d/bash_completion.sh
fi

# Improve output of less for binary files
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# Load aliases if they exist.
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# Load prompt
if [ -f ~/.prompt ]; then
    . ~/.prompt
fi

# Google Cloud CLI completions
[ -f /snap/google-cloud-cli/current/completion.bash.inc ] && . /snap/google-cloud-cli/current/completion.bash.inc

# >>> grok installer >>>
[[ -r "$HOME/.grok/completions/bash/grok.bash" ]] && source "$HOME/.grok/completions/bash/grok.bash"
# <<< grok installer <<<

# echo "OUT .bashrc"
