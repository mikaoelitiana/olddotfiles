if status is-interactive
    # Commands to run in interactive sessions can go here
end

# enable ASDF
source (brew --prefix asdf)/libexec/asdf.fish

# config
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

set -gx EDITOR nvim
