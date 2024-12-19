return {
    ---@param cutscene WorldCutscene
    main = function(cutscene, map, partyleader)
        if map == "desslocks" then
            --local dess = cutscene:getCharacter("dess")
            --cutscene:textTagged("* Where am I?", nil, "dess")
			--cutscene:textTagged("* Where am I?", nil, "dess")
			--cutscene:textTagged("* Where am I?", nil, "dess")
			--cutscene:textTagged("* Where am I?", nil, "dess")
			cutscene:text("* (But your voice echoed aimlessly.)\n                       aimlessly  \n                       aimlessly  \n                       aimlessly  \n                       aimlessly  \n                       aimlessly  ")
        elseif map == "field" then
			
        else
            cutscene:text("* (But your voice echoed aimlessly.)")
        end
    end,
}