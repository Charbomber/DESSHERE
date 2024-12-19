

return {
	
	onlydess = function(script, chara)
		if Game.inventory:hasItem("keyCard") and not Game:getFlag("onlydess") then
			
			if not Game:hasPartyMember("dess") then
				if Game.party[3] then
					Game:removePartyMember(Game.party[3])
				end
				Game:addPartyMember("dess", 1)
			end
			Game:movePartyMember("dess", 1)
			
			Game.world:spawnPlayer(Game.world.player.x, Game.world.player.y, Game.party[1]:getActor(), "dess")
			for i=1,#Game.party do
				--if i > 1 then
					Game.world:removeFollower(Game.party[i]:getActor().id)
				--end
				--Game:removePartyMember(Game.party[i])
			end
			--Game.world:spawnParty({Game.world.player.x, Game.world.player.y})
			
			--local partyLength = #Game.party
			
			Game:setFlag("onlydess", true)
		end
	end,
	
	returnfromdess = function(script, chara)
		if Game:getFlag("onlydess") then
			Game:setFlag("onlydess", false)
		end
	end,
	
}