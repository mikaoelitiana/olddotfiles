# Load ASDF
. /usr/local/opt/asdf/libexec/asdf.sh

if [ "x${VSCODE}" = "xYES" ]; then
  # avoid slow load
else

# User configuration

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi
export EDITOR='nvim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias config='/usr/bin/git --git-dir=$HOME/.cfg/ --work-tree=$HOME'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"
export PATH="/usr/local/opt/openssl/bin:$PATH"
export LDFLAGS="-L/usr/local/opt/openssl@1.1/lib -L/usr/local/opt/readline/lib -L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib -L/usr/local/opt/zlib/lib "
export CFLAGS="-I/usr/local/opt/openssl@1.1/include -I/usr/local/opt/bzip2/include -I/usr/local/opt/readline/include -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include"
export PKG_CONFIG_PATH="/usr/local/opt/zlib/lib/pkgconfig:$PKG_CONFIG_PATH"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"
export PATH=$PATH:/usr/local/sbin
export PATH=$PATH:$HOME/.cargo/bin
export PATH=$PATH:$HOME/.local/bin
export PATH=$PATH:$HOME/Library/Python/2.7/bin
export PATH=$PATH:$HOME/flutter/bin

export ALK_PYPI_USERNAME=alkemics
export ALK_PYPI_PASSWORD=cie2Rie7
export ALK_PYPI_REPO=pypi.alkemics.com:8443

export PKG_CONFIG_PATH="/usr/local/Cellar/icu4c/54.1/lib/pkgconfig/:$PKG_CONFIG_PATH"
export PATH="/usr/local/Cellar/icu4c/54.1/bin/:$PATH"
# Load pyenv automatically by appending
# export PYENV_ROOT="$HOME/.pyenv"
# export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"

export ANDROID_HOME=$HOME/Library/Android/sdk
export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools
export REACT_EDITOR=code

export jest_workers="10%"

fi

