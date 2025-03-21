hyper = {"cmd","alt","ctrl"}
shift_hyper = {"cmd","alt","ctrl","shift"}

hs.loadSpoon("ControlEscape"):start()

hs.loadSpoon("SpoonInstall")
spoon.SpoonInstall.use_syncinstall = true
Install=spoon.SpoonInstall

-- Install:andUse("Emojis", {
--     hotkeys = {
--         toggle = { hyper, "z" }
--     },
-- })

-- Install:andUse("MouseCircle", {
-- 	hotkeys = {
-- 		show = { hyper, "z" }
-- 	}
-- })

-- this is too slow to swap..
-- Install:andUse("MicMute", {
-- 	hotkeys = {
-- 		toggle = { hyper, "z" }
-- 	}
-- })

Install:andUse("KSheet", {
	hotkeys = {
		toggle = { hyper, "/" }
	}
})

Install:andUse("FadeLogo",
               {
                 config = {
                   default_run = 1.0,
                 },
                 start = true
               }
)


-- toggle mic on google hangouts

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

hs.hotkey.bind({"cmd", "shift"}, "1", muteHangouts)


-- put mac to screensaver

function startScreenSaver()
	start = [[
		tell application "System Events"
		start current screen saver
	end tell
	]]
	hs.osascript.applescript(start)
end

bedtime = hs.menubar.new()
bedtime:setIcon("./bedtime.pdf")
bedtime:setClickCallback(startScreenSaver)

hs.hotkey.bind({"cmd", "shift"}, "6", startScreenSaver)
