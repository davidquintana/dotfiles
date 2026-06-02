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
export PATH=/opt/homebrew/bin/:$PATH
export PATH=/opt/homebrew/sbin/:$PATH

# Local global npm
export PATH="$HOME/.npm-global/bin:$PATH"

# Silence zsh message
export BASH_SILENCE_DEPRECATION_WARNING=1

# echo "OUT .profile"
