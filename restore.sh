#!/bin/sh

## Restore dot files

echo "Restoring dot files..."
cp .bashrc ~/.bashrc
cp .bash_profile ~/.bash_profile
cp .tmux.conf ~/.tmux.conf
cp .vimrc ~/.vimrc