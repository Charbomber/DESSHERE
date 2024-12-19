local StuckCheck, super = Class(Event)

function StuckCheck:init(data)
    super.init(self, data.x, data.y, data.width, data.height)

    self.solid = Game:getFlag("inDessIntro") or Game:getFlag("realDess")
end

return StuckCheck