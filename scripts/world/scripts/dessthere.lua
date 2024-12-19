

return function(script, chara)
	Game.world.player.x = 2020
	Game.world.player.y = 760
	Game.world.can_open_menu = false
	
	if (false
        or (Input.down("c") and Input.down("d"))
        or (Input.down("gamepad:leftshoulder") and Input.down("gamepad:rightshoulder"))
        ) and Kristal.Config["debug"] then
			Game.world:mapTransition("city1", "entrance1", "down")
			Game:setFlag("inDessIntro", true)
			Game.world.can_open_menu = true
			Game:setFlag("desshere", 1998)
		else
			if Game:getFlag("desshere") == 3 then
				Game.world.dessScene = Text("A FUNHOUSE MIRROR", 0, 0, {})
				Game.world.dessScene:setLayer(WORLD_LAYERS["below_soul"])
				Game.world.dessScene:setParent(Game.stage)
			elseif Game:getFlag("desshere") == 5 then
				Game.world.dessScene:setText("A FUNHOUSE MIRROR\nLIKE A FUNHOUSE MIRROR,\nSHE REFLECTS SOMETHING INTO A TWISTED FORM")
			elseif Game:getFlag("desshere") == 10 then
				Game.world.dessScene:setText("YET YOU MIGHT BE ASKING YOURSELF\nLIKE A FUNHOUSE MIRROR,\nSHE REFLECTS SOMETHING INTO A TWISTED FORM")
			elseif Game:getFlag("desshere") == 15 then
				Game.world.dessScene:setText("YET YOU MIGHT BE ASKING YOURSELF\nWHAT DOES A MIRROR DO IF NOT REFLECT?\nSHE REFLECTS SOMETHING INTO A TWISTED FORM")
			elseif Game:getFlag("desshere") == 22 then
				Game.world.dessScene:setText("A REFLECTION IS MADE OF THAT WHICH IS REAL\nA MIRROR CANNOT REFLECT THAT WHICH DOES NOT EXIST\nSHE REFLECTS SOMETHING INTO A TWISTED FORM")
			elseif Game:getFlag("desshere") == 25 then
				Game.world.dessScene:setText("A REFLECTION IS MADE OF THAT WHICH IS REAL\nA MIRROR CANNOT REFLECT THAT WHICH DOES NOT EXIST\nSO THEN")
			elseif Game:getFlag("desshere") == 30 then
				Game.world.dessScene:setText("WHAT\nA MIRROR CANNOT REFLECT THAT WHICH DOES NOT EXIST\nSO THEN")
			elseif Game:getFlag("desshere") == 34 then
				Game.world.dessScene:setText("WHAT\nDOES SHE\nSO THEN")
			elseif Game:getFlag("desshere") == 38 then
				Game.world.dessScene:setText("WHAT\nDOES SHE\nREFLECT?")
			elseif Game:getFlag("desshere") == 40 then
				Game.world.fadeToWhite = Rectangle(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)
				Game.world.fadeToWhite:setLayer(WORLD_LAYERS["ui"])
				Game.world.fadeToWhite.alpha = 0
				Game.world.fadeToWhite:setParent(Game.stage)
				Game.world.timer:during(4, function()
				
					Game.world.fadeToWhite.alpha = Game.world.fadeToWhite.alpha + 0.01
				
				end, function()
					Game.world.dessScene:remove()
					Game.world.fadeToWhite:remove()
					Game:setFlag("desshere", 1998)
					Game.world:loadMap("city1", "entrance1", "down")
					Game.world.can_open_menu = true
					Game:setFlag("inDessIntro", true)
				end)
			elseif Game:getFlag("desshere") == 1998 then
				-- just transport to next area
				Game.world:mapTransition("city1", "entrance1", "down")
			end
	end
	
	if Game:getFlag("desshere", 0) < 1998 then
		Game:addFlag("desshere", 1, 0)
	end
end