if status is-interactive
    # Commands to run in interactive sessions can go here
end

# config
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
set -gx EDITOR nvim
