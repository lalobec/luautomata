local menu = require("menu")

function love.load()
  love.graphics.setBackgroundColor(1, 1, 1)
  menu:load()
end

function love.update()
  menu:update()
end

function love.draw()
  menu:draw()
end

