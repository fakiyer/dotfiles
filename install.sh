# pip2 install neovim
pip3 install neovim
# pip2 install pip-review
pip3 install pip-review
pip3 install neovim-remote

# for coc.nvim
# curl -sL install-node.now.sh/lts | sh
# curl --compressed -o- -L https://yarnpkg.com/install.sh | bash
# gem install solargraph

# Switch to using brew-installed zsh as default shell
if ! fgrep -q '/opt/homebrew/bin/zsh' /etc/shells; then
  echo '/opt/homebrew/bin/zsh' | sudo tee -a /etc/shells;
  chsh -s /opt/homebrew/bin/zsh;
fi;

# /usr/local/opt/fzf/install

# cht.sh
# mkdir ~/bin
# curl https://cht.sh/:cht.sh > ~/bin/cht.sh
# chmod +x ~/bin/cht.sh

# zinit
sh -c "$(curl -fsSL https://git.io/zinit-install)"

# tpm
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
