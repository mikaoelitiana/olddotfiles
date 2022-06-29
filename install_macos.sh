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

echo "Installing NodeJs and tooling via asdf"
brew install asdf gpg gawk
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest
asdf global nodejs latest
npm i -g yarn prettier eslint typescript-language-server eslint_d
yarn global add all-the-package-names

echo "Installing powerline"
brew install python
python3 -m pip install powerline-status

echo "Installing neovim + spacevim"
brew install neovim
npm i -g neovim
brew install ripgrep xclip
curl -sLf https://spacevim.org/install.sh | bash
pip3 install --user pynvim
gem install neovim

echo "Installing Git toolings"
brew install gh
brew install jesseduffield/lazygit/lazygit

echo "Installing tmux"
brew install tmux
brew install tmuxinator
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

echo "Installing docker"
brew install --cask docker

echo "Please download Unifont from https://www.fontspace.com/unifont-font-f26370"

