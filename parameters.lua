local params = {
  cell_size = 5,
  win_width = 1200,
  win_height = 800,
}

params.grid_y = params.win_height / params.cell_size - 5
params.grid_x = params.win_width / params.cell_size

return params

