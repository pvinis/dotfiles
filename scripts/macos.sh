#!/usr/bin/env ruby

# close any System Preferences panes, to prevent accidental overriding
`osascript -e 'tell application "System Preferences" to quit'`

# ask for admin upfront
`sudo -v`

# keep updating existing sudo until this script is finished
# while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# to find the following, i did:
# `defaults read > a`
# change a setting
# `defaults read > a`
# diff a b

# domain,  name,  type,  value
defaults_values = [
  # system preferences
  #   general
  #     accent color: purple
  ["NSGlobalDomain", "AppleAccentColor", "int", 5],
  #     highlight color: purple
  ["NSGlobalDomain", "AppleHighlightColor", "string", "0.968627 0.831373 1.000000 Purple"],
  #     sidebar icon size: small
  ["NSGlobalDomain", "NSTableViewDefaultSizeMode", "int", 1],

  #   dock
  #     size: 24
  ["com.apple.dock", "tilesize", "int", 24],
  #     position: right
  ["com.apple.dock", "orientation", "string", "right"],

  #   date & time
  #     date options: show date: true
  ["com.apple.menuextra.clock", "DateFormat", "string", "EEE d MMM  HH:mm"],

  #   mission control
  #     hot corners: top right: desktop
  ["com.apple.dock", "wvous-tr-corner", "int", 4], ["com.apple.dock", "wvous-tr-modifier", "int", 0],

  #   trackpad
  #     click on tap: true
  ["com.apple.AppleMultitouchTrackpad", "Clicking", "int", 1], ["com.apple.driver.AppleBluetoothMultitouch.trackpad", "Clicking", "int", 1],
  #     scroll direction: not natural
  ["NSGlobalDomain", "com.apple.swipescrolldirection", "int", 0],

  #   sound
  #     alert sound: funk
  ["NSGlobalDomain", "com.apple.sound.beep.sound", "string", "/System/Library/Sounds/Funk.aiff"],
  #     volume: 0.5
  ["NSGlobalDomain", "com.apple.sound.beep.volume", "float", "0.5"],

  # status bar
  #    battery: show percentage
  ["com.apple.menuextra.battery", "ShowPercent", "boolean", "YES"],
 ]

defaults_values.each {|v|
  domain, name, type, value = v
  valueStr = type == "string" ? "\"#{value}\"" : "#{value}"
  command = "defaults write #{domain} #{name} -#{type} #{valueStr}"
  puts command 
  `#{command}`
}

# special steps
# appearance: dark
`osascript -e '
  tell application "System Events"
    tell appearance preferences
      set dark mode to true
    end tell
  end tell 
'`



kill_apps = [
  "Finder",
  "Dock",
  "cfprefsd",
  "SystemUIServer",
]

kill_apps.each {|app|
  `killall #{app} &> /dev/null`
}


# defaults write NSGlobalDomain AppleInterfaceStyle -string "Dark"

# defaults write NSGlobalDomain AppleAccentColor -int 5
  
# defaults write NSGlobalDomain AppleHighlightColor -string "0.968627 0.831373 1.000000 Purple"

#defaults write NSGlobalDomain NSTableViewDefaultSizeMode -int 1



