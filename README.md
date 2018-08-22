# pavlos dotfiles

## setup a new computer
- install brew  
https://brew.sh/index
- install git and stow  
```
brew install git stow
```
name the computerrrrrrrrrr
- add ssh keys to github and gitlab  
```
ssh-keygen -t rsa -b 4096 -C "email@example.com"
pbcopy < ~/.ssh/id_rsa.pub
```
https://github.com/settings/keys  
https://gitlab.com/profile/keys  
- clone this repo  
```
git clone --recursive git@github.com:pvinis/dotfiles.git .d
```
- link all the dotfiles
```
cd .d
stow base macos git private
```


setup zsh
nvm setup
brew bundleeeee and separate the brewfile file to work, home etc



ruby-install?




## old way
```
git init --bare .d
```
then go to .d/config and make `bare = false` and `worktree = ..`  
then from `~` i can do `git --git-dir=.d status`


to work with magit, we need a text file `~/.git` that has `gitdir: .d` inside  
that makes git work in all subdirs, so its better not to have it there always
