
local lp = getLocalPlayer()
local sx, sy = guiGetScreenSize()
local px, py = sx/1920, sy/1080
local health = 100
local x, y, width, height = 20*px, 20*px, 400*px, 50*py

local browser = createBrowser(width, height, true)
local browser2 = guiCreateBrowser(x*4, y*4, width*50, height*50, false, false, false)
addEventHandler("onClientBrowserCreated", browser2, 
function()
	loadBrowserURL(guiGetBrowser(browser2), "http://youtube.com")
end)

addEventHandler("onClientBrowserCreated", browser, 
function()
	loadBrowserURL(browser, "src/index.html")
	addEventHandler("onClientBrowserDocumentReady", browser, function()
		addEventHandler("onClientRender", root, function()
			dxDrawImage(x, y, width, height, browser)
			if health ~= getElementHealth(lp) then 
				health = getElementHealth(lp)
				executeBrowserJavascript ( browser, "updateHealth("..health..")")
			end
		end)
	end)
end)

addEvent("onClientChangeHealth")
addEventHandler("onClientChangeHealth", root, function()
	setElementHealth(lp,100)
end)
setDevelopmentMode(true, true)



bindKey("m", "both", function(key, state)
	if state == "down" then state = true else state = false end
	showCursor(state, true)
	activateBrowser(browser, state, x, y, width, height)
end)