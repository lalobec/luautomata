local Button = require("button")

local Menu = {
  buttons = {}
}

function Menu:load()
  table.insert(self.buttons, Button.new(0, 0, 200, 20, "Start Game of Life", function() self:start() end, false))
  table.insert(self.buttons, Button.new(0, 30, 200, 20, "Exit", function() self:exit() end, false))
end

function Menu:draw()
  self.buttons[1]:draw()
  self.buttons[2]:draw()
end

function Menu:update()
  self.buttons[1]:hover()
  self.buttons[2]:hover()
  if self.buttons[1].isHovered and love.mouse.isDown(1) then
    self:start()
  end
  if self.buttons[2].isHovered and love.mouse.isDown(1) then
    self:exit()
  end
end

function Menu:start()
  print("Starting game")
end

function Menu:exit()
  love.event.quit()
end

return Menu
