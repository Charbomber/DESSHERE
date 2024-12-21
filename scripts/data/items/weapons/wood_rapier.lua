local item, super = Class(Item, "wood_rapier")

function item:init()
    super.init(self)

    -- Display name
    self.name = "Wood Rapier"

    -- Item type (item, key, weapon, armor)
    self.type = "weapon"
    -- Item icon (for equipment)
    self.icon = "ui/menu/icon/rapier"

    -- Battle description
    self.effect = ""
    -- Shop description
    self.shop = ""
    -- Menu description
    self.description = "A wooden practice rapier with a bark-\neinforced shell."

    -- Default shop price (sell price is halved)
    self.price = 60
    -- Whether the item can be sold
    self.can_sell = true

    -- Consumable target mode (ally, party, enemy, enemies, or none)
    self.target = "none"
    -- Where this item can be used (world, battle, all, or none)
    self.usable_in = "all"
    -- Item this item will get turned into when consumed
    self.result_item = nil
    -- Will this item be instantly consumed in battles?
    self.instant = false

    -- Equip bonuses (for weapons and armor)
    self.bonuses = {
        attack = 0,
    }
    -- Bonus name and icon (displayed in equip menu)
    self.bonus_name = nil
    self.bonus_icon = nil

    -- Equippable characters (default true for armors, false for weapons)
    self.can_equip = {
        frisk = true,
    }

    -- Character reactions
    self.reactions = {
        susie = "What's this!? A TOOTHPICK?",
        ralsei = "That's yours, Frisk...",
        noelle = "(wow...)",
		dess = "Its not cool enough",
    }
	self.rdReactions = Utils.copy(self.reactions)
	self.rdReactions["dess"] = "Fencing is for geeks."
end

function item:convertToLightEquip(chara)
    return "ut_weapons/stick"
end

return item