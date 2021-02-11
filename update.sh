#!/bin/sh

# Updates all files

## dot files
echo "Copying dot files..."
cp ~/.bashrc .
cp ~/.bash_profile .
cp ~/.tmux.conf .
cp ~/.vimrc .

## homebrew
echo "Saving homebrew packages..."
brew leaves > homebrew_leaves
brew list --cask > homebrew_casks

## applications
echo "Saving Applications..."
ls /Applications/ > applications

echo "Done!"