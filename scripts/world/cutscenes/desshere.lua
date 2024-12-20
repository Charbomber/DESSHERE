return {
    ---@param cutscene WorldCutscene
    desswalk1 = function(cutscene)
		--370, 850
		local theOtherDess = cutscene:getCharacter("dess", 1)
		--local theOtherDess = NPC("dess", 370, 850, {facing = "right", solid = false})
		local finishWalk = cutscene:walkToSpeed(theOtherDess, theOtherDess.x+SCREEN_WIDTH+200, theOtherDess.y, 4, "right", "right")
		
		local dess = cutscene:getCharacter("dess", 2)
		cutscene:textTagged("* The hell is this area?", "condescending", "dess")
		cutscene:textTagged("* look its not even finished", "condescending", "dess")
		cutscene:textTagged("* theres these gaps and you cant even walk through", "smug", "dess")
		cutscene:textTagged("* and this tileset is SO barebones", "condescending", "dess")
		
		-- just pick the first character in the party who would give a confused/blank stare
		-- if your character wasn't in this list it's because either idk how they would respond well enough to put them here or I think they wouldn't care.
		if cutscene:getCharacter("noelle") then
			cutscene:textTagged("* ...", "surprise_frown_b", "noelle")
		elseif cutscene:getCharacter("susie") then
			cutscene:textTagged("* ...", "nervous", "susie")
		elseif cutscene:getCharacter("ceroba") then
			cutscene:textTagged("* ...", "nervous", "ceroba")
		elseif cutscene:getCharacter("ralsei") then
			cutscene:textTagged("* ...", "concern", "ralsei")
		else
			cutscene:wait(2)
		end
		
		cutscene:textTagged("* tough crowd today, huh", "condescending", "dess")
		
		cutscene:wait(finishWalk)
		theOtherDess:remove()
		Game:addFlag("dessIsHereScene", 1, 0)
	end,
	
	desswalk2 = function(cutscene)
		cutscene:textTagged("* didjya see?[wait:10] we couldnt even walk through that massive gap", "condescending", "dess")
		
		cutscene:wait(2)
		
		cutscene:textTagged("* gee,[wait:6] tough crowd today, huh", "angry", "dess")
		
		Game:addFlag("dessIsHereScene", 1, 0)
	end,
	
	desswalk3 = function(cutscene)
		cutscene:textTagged("* ...", "angry", "dess")
		cutscene:textTagged("* wow, there were so many things wrong with that gate right now huh", "condescending", "dess")
		cutscene:textTagged("* ...", "angry", "dess")
		
		cutscene:wait(2)
		
		if #Game.party > 1 then
			cutscene:textTagged("* whats with everybody today, why so serious", "angry", "dess")
		end
		
		Game:addFlag("dessIsHereScene", 1, 0)
	end,
	
	desswalk4 = function(cutscene)
		cutscene:textTagged("* HEY GUYS do you see this DUMB GATE, I THI-[next]", "condescending", "dess")
		
		local theOtherDess = cutscene:getCharacter("dess", 1)
		local dess = cutscene:getCharacter("dess", 2)
		
		local party1
		local party2
		if Game.party[2] and Game.party[3] then
			party1 = cutscene:getCharacter(Game.party[2].actor.id)
			party2 = cutscene:getCharacter(Game.party[3].actor.id)
		elseif Game.party[2] then
			party1 = cutscene:getCharacter(Game.party[2].actor.id)
		end
		--print(party1)
		--print(party2)
		
		cutscene:detachFollowers()
		
		if party1 then
			cutscene:walkTo(party1, "partyspot1", 0.5, "down")
		end
		if party2 then
			cutscene:walkTo(party2, "partyspot2", 0.5, "down")
		end
		
		-- once again, if a character isn't here its because either idk how to add them or im not sure what they could add to the scene
		if cutscene:getCharacter("noelle") then
			cutscene:textTagged("* !!!", "shock", "noelle")
		elseif cutscene:getCharacter("susie") then
			cutscene:textTagged("* Hey um...!", "surprise_frown", "susie")
		elseif cutscene:getCharacter("ceroba") then
			-- again idk shit about UT yellow please fix this if not in character
			cutscene:textTagged("* Please,[wait:6] turn around.", "notsure", "ceroba")
		elseif cutscene:getCharacter("ralsei") then
			cutscene:textTagged("* N-not to alarm you Ms. Dess but...", "concern_smile", "ralsei")
		elseif cutscene:getCharacter("brenda") then
			cutscene:textTagged("* Um-!!!", "shocked", "brenda")
		end
		
		cutscene:look(dess, "left")
		cutscene:wait(1)
		cutscene:look(dess, "right")
		cutscene:wait(1)
		cutscene:look(dess, "up")
		cutscene:wait(0.5)
		if #Game.party > 1 then
			cutscene:textTagged("* what, whats all the fuss abou-[next]", "angry", "dess")
		end
		cutscene:look(dess, "down")
		theOtherDess.x, theOtherDess.y = cutscene:getMarker("summonDess")
		cutscene:detachCamera()
		Game.world.music:fade(0, 2)
		cutscene:wait(cutscene:panTo("summonDess", 4))
		dess.x, dess.y = cutscene:getMarker("dessspot")
		cutscene:wait(4)
		cutscene:textTagged("* Oh.", "angry", "dess", {nametag = "Other Dess?"})
		cutscene:wait(0.5)
		cutscene:textTagged("* Hi[wait:20] there.", "angry", "dess", {nametag = "Other Dess?"})
		cutscene:wait(cutscene:panTo(theOtherDess.x, theOtherDess.y - (SCREEN_HEIGHT/2), 2))
		cutscene:wait(4)
		cutscene:textTagged("* ...", "genuine", "dess")
		cutscene:textTagged("* ...Hi??? There????", "genuine_b", "dess")
		cutscene:wait(4)
		cutscene:textTagged("* You've been a pretty\ndamn big thorn in my\nside for a while,", "angry", "dess", {nametag = "Other Dess?"})
		cutscene:textTagged("* You know that?", "angry", "dess", {nametag = "Other Dess?"})
		cutscene:wait(4)
		cutscene:textTagged("* hey nowwwww", "heckyeah", "dess")
		cutscene:textTagged("* dont be like that haha", "thisremindsmeofthetimeiwasindarkplace", "dess")
		cutscene:wait(4)
		cutscene:textTagged("* h-[wait:5] haha.[wait:10] hah.", "thisremindsmeofthetimeiwasindarkplace", "dess")
		cutscene:wait(1)
		cutscene:textTagged("* You really screwed the goose this time.", "angry", "dess", {nametag = "Other Dess?"})
		cutscene:textTagged("* Can you even begin to know how much trouble you've caused?", "angry", "dess", {nametag = "Other Dess?"})
		cutscene:textTagged("* Or is that level of thought beyond you?", "angry", "dess", {nametag = "Other Dess?"})
		cutscene:wait(4)
		cutscene:textTagged("* Hey,[wait:5] actually,[wait:5] I got an idea.", "challenging", "dess", {nametag = "Other Dess?"})
		
		cutscene:walkToSpeed(theOtherDess, dess.x, dess.y+80, 4, "up")
		cutscene:panTo(dess.x, dess.y+40)
		
		local alone = false
		if #Game.party > 2 then
			cutscene:textTagged("* You two.", "neutral", "dess", {nametag = "Other Dess?"})
			
			if cutscene:getCharacter("noelle") then
				cutscene:textTagged("* Us?", "shock_b", "noelle")
			elseif cutscene:getCharacter("susie") then
				cutscene:textTagged("* I think I see where this\nis going.", "teeth_smile", "susie")
			elseif cutscene:getCharacter("ceroba") then
				-- again idk shit about UT yellow please fix this if not in character
				cutscene:textTagged("* Yeah?", "nervous_1", "ceroba")
			elseif cutscene:getCharacter("ralsei") then
				cutscene:textTagged("* U-uh,[wait:3] uh...", "blush_surprise", "ralsei")
			elseif cutscene:getCharacter("brenda") then
				cutscene:textTagged("* Yeah...?", "suspicious_b", "brenda")
			end
			
		elseif #Game.party > 1 then
			cutscene:textTagged("* You.", "neutral", "dess", {nametag = "Other Dess?"})
			
			if cutscene:getCharacter("noelle") then
				cutscene:textTagged("* Me?", "shock_b", "noelle")
			elseif cutscene:getCharacter("susie") then
				cutscene:textTagged("* I think I see where this\nis going.", "teeth_smile", "susie")
			elseif cutscene:getCharacter("ceroba") then
				-- again idk shit about UT yellow please fix this if not in character
				cutscene:textTagged("* Yeah?", "nervous_1", "ceroba")
			elseif cutscene:getCharacter("ralsei") then
				cutscene:textTagged("* U-uh,[wait:3] uh...", "blush_surprise", "ralsei")
			elseif cutscene:getCharacter("brenda") then
				cutscene:textTagged("* Yeah...?", "suspicious_b", "brenda")
			end
			
		else
			alone = true
		end
		
		if not alone then
			cutscene:textTagged("* I say you ditch the jerk\nand I get with your\ngroup instead.", "challenging", "dess", {nametag = "Other Dess?"})
			cutscene:textTagged("* Does that sound like a plan?", "heckyeah", "dess", {nametag = "Other Dess?"})
			
			cutscene:choicer({"Yes", "Yes"})
			
			cutscene:textTagged("* Then it's settled!", "heckyeah", "dess", {nametag = "Other Dess?"})
			
		else
			cutscene:textTagged("* I'm taking your spot,\nwhether you like it or not!", "angry", "dess", {nametag = "Other Dess?"})
		end
		
		-- walk towards dess and replace them
		cutscene:wait(cutscene:walkTo(theOtherDess, dess.x, dess.y, 1, "up"))
		if party1 then
			cutscene:look(party1, "up")
		end
		if party2 then
			cutscene:look(party2, "up")
		end
		theOtherDess.x = dess.x
		theOtherDess.y = dess.y
		cutscene:look(dess, "up")
		
		Game.party[1]:reInit(true)
		Assets.playSound("wing")
		cutscene:shakeCharacter(theOtherDess, 0, 4)
		cutscene:look(theOtherDess, "right")
		cutscene:wait(cutscene:walkTo(theOtherDess, dess.x-40, dess.y, 0.5, "right", true))
		cutscene:look(dess, "left")
		cutscene:wait(4)
		
		cutscene:textTagged("* wh-", "beady", "dess")
		cutscene:textTagged("* you cant be /srs", "angy", "dess")
		
		cutscene:textTagged("* Oh yes I aaaam!", "condescending", "dess", {nametag = "Other Dess?"})
		cutscene:textTagged("* See you next game!", "wink", "dess", {nametag = "Other Dess?"})
		
		cutscene:look(theOtherDess, "up")
		cutscene:wait(cutscene:walkTo(theOtherDess, theOtherDess.x, theOtherDess.y+80, 2, "up", true))
		cutscene:look(dess, "down")
		if party1 then
			cutscene:look(party1, "down")
		end
		if party2 then
			cutscene:look(party2, "down")
		end
		cutscene:wait(1)
		cutscene:look(theOtherDess, "right")
		cutscene:wait(2)
		cutscene:look(theOtherDess, "up")
		cutscene:wait(cutscene:walkTo(theOtherDess, theOtherDess.x, theOtherDess.y+80, 2, "up", true))
		cutscene:wait(1)
		cutscene:textTagged("* What are you waiting for?", "condescending", "dess", {nametag = "Other Dess?"})
		cutscene:textTagged("* Get lost!", "angry", "dess", {nametag = "Other Dess?"})
		cutscene:panTo("dessspot")
		cutscene:wait(cutscene:walkTo(theOtherDess, theOtherDess.x, theOtherDess.y+SCREEN_HEIGHT, 2, "down"))
		theOtherDess:remove()
		
		cutscene:wait(4)
		
		-- reactions and cleanup exposition time
		local convoHappened = false
		local noelleConvoHappened = false
		if cutscene:getCharacter("noelle") then
			noelleConvoHappened = true
			local noelle = cutscene:getCharacter("noelle")
			noelle.actor:set("shocked")
			cutscene:textTagged("* ", "what", "noelle")
			cutscene:textTagged("* Wait,[wait:5] wait, wait!", "shock", "noelle")
			noelle.actor:set("walk_happy")
			cutscene:lookAt(noelle, Utils.facingFromAngle(Utils.angle(noelle, dess)))
			cutscene:textTagged("* So then you-...[wait:5] you're--!!", "blush_surprise", "noelle")
			cutscene:lookAt(dess, Utils.facingFromAngle(Utils.angle(dess, noelle)))
			cutscene:textTagged("* Hm?", "eyebrow", "dess")
			cutscene:wait(cutscene:moveTo(noelle, dess.x-40, dess.y, 0.5))
			noelle.visible = false
			local susie = cutscene:getCharacter("susie")
			if susie then
				susie.actor:set("shock_right")
			end
			cutscene:wait(cutscene:setAnimation(dess, {"bighug", 2/30, false}))
			cutscene:wait(1)
			cutscene:textTagged("* DESS!!![wait:20] The real one!", "blush_big_smile", "noelle")
			cutscene:textTagged("* Uh?[wait:5] Uh?[wait:5] Uh???", "wtf_b", "dess")
			noelle.visible = true
			dess.actor:resetSprite()
			if susie then
				susie.actor:resetSprite()
			end
			cutscene:textTagged("* Um,[wait:5] uh,[wait:5] I'm sorry but...", "wtf", "dess")
			cutscene:textTagged("* I don't think...[wait:5] we've met?", "wtf", "dess")
			noelle.actor:set("walk")
			cutscene:textTagged("* What?", "surprise_frown", "noelle")
			noelle.actor:set("walk_sad")
			cutscene:look(noelle, "down")
			cutscene:textTagged("[speed:0.6]* Oh...[wait:5][speed:0.8] I guess you still look the same as the other Dess.", "sad_side", "noelle")
			cutscene:textTagged("[speed:0.8]* Which is nothing like the Dess I know.", "dejected", "noelle")
			noelle.actor:set("walk_smile")
			cutscene:look(noelle, "right")
			cutscene:textTagged("* S-[wait:5] sorry for jumping on you like that, then.", "sad_b", "noelle")
			cutscene:textTagged("* Don't think anything of it.", "smile_closed", "noelle")
			noelle.actor:set("walk")
			if party1 == noelle then
				noelle:walkTo("partyspot1", 1, "right")
			else
				noelle:walkTo("partyspot2", 1, "left")
			end
			cutscene:lookAt(dess, Utils.facingFromAngle(Utils.angle(dess, noelle)))
			cutscene:textTagged("* Uh...[wait:5] don't worry 'bout it.", "genuine", "dess")
			cutscene:textTagged("* Sorry for getting your hopes up.", "neutral_c", "dess")
			cutscene:look(dess, "down")
		end
		
		if cutscene:getCharacter("susie") and not convoHappened then
			convoHappened = true
			if not noelleConvoHappened then
				cutscene:textTagged("* Oh um,[wait:5] nice to finally,[wait:5] um,[wait:5] talk.", "nervous", "susie")
				cutscene:textTagged("* I've... heard a lot about you.", "sus_nervous", "susie")
			end
			cutscene:textTagged("* Soooo...", "neutral_side", "susie")
			cutscene:textTagged("* What the hell is going on?", "annoyed", "susie")
		end
		
		if cutscene:getCharacter("ceroba") and not convoHappened then
			-- again idk shit about UT yellow please fix this if not in character
			convoHappened = true
			if noelleConvoHappened then
				cutscene:textTagged("* If I may inturrupt...", "confounded", "ceroba")
			end
			cutscene:textTagged("* A lot just happened at once.\n* Can you explain?", "neutral", "ceroba")
		end
		
		if cutscene:getCharacter("ralsei") and not convoHappened then
			if noelleConvoHappened then
				cutscene:textTagged("* ...um...", "blush_surprise", "ralsei")
			end
			cutscene:textTagged("* er...?", "concern_smile", "ralsei")
		end
		
		if cutscene:getCharacter("brenda") and not convoHappened then
			cutscene:textTagged("* Heh?", "neutral", "brenda")
		end
		
		if #Game.party > 1 then
			cutscene:textTagged("* Oh,[wait:2] right.\n* There's lots to go over.", "eyebrow", "dess")
			cutscene:textTagged("* It's hard to explain,[wait:5] like really hard.", "neutral_b", "dess")
			cutscene:textTagged("* Actually...", "neutral_c", "dess")
			cutscene:textTagged("* Here's not the best place.", "neutral", "dess")
			cutscene:textTagged("* Let's go,[wait:5] there should\nbe a spot to sit down ahead.", "neutral", "dess")
			cutscene:textTagged("* Right, you have the keycard yeah?", "eyebrow", "dess")
			cutscene:textTagged("* Pop that baby in the reader for me.", "heckyeah", "dess")
			cutscene:look(dess, "up")
			if party2 then
				cutscene:look(party1, "up")
				cutscene:wait(cutscene:walkTo(party2, "keycardSpot", 1, "up"))
			else
				cutscene:wait(cutscene:walkTo(party1, "keycardSpot", 1, "up"))
			end
		else
			cutscene:wait(cutscene:walkTo(dess, "keyCardSpot", 1, "up"))
		end
		Assets.playSound("card_swipe")
		cutscene:wait(2)
		
		cutscene:textTagged("* ... eh?[wait:10]\n* Nothing happened.", "eyebrow", "dess")
		cutscene:textTagged("* Let's just... try anyways??", "neutral_b", "dess")
		
		Game.world.music:fade(1)
		
		Game:setFlag("inDessIntro", false)
		cutscene:attachCamera(1)
		cutscene:attachFollowers(4)
		cutscene:wait(4)
		
		
	end,
	
}