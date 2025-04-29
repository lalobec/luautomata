  -- Print cursor position
if cursor_atXcell <= grid_x and cursor_atYcell <= grid_y then
  love.graphics.setColor(0,0,0)
  love.graphics.print('Mouse x position: '..cursor_atXcell)
  love.graphics.print('Mouse y position: '..cursor_atYcell, 0, 20)
end


-- This functions together with the one below is for printing the number of neighbors
function love.mousepressed(x, y, btn)
  if btn == 2 then
    neighbors = count_neighbors_cursor()
    print("Total neighbors found: "..neighbors)
  end
end

function count_neighbors_cursor()
  neighbors = 0
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
  return neighbors
end

