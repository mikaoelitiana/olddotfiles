if status is-interactive
    # Commands to run in interactive sessions can go here
end

# config
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
set -gx EDITOR nvim
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
