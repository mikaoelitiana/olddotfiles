#!/usr/bin/env bash
echo "Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo "Installing fish"
brew install fish
echo $(which fish) >> /etc/shells

echo "Installing asdf"
brew install asdf
brew install gpg gawk
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs lts
npm i -g yarn
asdf global nodejs lts

echo "Installing neovim"
brew install neovim

