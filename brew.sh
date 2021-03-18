#!/bin/bash

# Install command-line tools using Homebrew.

# Make sure we’re using the latest Homebrew.
brew update

# Upgrade any already-installed formulae.
brew upgrade

# Install all our dependencies with bundle (See Brewfile)
brew bundle

# pip2 install neovim
pip3 install neovim
# pip2 install pip-review
pip3 install pip-review
pip3 install neovim-remote

# for coc.nvim
curl -sL install-node.now.sh/lts | sh
curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
gem install solargraph

# Switch to using brew-installed zsh as default shell
if ! fgrep -q '/usr/local/bin/zsh' /etc/shells; then
  echo '/usr/local/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /usr/local/bin/zsh;
fi;

ln -s ~/.vim ~/.config/nvim
ln -s ~/.vimrc ~/.config/nvim/init.vim

/usr/local/opt/fzf/install

# Remove outdated versions from the cellar.
brew cleanup
