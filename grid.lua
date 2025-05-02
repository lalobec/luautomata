local params = require("parameters")

local Grid = {}

function Grid.create_grid()
	-- creating the grid:
  local grid = {}
	for j = 0, params.grid_y do
		grid[j] = {}
		for i = 0, params.grid_x do
			grid[j][i] = false
		end
	end
  return grid
end

function Grid.draw_grid(grid, cursor_xcell, cursor_ycell)
  for y = 1, params.grid_y do
    local cell_ypos = params.cell_size * (y-1)
    for x = 1, params.grid_x do
      local cell_xpos = params.cell_size * (x-1)
      if x == cursor_xcell and y == cursor_ycell then
        love.graphics.setColor(love.math.colorFromBytes(61, 141, 122))
      elseif grid[y][x] then
        love.graphics.setColor(love.math.colorFromBytes(61, 101, 122))
      else
        love.graphics.setColor(0.86, 0.86, 0.86)
      end
      love.graphics.rectangle("fill", cell_xpos, cell_ypos, params.cell_size-1, params.cell_size-1)
    end
  end
end

function Grid.select(grid, mx_cell, my_cell)
  if love.mouse.isDown(1) and mx_cell <= params.grid_x
                          and my_cell <= params.grid_y then
      grid[my_cell][mx_cell] = true
  end
end

local function count_neighbors(grid, y, x)
  local neighbors = 0
  for dy = -1, 1 do
    for dx = -1, 1 do
      if not (dy == 0 and dx == 0) and grid[y+dy] and grid[y+dy][x+dx] then
          neighbors = neighbors + 1
      end
    end
  end
  return neighbors
end


function Grid.next_grid(grid)
  local nextGrid = {}
    for y = 1, params.grid_y do
      nextGrid[y] = {}
      for x = 1, params.grid_x do
        local neighbors = count_neighbors(grid, y, x)
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
  return nextGrid
end

function Grid.clear(grid)
  for j = 0, params.grid_y do
  grid[j] = {}
    for i = 0, params.grid_x do
      grid[j][i] = false
    end
  end
  return grid
end


return Grid
