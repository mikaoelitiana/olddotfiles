function lazyconfig --wraps 'lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv'
    lazygit --git-dir=$HOME/.cfg/ --work-tree=$HOME $argv
end
