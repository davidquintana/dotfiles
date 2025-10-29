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

# echo "OUT .profile"
