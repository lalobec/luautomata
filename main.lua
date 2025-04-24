local button = require("button")
local cell_size = 10
local cursor_atXcell
local cursor_atYcell
local grid_y
local grid_x

local WIN_WIDTH = 800
local WIN_HEIGHT = 600

function love.load()
  love.window.setMode(WIN_WIDTH, WIN_HEIGHT)
  button.text = "Clear The Grid"
  button.y = WIN_HEIGHT - button.height
  button.x = 10

  love.graphics.setBackgroundColor(1, 1, 1)
  grid_y = 45
  grid_x = 50

  -- creating the alive_grid:
  grid = {}
  for j = 0, grid_y do
    grid[j] = {}
    for i = 0, grid_x do
      grid[j][i] = false
    end
  end
  grid[3][3] = true
  grid[3][4] = true
  grid[4][3] = true
end

function love.draw()
  button:draw()
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

  -- Print cursor position
  if cursor_atXcell <= grid_x and cursor_atYcell <= grid_y then
    love.graphics.setColor(0,0,0)
    love.graphics.print('Mouse x position: '..cursor_atXcell)
    love.graphics.print('Mouse y position: '..cursor_atYcell, 0, 20)
  end
end

function love.update()
  button:update()
  cursor_atXcell = math.floor(love.mouse.getX() / cell_size) + 1
  cursor_atYcell = math.floor(love.mouse.getY() / cell_size) + 1
  if love.mouse.isDown(1) and cursor_atXcell <= grid_x and cursor_atYcell <= grid_y then
    grid[cursor_atYcell][cursor_atXcell] = true
  end
end

function love.mousepressed(x, y, btn)
  if btn == 1 then
    if button:pressed() then
      for j = 0, grid_y do
      grid[j] = {}
        for i = 0, grid_x do
          grid[j][i] = false
        end
      end
    end
  end
  if btn == 2 then
    local neighbors = 0
    print("Counting the neighbors at the clicked position...")
    for dy = -1, 1 do
      for dx = -1, 1 do
        --if dy ~= 0 and dx ~= 0 and grid[cursor_atYcell+dy] and grid[cursor_atYcell+dy][cursor_atXcell+dx] then
        -- We need a nor gate for the first check: when dx=dy=0, that's the cell in question, cannot be a neighbor
        -- Then we check if a cell exists at grid[+dy], if it does, we can search the cell with the third statement
        if not (dy == 0 and dx == 0) and grid[cursor_atYcell+dy] and grid[cursor_atYcell+dy][cursor_atXcell+dx] then
          print("Neighbor found here")
          neighbors = neighbors + 1
        end
      end
    end
    print("Total neighbors found: "..neighbors)
  end
end

