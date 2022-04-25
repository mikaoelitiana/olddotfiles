if status is-interactive
    # Commands to run in interactive sessions can go here
end

# config
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'
set -gx EDITOR nvim
set -gx VOLTA_HOME "$HOME/.volta"
set -gx PATH "$VOLTA_HOME/bin" $PATH
fish_add_path $HOME/Library/Python/3.9/bin

# Google cloud sdk
if test -e /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
  source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
end
