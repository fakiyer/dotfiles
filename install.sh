#!/bin/bash

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.zshrc ~/.zshrc
ln -sf ~/dotfiles/.atom ~/.atom
ln -sf ~/dotfiles/karabiner/private.xml ~/Library/Application\ Support/Karabiner/private.xml
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.git_template ~/.git_template
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global

sh ~/dotfiles/karabiner/import.sh
sh ~/dotfiles/brew.sh
