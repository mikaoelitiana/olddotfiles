# . config files

```
echo ".cfg" >> .gitignore
git clone --bare git@github.com:mikaoelitiana/dotfiles.git $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config --local status.showUntrackedFiles no
config checkout
```
