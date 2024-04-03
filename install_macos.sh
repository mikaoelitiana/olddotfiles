#!/usr/bin/env bash
echo "Installing NodeJs and tooling via asdf"
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest
npm i -g yarn
yarn global add all-the-package-names

echo "Installing MacOS rosetta"
softwareupdate --install-rosetta
