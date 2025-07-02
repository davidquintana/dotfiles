#!/bin/sh

# Updates all files

## dot files
echo "Copying dot files..."
cp ~/.bashrc .
cp ~/.profile .
cp ~/.tmux.conf .
cp ~/.vimrc .
cp ~/.aliases .
cp -r ~/.vim .
cp ~/Library/Application\ Support/com.mitchellh.ghostty/config ghostty/.

## homebrew
echo "Saving homebrew packages..."
brew leaves > homebrew_leaves
brew list --formulae -1 > homebrew_formulae
brew list --casks -1 > homebrew_casks

## applications
echo "Saving Applications..."
ls /Applications/ > applications

echo "Done!"
