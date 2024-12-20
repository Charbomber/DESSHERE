
local Item, super = Class("Item")

function Item:getReactions()
	if Game:getFlag("realDess") and self.rdReactions then
		return self.rdReactions
	else
		return self.reactions
	end
end

return Item