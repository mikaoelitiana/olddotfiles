#!/usr/bin/env bash
echo "Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing fish"
brew install fish
echo $(which fish) >> /etc/shells

echo "Installung node"
brew install node
npm i -g yarn

echo "Installing neovim"
brew install neovim

