#!/usr/bin/env bash
echo "Installing brew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >>$HOME/.profile
eval "$(/opt/homebrew/bin/brew shellenv)"

echo "Installing kitty"
curl -L https://sw.kovidgoyal.net/kitty/installer.sh | sh /dev/stdin

echo "Installing fish"
brew install fish
echo $(which fish) >>/etc/shells

echo "Installing NodeJs and tooling via asdf"
brew install asdf gpg gawk
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest
npm i -g yarn prettier eslint typescript-language-server eslint_d
yarn global add all-the-package-names

softwareupdate --install-rosetta
