mute = false
function muteHangouts()
	previouslyFocusedWindow = hs.window.focusedWindow()

	chrome = hs.application.find("Google Chrome")
	chrome:activate()

	goToMeetTab = [[
		tell application "Google Chrome"
			set i to 0
			repeat with t in tabs of first window
				set i to i + 1
				if title of t contains "Meet" then
					set active tab index of first window to i
					return
				end if
			end repeat
		end tell
	]]
	hs.osascript.applescript(goToMeetTab)

 	hs.eventtap.keyStroke({ "cmd" }, "d") -- mute shortcut
	mute = not mute
	setMeetMute(mute)

	previouslyFocusedWindow:focus()
end

meetMute = hs.menubar.new()
flippedMute = false
function setMeetMute(state)
	if state then
		if flippedMute then
			meetMute:setTitle("BLABLA")
		else
			meetMute:setTitle("MUTED")
		end
	else
		if flippedMute then
			meetMute:setTitle("MUTED")
		else
			meetMute:setTitle("BLABLA")
		end
	end
end

function meetMuteClicked()
	flippedMute = not flippedMute
	setMeetMute(mute)
end

meetMute:setClickCallback(meetMuteClicked)
setMeetMute(mute)

hs.hotkey.bind({"cmd", "shift"}, "1", muteHangouts)


bedtime = hs.menubar.new()
bedtime:setIcon("./bedtime.pdf")
