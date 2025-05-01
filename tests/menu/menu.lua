local Button = require("button")

local Menu = {
  buttons = {}
}

function Menu:load()
  table.insert(self.buttons, Button.new(0, 0, 200, 20, "Start Game of Life", function() self:start() end))
  table.insert(self.buttons, Button.new(0, 30, 200, 20, "Exit", function() self:exit() end))
end

function Menu:draw()
  self.buttons[1]:draw()
  self.buttons[2]:draw()
end

function Menu:update()
  self.buttons[1]:hover()
  self.buttons[2]:hover()
end

function Menu:start()
  if self.buttons[1].isHovered then
    return true
  end
end

function Menu:exit()
  if self.buttons[2].isHovered then
    return true
  end
end

return Menu
