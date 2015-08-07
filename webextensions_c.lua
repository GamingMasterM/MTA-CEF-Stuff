
local lp = getLocalPlayer()
local sx, sy = guiGetScreenSize()
local px, py = sx/1920, sy/1080

local activeBrowser = false
function activateBrowser(browser, state, x, y, width, height)
	if state then
		if not activeBrowser  then
			activeBrowser = {browser, x, y, width, height}
			addEventHandler("onClientCursorMove", root, updateCursor)
			addEventHandler("onClientClick", root,updateClick)
			return true
		end	
		return false
	else
		if activeBrowser then
			activeBrowser = false	
			removeEventHandler("onClientCursorMove", root, updateCursor)
			removeEventHandler("onClientClick", root,updateClick)
			return true
		end
		return false
	end
end


function updateClick(button, state)
	if state == "down" then
		injectBrowserMouseDown(activeBrowser[1], button)
	else
		injectBrowserMouseUp(activeBrowser[1], button)
	end 
end


function updateCursor(cursorX, cursorY, absoluteX, absoluteY)
	local x, y, width, height = activeBrowser[2], activeBrowser[3], activeBrowser[4], activeBrowser[5]
	if (absoluteX > x and absoluteX < x + width) and (absoluteY > y and absoluteY < y + height) then
		injectBrowserMouseMove(activeBrowser[1], absoluteX - x, absoluteY - y)
	end
end



