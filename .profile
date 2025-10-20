# echo "IN .profile"

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# load .env 
if [ -f ~/.env ]; then
   . ~/.env
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/.local/bin" ] ; then
    PATH="$HOME/.local/bin:$PATH"
fi

# Homebrew paths
export PATH=/usr/local/bin:$PATH
export PATH=/usr/local/sbin:$PATH

# Golang paths
export GOPATH=$HOME/Developer/SDK/go
export PATH=$PATH:/usr/local/opt/go/libexec/bin

# Android
export ANDROID_HOME=/Users/jdq/Library/Android/sdk

# Java
export JAVA_HOME=/Library/Java/JavaVirtualMachines/adoptopenjdk-8.jdk/Contents/Home

# Silence Catalina zsh message
export BASH_SILENCE_DEPRECATION_WARNING=1

# Color codes, use like "${BLUE}"
  COLOR_NONE="\[\e[0m\]"
       BLACK="\[\e[0;30m\]"
  BOLD_BLACK="\[\e[1;30m\]"
         RED="\[\e[0;31m\]"
    BOLD_RED="\[\e[1;31m\]"
       GREEN="\[\e[0;32m\]"
  BOLD_GREEN="\[\e[1;32m\]"
      YELLOW="\[\e[0;33m\]"
 BOLD_YELLOW="\[\e[1;33m\]"
        BLUE="\[\e[0;34m\]"
   BOLD_BLUE="\[\e[1;34m\]"
     MAGENTA="\[\e[0;35m\]"
BOLD_MAGENTA="\[\e[1;35m\]"
        CYAN="\[\e[0;36m\]"
   BOLD_CYAN="\[\e[1;36m\]"
       WHITE="\[\e[0;37m\]"
  BOLD_WHITE="\[\e[1;37m\]"

# Prompt
# PS1="${WHITE}[${CYAN}\$(date +%H:%M:%S)${WHITE}] ${GREEN}\h ${WHITE}[${BLUE}\w${WHITE}]${COLOR_NONE} \$ "
PS1="${BOLD_CYAN}\t ${WHITE}| ${BOLD_GREEN}\h${WHITE}:${BOLD_BLUE}\w${COLOR_NONE} \$ "

# echo "OUT .profile"

# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.bash 2>/dev/null || :
