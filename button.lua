-- this is for the button

function button(text, x_pos, y_pos)
  love.graphics.setColor(0.86, 0.86, 0.86)
  love.graphics.rectangle("fill", x_pos, y_pos, 100, 30)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print(text, x_pos + 8, y_pos + 8)
end

