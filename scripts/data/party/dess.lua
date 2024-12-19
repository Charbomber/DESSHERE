local character, super = Class("dess", true)

function character:reInit(realDess)
	Game:setFlag("realDess", realDess)
	if realDess then
		self.title = "Batter\nDeals heavy blows\nwith bats & magic."
		self.lw_portrait = "face/dess/wink"
	else
		self.title = "The Batter\nfrom OFF"
		self.lw_portrait = "face/dess/condescending"
	end
end

function character:drawPowerStat(index, x, y, menu)
	
	if not Game:getFlag("realDess") then
		if index == 1 then
			local icon = Assets.getTexture("ui/menu/icon/angry")
			love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
			love.graphics.print("Angy:", x, y)
			love.graphics.print("Lots", x+130, y)
			return true
		elseif index == 2 then
			local icon = Assets.getTexture("ui/menu/icon/bbgum")
			love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
			love.graphics.print("Funny:", x, y)
			love.graphics.print("Not", x+130, y)
			return true
		elseif index == 3 then
			local icon = Assets.getTexture("ui/menu/icon/fire")
			love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
			love.graphics.print("Guts:", x, y)

			love.graphics.draw(icon, x+90, y+6, 0, 2, 2)
			love.graphics.draw(icon, x+110, y+6, 0, 2, 2)
			love.graphics.draw(icon, x+130, y+6, 0, 2, 2)
			love.graphics.draw(icon, x+150, y+6, 0, 2, 2)
			love.graphics.draw(icon, x+170, y+6, 0, 2, 2)
			return true
		end
	else
		if index == 1 then
			local icon = Assets.getTexture("ui/menu/icon/angry")
			love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
			love.graphics.print("Temper:", x, y)
			love.graphics.print("Bad", x+130, y)
			return true
		elseif index == 2 then
			local icon = Assets.getTexture("ui/menu/icon/bbgum")
			love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
			love.graphics.print("Bbl.Gum:", x, y)
			love.graphics.print("0", x+130, y)
			return true
		elseif index == 3 then
			local icon = Assets.getTexture("ui/menu/icon/fire")
			love.graphics.draw(icon, x-26, y+6, 0, 2, 2)
			love.graphics.print("Guts:", x, y)

			love.graphics.draw(icon, x+90, y+6, 0, 2, 2)
			love.graphics.draw(icon, x+110, y+6, 0, 2, 2)
			love.graphics.draw(icon, x+130, y+6, 0, 2, 2)
			return true
		end
	end
end

return character
