source $HOME/.zshrc_private
source $HOME/.zshrc_local

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# extra paths
export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# other
eval $(thefuck --alias)

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# aliases
alias o='open'
