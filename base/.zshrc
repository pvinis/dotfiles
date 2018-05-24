[ -s "$HOME/.zshrc_private" ] && source $HOME/.zshrc_private
[ -s "$HOME/.zshrc_local" ] && source $HOME/.zshrc_local

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# extra paths
export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export NVM_DIR="$HOME/.nvm"
declare -a NODE_GLOBALS=(`find ~/.nvm/versions/node -maxdepth 3 -type l -wholename '*/bin/*' | xargs -n1 basename | sort | uniq`) # node bins
NODE_GLOBALS+=(`ls ~/.config/yarn/global/node_modules/.bin`) # yarn bins
NODE_GLOBALS+=("node")
NODE_GLOBALS+=("nvm")
NODE_GLOBALS+=("npm")
NODE_GLOBALS+=("yarn")

load_nvm () {
    export NVM_DIR=~/.nvm
    [ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh" # This loads nvm
}

for cmd in "${NODE_GLOBALS[@]}"; do
    eval "${cmd}(){ unset -f ${NODE_GLOBALS}; load_nvm; ${cmd} \$@ }"
done

# other
fuck() { # lazy load fuck
    unset -f fuck
    eval $(thefuck --alias)
    fuck "$@"
}

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# aliases
alias o='open'
