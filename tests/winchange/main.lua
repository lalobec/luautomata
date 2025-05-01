local Win = require("win")
local Button = require("button")
local buttons = {}
local WinState = {
  win1 = 1,
  win2 = 2
}
local currentState = WinState.win1

local win1 = Win:new({0.2, 0.7, 0.3})
local win2 = Win:new({0.6, 0.8, 0.3})

function love.load()

  if currentState == WinState.win1 then
    win1:load()
  elseif currentState == WinState.win2 then
    win2:load()
  end

  local startBtn = Button.new(100, 200, 200, 50, "Go to win 2", function()
    print("Go to win 2")
    currentState = WinState.win2
  end)
  local quitBtn = Button.new(100, 300, 200, 50, "Go to win 1", function()
    print("Go to win 1")
    currentState = WinState.win1
  end)
  table.insert(buttons, startBtn)
  table.insert(buttons, quitBtn)
end

function love.draw()
  if currentState == WinState.win1 then
    buttons[1]:draw()
    win1:load()
  elseif currentState == WinState.win2 then
    buttons[2]:draw()
    win2:load()
  end
  --for _, btn in ipairs(buttons) do
    --btn:draw()
  --end
end

function love.update()
  if currentState == WinState.win1 then
    buttons[1]:update()
    win1:load()
  elseif currentState == WinState.win2 then
    buttons[2]:update()
    win2:load()
  end
  --for _, btn in ipairs(buttons) do
    --btn:update()
  --end
end

