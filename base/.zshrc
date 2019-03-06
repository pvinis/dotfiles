[ -s "$HOME/.zshrc_private" ] && source $HOME/.zshrc_private
[ -s "$HOME/.zshrc_local" ] && source $HOME/.zshrc_local

BASE16_SHELL=$HOME/.config/base16-shell
[ -n "$PS1" ] && [ -s $BASE16_SHELL/profile_helper.sh ] && eval "$($BASE16_SHELL/profile_helper.sh)"
base16_eighties

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

export GPG_TTY=$(tty)

# setup nodenv
eval "$(nodenv init -)"

# extra paths
export PATH="$HOME/.fastlane/bin:$PATH"
export PATH="/Users/pvinis/Library/Python/3.7/bin:$PATH"
export PATH="$HOME/.yarn/bin:$PATH"
export PATH="$HOME/.config/yarn/global/node_modules/.bin:$PATH"



# other
fuck() { # lazy load fuck
    unset -f fuck
    eval $(thefuck --alias)
    fuck "$@"
}

kport() {
    lsof -t -i :$1 | xargs kill
}

alias krn='kport 8081'

source /usr/local/share/chruby/chruby.sh
source /usr/local/share/chruby/auto.sh

# aliases


alias f='fork'
alias c='code .'
alias cl='clear'
alias at='adb shell input keyevent 82'
alias git='hub'

# completion
autoload -U compinit
compinit

# no args: git status
# with args: git `args`
g() {
	if [[ $# -gt 0 ]]; then
		git "$@"
	else
		git status
	fi
}
compdef g=git

# no args: open .
# with args: open `args`
o() {
	if [[ $# -gt 0 ]]; then
		open "$@"
	else
		open .
	fi
}
compdef g=git

# modify the prompt to contain git branch name if applicable
git_prompt_info() {
  current_branch=$(git current-branch 2> /dev/null)
  if [[ -n $current_branch ]]; then
    echo " %{$fg_bold[green]%}$current_branch%{$reset_color%}"
  fi
}

setopt promptsubst

# Allow exported PS1 variable to override default prompt.
if ! env | grep -q '^PS1='; then
  PS1='${SSH_CONNECTION+"%{$fg_bold[green]%}%n@%m:"}%{$fg_bold[blue]%}%c%{$reset_color%}$(git_prompt_info) %# '
fi

# makes color constants available
autoload -U colors
colors
# enable colored output from ls
export CLICOLOR=1

# history
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

export ERL_AFLAGS="-kernel shell_history enabled"

bindkey -v
# bindkey "^F" vi-cmd-mode


# handy keybindings
# bindkey "^A" beginning-of-line
# bindkey "^E" end-of-line
# bindkey "^K" kill-line
# bindkey "^R" history-incremental-search-backward
# bindkey "^P" history-search-backward
# bindkey "^Y" accept-and-hold
# bindkey "^N" insert-last-word
# bindkey "^Q" push-line-or-edit

bindkey -s "^T" "^[Isudo ^[A" # t for toughguy

# awesome cd movements
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

setopt extendedglob

unsetopt nomatch

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$PATH:$HOME/.rvm/bin"
