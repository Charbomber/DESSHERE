local mySpot, super = Class(Event)

function mySpot:init(data)
	super.init(self, data.x, data.y, data.width, data.height)
	
end

function mySpot:onEnter(chara)
	if not Game:getFlag("mySpot", false) then
		self.spotTimer = Game.world.timer:after(10, function()
			Game:setFlag("mySpot", true)
			Game.world:showText("My spot.")
		end)
	end
end

function mySpot:onExit(chara)
	Game.world.timer:cancel(self.spotTimer)
end

return mySpot