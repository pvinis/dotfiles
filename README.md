# New place: [pvinis/chez](https://github.com/pvinis/chez)

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



	1	pwpolicy getaccountpolicies > ~/Desktop/file.plist
	2	sudo nano ~/Desktop/file.plist
	3	Delete the first line, which says Getting global account policies to make the file valid XML
	4	Change the bolded part to your Regex
policyAttributePassword matches '^$|.{4,}+'
	5	pwpolicy  setaccountpolicies ~/Desktop/file.plist
	6	passwd
Presets:


192:~ pvinis$ git clone https://github.com/pvinis/dotfiles.git .d
Me https, gia na ginei prin to ssh.

Stow, ola ok

Switch to Zsh?
Run brew bundle


Git clone the private stuff, after naming the system?



Creds
https://pawelgrzybek.com/change-macos-user-preferences-via-command-line/
https://github.com/mathiasbynens/dotfiles/blob/master/.macos


setup zsh
nvm setup
brew bundleeeee and separate the brewfile file to work, home etc

after brew bundle, do ruby-install ~/.ruby-version to install the version i need



ruby-install?


scroll natural

## old way
```
git init --bare .d
```
then go to .d/config and make `bare = false` and `worktree = ..`  
then from `~` i can do `git --git-dir=.d status`


to work with magit, we need a text file `~/.git` that has `gitdir: .d` inside  
that makes git work in all subdirs, so its better not to have it there always
