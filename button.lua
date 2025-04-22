-- this is for the button

--[[ First try for the button implementation...
function button(text, x_pos, y_pos)
  love.graphics.setColor(0.86, 0.86, 0.86)
  love.graphics.rectangle("fill", x_pos, y_pos, 100, 30)
  love.graphics.setColor(0, 0, 0)
  love.graphics.print(text, x_pos + 8, y_pos + 8)
end
--]]

local button = {
  x = 600,
  y = 300,
  width = 100,
  height = 30,
  text = "set the text",
  color = {0.4, 0.4, 0.8}, --love.math.colorFromBytes(61, 101, 122),
  hover_color = {0.6, 0.6, 1}, --love.math.colorFromBytes(51, 131, 112),
  isHovered = false
}

function button:draw() -- equivalent to button.draw = function(self)
  if self.isHovered then
    love.graphics.setColor(self.hover_color)
  else
    love.graphics.setColor(self.color)
  end

  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
  love.graphics.setColor(1, 1, 1)
  local font = love.graphics.getFont()
  local textWidth = font:getWidth(self.text)
  local textHeight = font:getHeight()
  love.graphics.print(
      self.text,
      self.x + (self.width - textWidth) / 2,
      self.y + (self.height - textHeight) / 2
  )

end

function button:update()
  local mouseX, mouseY = love.mouse.getPosition()
  self.isHovered = mouseX >= self.x and mouseX <= self.x + self.width and mouseY >= self.y and mouseY <= self.y + self.height
end

function button:pressed()
  if self.isHovered then
    print("button clicked")
    return true
  end
  return false
end

return button
