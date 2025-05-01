local GameState = {
  MENU = 1,
  PLAYING = 2
}
local currentState = GameState.MENU

local menu = require("menu")
local game = require("game")

function love.load()
  menu:load()
  game:load()
end

function love.update()
  if currentState == GameState.MENU then
    menu:update()
  end
end

function love.draw()
  if currentState == GameState.MENU then
    menu:draw()
  else
    love.graphics.setBackgroundColor(1, 1, 1)
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

