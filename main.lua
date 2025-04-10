local cell_size = 20
local cursor_atXcell
local cursor_atYcell
local grid_y
local grid_x

function love.load()
  love.graphics.setBackgroundColor(1, 1, 1)
  grid_y = 50
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
  for y = 1, grid_y do
    local cell_ypos = cell_size * (y-1)
    for x = 1, grid_x do
      local cell_xpos = cell_size * (x-1)
      if grid[y][x] then
        love.graphics.setColor(love.math.colorFromBytes(61, 141, 122))
      else
        love.graphics.setColor(0.86, 0.86, 0.86)
      end
      love.graphics.rectangle("fill", cell_xpos, cell_ypos, cell_size-1, cell_size-1)
    end
  end

  -- Print cursor position
  love.graphics.setColor(0,0,0)
  love.graphics.print('Mouse x position: '..cursor_atXcell)
  love.graphics.print('Mouse y position: '..cursor_atYcell, 0, 20)

  -- Highlight the cell at cursor position
  love.graphics.setColor(love.math.colorFromBytes(61, 141, 122))
  love.graphics.rectangle("fill", (cursor_atXcell-1)*cell_size, (cursor_atYcell-1)*cell_size, cell_size-1, cell_size-1)
end

function love.update()
  cursor_atXcell = math.floor(love.mouse.getX() / cell_size) + 1
  cursor_atYcell = math.floor(love.mouse.getY() / cell_size) + 1
end

