local gen_button = require("generic_button")
local cell_size = 5
local cursor_atXcell
local cursor_atYcell
local grid_y
local grid_x

local grid = {}
local neighbors = 0

local WIN_WIDTH = 800
local WIN_HEIGHT = 600

local clear_button = gen_button.new(20, WIN_HEIGHT-22, 110, 20, "Clear The Grid")
local b2 = gen_button.new(140, WIN_HEIGHT - 22, 100, 20, "Test button")

function love.load()
  love.window.setTitle("Conway's Game of Life")
  love.window.setMode(WIN_WIDTH, WIN_HEIGHT)

  love.keyboard.setKeyRepeat(true)

  love.graphics.setBackgroundColor(1, 1, 1)
  grid_y = WIN_HEIGHT / cell_size - 5
  grid_x = WIN_WIDTH / cell_size

  -- creating the alive_grid:
  for j = 0, grid_y do
    grid[j] = {}
    for i = 0, grid_x do
      grid[j][i] = false
    end
  end
  --grid[3][3] = true
end

function love.draw()
  clear_button:draw()
  for y = 1, grid_y do
    local cell_ypos = cell_size * (y-1)
    for x = 1, grid_x do
      local cell_xpos = cell_size * (x-1)
      if x == cursor_atXcell and y == cursor_atYcell then
        love.graphics.setColor(love.math.colorFromBytes(61, 141, 122))
      elseif grid[y][x] then
        love.graphics.setColor(love.math.colorFromBytes(61, 101, 122))
      else
        love.graphics.setColor(0.86, 0.86, 0.86)
      end
      love.graphics.rectangle("fill", cell_xpos, cell_ypos, cell_size-1, cell_size-1)
    end
  end
  b2:draw()
end

function love.update()
  clear_button:hover()
  b2:hover()
  cursor_atXcell = math.floor(love.mouse.getX() / cell_size) + 1
  cursor_atYcell = math.floor(love.mouse.getY() / cell_size) + 1
  if love.mouse.isDown(1) and cursor_atXcell <= grid_x and cursor_atYcell <= grid_y then
    grid[cursor_atYcell][cursor_atXcell] = true
  end
end

function love.mousepressed(x, y, btn)
  if btn == 1 then
    if b2:pressed() or clear_button:pressed() then
      for j = 0, grid_y do
      grid[j] = {}
        for i = 0, grid_x do
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
    local nextGrid = {}
    for y = 1, grid_y do
      nextGrid[y] = {}
      for x = 1, grid_x do
        neighbors = count_neighbors(y, x)
        if grid[y][x] then
          if neighbors < 2 or neighbors > 3 then
            nextGrid[y][x] = false
          else
            nextGrid[y][x] = true
          end
        elseif not grid[y][x] and neighbors == 3 then
          nextGrid[y][x] = true
        end
      end
    end
    grid = nextGrid
  end
end

function count_neighbors(y, x)
  neighbors = 0
  for dy = -1, 1 do
    for dx = -1, 1 do
      if not (dy == 0 and dx == 0) and grid[y+dy] and grid[y+dy][x+dx] then
          neighbors = neighbors + 1
      end
    end
  end
  return neighbors
end

