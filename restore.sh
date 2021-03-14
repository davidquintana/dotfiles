#!/bin/sh

## Restore dot files

echo "Restoring dot files..."
cp .bashrc ~/.bashrc
cp .profile ~/.profile
cp .tmux.conf ~/.tmux.conf
cp .vimrc ~/.vimrc
cp -r .vim ~/.vim 
