local params = require("parameters")
local gen_button = require("generic_button")
local Grid = require("grid")
local menu = require("menu")
local cursor_atXcell
local cursor_atYcell

local neighbors = 0
local grid = Grid.create_grid()

-- Buttons
local clear_button = gen_button.new(20, params.win_height-22, 110, 20, "Clear The Grid")
local b2 = gen_button.new(140, params.win_height-22, 100, 20, "Test button")

-- --------------
-- Love.load
-- --------------
function love.load()
  love.window.setTitle("Conway's Game of Life")
  love.window.setMode(params.win_width, params.win_height)
  love.keyboard.setKeyRepeat(true)
  love.graphics.setBackgroundColor(1, 1, 1)
end


-- --------------
-- Love.draw
-- --------------
function love.draw()
  clear_button:draw()
  Grid.draw_grid(grid, cursor_atXcell, cursor_atYcell)
  b2:draw()
end

-- --------------
-- Love.update
-- --------------
function love.update()
  clear_button:hover()
  b2:hover()
  cursor_atXcell = math.floor(love.mouse.getX() / params.cell_size) + 1
  cursor_atYcell = math.floor(love.mouse.getY() / params.cell_size) + 1
  if love.mouse.isDown(1) and cursor_atXcell <= params.grid_x and cursor_atYcell <= params.grid_y then
    grid[cursor_atYcell][cursor_atXcell] = true
  end
end

function love.mousepressed(x, y, btn)
  if btn == 1 then
    if clear_button:pressed() then
      for j = 0, params.grid_y do
      grid[j] = {}
        for i = 0, params.grid_x do
          grid[j][i] = false
        end
      end
    end
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


