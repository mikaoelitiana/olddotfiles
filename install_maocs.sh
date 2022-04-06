#!/usr/bin/env bash
echo "Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing fish"
brew install fish
echo $(which fish) >> /etc/shells

echo "Installung node via volta"
curl https://get.volta.sh | bash
volta install node
npm i -g yarn

echo "Installing neovim"
brew install neovim
npm i -g neovim
brew install ripgrep

echo "Installing powerline"
brew install python
python -m pip install --user powerline-status

