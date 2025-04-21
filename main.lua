require ("button")
local cell_size = 20
local cursor_atXcell
local cursor_atYcell
local grid_y
local grid_x

local WIN_WIDTH = 800
local WIN_HEIGHT = 600

function love.load()
  love.window.setMode(WIN_WIDTH, WIN_HEIGHT)

  love.graphics.setBackgroundColor(1, 1, 1)
  grid_y = 20
  grid_x = 20

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

  -- Highlight the cell at cursor position
  -- love.graphics.setColor(love.math.colorFromBytes(61, 141, 122))
  -- love.graphics.rectangle("fill", (cursor_atXcell-1)*cell_size, (cursor_atYcell-1)*cell_size, cell_size-1, cell_size-1)
  -- Now implemented with an if statement
  button("Clear The Grid", 430,300)
  button("Exit The Grid", 430,340)
end

function love.update()
  cursor_atXcell = math.floor(love.mouse.getX() / cell_size) + 1
  cursor_atYcell = math.floor(love.mouse.getY() / cell_size) + 1
  if love.mouse.isDown(1) and cursor_atXcell <= grid_x and cursor_atYcell <= grid_y then
    grid[cursor_atYcell][cursor_atXcell] = true
  end
end

