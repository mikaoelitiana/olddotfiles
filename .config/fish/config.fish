if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx EDITOR nvim
fish_add_path $HOME/Library/Python/3.9/bin

# Google cloud sdk
if test -e /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
    source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
end

if test -e /opt/homebrew/opt/asdf/libexec/asdf.fish
    source /opt/homebrew/opt/asdf/libexec/asdf.fish
end
