local params = require("params")

love.graphics.setBackgroundColor(1, 1, 1)
grid_y = params.win_height / params.cell_size - 5
grid_x = params.win_width / params.cell_size

  -- creating the grid:
  for j = 0, grid_y do
    grid[j] = {}
    for i = 0, grid_x do
      grid[j][i] = false
    end
  end

