# . config files

```
echo ".cfg" >> .gitignore
git clone --bare <remote-git-repo-url> $HOME/.cfg
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
config checkout
```
