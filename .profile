# echo "IN .profile"

# load .bashrc settings
if [ -f ~/.bashrc ]; then
   source ~/.bashrc
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
export PS1="${DARK_GRAY}[\$(date +%H:%M:%S)] ${DARK_GREEN}\h ${LIGHT_GRAY}[${DARK_BLUE}\w${LIGHT_GRAY}]${COLOR_NONE} \$ "


# echo "OUT .profile"
