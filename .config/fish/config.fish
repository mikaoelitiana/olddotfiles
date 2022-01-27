if status is-interactive
    # Commands to run in interactive sessions can go here
end

# enable ASDF
source $HOMEBREW_PREFIX/opt/asdf/libexec/asdf.fish

# config
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

