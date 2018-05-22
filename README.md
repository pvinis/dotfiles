`git clone git@github.com:pvinis/dotfiles.git`


cd .dotfiles
stow base git





brew

ruby-install
nvm
zsh




old way
====

git init --bare .dotfiles
then go to .dotfiles/config and make bare = false and worktree = ..
then from ~ i can do git --git-dir=.dotfiles status, or gitx --git-dir=.dotfiles.


to work with magit, we need a text file ~/.git that has `gitdir: .dotfiles` inside. that makes git work in all subdirs, so its better not to have it there always.

