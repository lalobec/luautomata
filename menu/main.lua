local GameState = {
  MENU = 1,
  PLAYING = 2
}
local currentState = GameState.MENU

local Menu = require("menu")
local menu = Menu

function love.load()
  love.graphics.setBackgroundColor(1, 1, 1)
  menu:load()
end

function love.update()
  if currentState == GameState.MENU then
    menu:update()
  end
end

function love.draw()
  love.graphics.clear()
  if currentState == GameState.MENU then
    menu:draw()
  else
    love.graphics.print("test")
  end
end

function love.mousepressed(x, y, btn)
  if btn == 1 and menu:start() then
    print("starting")
    currentState = GameState.PLAYING
  elseif btn == 1 and menu:exit() then
    print("Quitting")
    love.event.quit()
  end
end

