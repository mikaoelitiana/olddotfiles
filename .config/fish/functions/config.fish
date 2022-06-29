function config --wraps 'git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
    lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
end
