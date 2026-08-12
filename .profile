# echo "IN .profile"

# Environment (POSIX; Ubuntu may source this with dash)
export EDITOR=vim
export COLORTERM=truecolor
export LC_COLLATE=C
export BASH_SILENCE_DEPRECATION_WARNING=1

# load .env
if [ -f ~/.env ]; then
   . ~/.env
fi

# PATH
if [ -f "$HOME/.path" ]; then
    . "$HOME/.path"
fi

# if running bash
if [ -n "$BASH_VERSION" ]; then
    # include .bashrc if it exists
    if [ -f "$HOME/.bashrc" ]; then
        . "$HOME/.bashrc"
    fi
fi

# echo "OUT .profile"
