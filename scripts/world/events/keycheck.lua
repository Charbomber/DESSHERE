local KeyCheck, super = Class(Event)

function KeyCheck:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

    self.solid = not Game.inventory:hasItem("keyCard")
end

return KeyCheck