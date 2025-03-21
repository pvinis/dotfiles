module.exports = {
	defaultBrowser: "Firefox",
	handlers: [
	  {
		match: finicky.matchHostnames(["meet.google.com"]),
		browser: "Google Chrome"
	  },
	]
}


// https://google.com
// https://apple.com
