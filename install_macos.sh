#!/usr/bin/env bash
echo "Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing fish"
brew install fish
echo $(which fish) >> /etc/shells

echo "Installing node via volta"
curl https://get.volta.sh | bash
volta install node
npm i -g yarn prettier eslint

echo "Installing powerline"
brew install python
python -m pip install --user powerline-status

echo "Installing neovim + spacevim"
brew install neovim
npm i -g neovim
brew install ripgrep
curl -sLf https://spacevim.org/install.sh | bash

echo "Installing Git toolings"
brew install gh

echo "Installing tmux"
brew install tmux
brew install tmuxinator

