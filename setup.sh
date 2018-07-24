#!/bin/bash

ln -sf ~/dotfiles/.vimrc ~/.vimrc
ln -sf ~/dotfiles/.vim/basic.vim ~/.vim/basic.vim
ln -sf ~/dotfiles/.vim/bundle.vim ~/.vim/bundle.vim
ln -sf ~/dotfiles/.vim/keymapping.vim ~/.vim/keymapping.vim
ln -sf ~/dotfiles/.vim/plugin.vim ~/.vim/plugin.vim
ln -sf ~/dotfiles/.tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/.zshrc ~/.zshrc
# ln -sf ~/dotfiles/.atom ~/.atom
ln -sf ~/dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/dotfiles/.git_template ~/.git_template
ln -sf ~/dotfiles/.gitignore_global ~/.gitignore_global
ln -sf ~/dotfiles/.ripgreprc ~/.ripgreprc
ln -s ~/dotfiles/VSCode/settings.json ~/Library/Application\ Support/Code/User/settings.json
ln -s ~/dotfiles/VSCode/keybindings.json ~/Library/Application\ Support/Code/User/keybindings.json
ln -s ~/dotfiles/VSCode/snippets/ ~/Library/Application\ Support/Code/User/snippets

# sh ~/dotfiles/karabiner/import.sh
ln -sf ~/dotfiles/karabiner-elements/karabiner.json ~/.config/karabiner/karabiner.json
ln -sf ~/dotfiles/karabiner-elements/assets/complex_modifications/mouse.json ~/.config/karabiner/assets/complex_modifications/mouse.json

sh ~/dotfiles/install.sh
sh ~/dotfiles/brew.sh
sh ~/dotfiles/osx/keyrate.sh
