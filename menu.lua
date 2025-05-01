local Button = require("generic_button")

local Menu = {
  buttons = {}
}

function Menu:load()
  love.graphics.setBackgroundColor(1, 1, 1)
  table.insert(self.buttons, Button.new(0, 0, 200, 20, "Start Game of Life"))
  table.insert(self.buttons, Button.new(0, 30, 200, 20, "Exit", function() love.event.quit() end))
end

function Menu:draw()
  self.buttons[1]:draw()
  self.buttons[2]:draw()
end

function Menu:update()
  self.buttons[1]:update()
  self.buttons[2]:update()
end

return Menu
