if status is-interactive
    # Commands to run in interactive sessions can go here
    kubectl completion fish | source
end

set -gx EDITOR nvim
set -gx TF_VERSION latest
set -gx ASDF_HASHICORP_OVERWRITE_ARCH amd64
fish_add_path $HOME/Library/Python/3.9/bin

# Google cloud sdk
if test -e /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
    source /opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.fish.inc
end

if test -e /opt/homebrew/opt/asdf/libexec/asdf.fish
    source /opt/homebrew/opt/asdf/libexec/asdf.fish
end

### MANAGED BY RANCHER DESKTOP START (DO NOT EDIT)
set --export --prepend PATH "/Users/mikaoelitiana/.rd/bin"
### MANAGED BY RANCHER DESKTOP END (DO NOT EDIT)
