local params = require("parameters")
local Button = require("button")
local Grid = require("grid")
local cursor_atXcell
local cursor_atYcell

local GameState = {
  MENU = 1,
  PLAYING = 2
}
local currentState = GameState.MENU

local menu = require("menu")

local grid
-- Buttons
local clearGrid
local clearBtn = Button.new(20, params.win_height-22, 110, 20, "Clear The Grid", function() Grid.clear(grid) end)
local backmenuBtn = Button.new(140, params.win_height-22, 100, 20, "Back to Menu", function() currentState = GameState.MENU end)

-- --------------
-- Love.load
-- --------------
function love.load()
  love.window.setTitle("Conway's Game of Life")
  love.window.setMode(params.win_width, params.win_height)
  love.keyboard.setKeyRepeat(true)

  grid = Grid.create_grid()

  if currentState == GameState.MENU then
    menu:load()
    menu.buttons[1].onClick = function()
      currentState = GameState.PLAYING
    end
    local centerBtn = params.win_width/2 - menu.buttons[1].width/2
    menu.buttons[1].x = centerBtn
    menu.buttons[2].x = centerBtn
  end
end


-- --------------
-- Love.draw
-- --------------
function love.draw()
  if currentState == GameState.MENU then
    menu:draw()
  elseif currentState == GameState.PLAYING then
    clearBtn:draw()
    Grid.draw_grid(grid, cursor_atXcell, cursor_atYcell)
    backmenuBtn:draw()
  end
end

-- --------------
-- Love.update
-- --------------
function love.update()
  if currentState == GameState.MENU then
    menu:update()
  elseif currentState == GameState.PLAYING then
    clearBtn:update()
    backmenuBtn:update()
    cursor_atXcell = math.floor(love.mouse.getX() / params.cell_size) + 1
    cursor_atYcell = math.floor(love.mouse.getY() / params.cell_size) + 1
    --if love.mouse.isDown(1) and cursor_atXcell <= params.grid_x and cursor_atYcell <= params.grid_y then
      --grid[cursor_atYcell][cursor_atXcell] = true
    --end
    Grid.select(grid, cursor_atXcell, cursor_atYcell)
  end
end

function love.keypressed(key)
  if key == "escape" then
    print("Coming out of the grid")
    love.event.quit()
  elseif key == "space" then
    print("space pressed")
    grid = Grid.next_grid(grid)
  end
end


