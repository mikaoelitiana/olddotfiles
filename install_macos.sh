#!/usr/bin/env bash
echo "Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.profile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing kitty"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

echo "Installing fish"
brew install fish
echo $(which fish) >> /etc/shells

echo "Installing NodeJs and tooling via volta"
curl https://get.volta.sh | bash
volta install node
npm i -g yarn prettier eslint typescript-language-server
yarn global add all-the-package-names

echo "Installing powerline"
brew install python
python3 -m pip install powerline-status

echo "Installing neovim + spacevim"
brew install neovim
npm i -g neovim
brew install ripgrep
curl -sLf https://spacevim.org/install.sh | bash
pip3 install --user pynvim
gem install neovim

echo "Installing Git toolings"
brew install gh

echo "Installing tmux"
brew install tmux
brew install tmuxinator
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing docker"
brew install --cask docker
