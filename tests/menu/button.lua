local Button = {}           -- Creates a metatable
Button.__index = Button     -- Define the index metamethod 
function Button.new(x, y, width, height, text, onClicFunction)
  local self = setmetatable({}, Button)
  self.x = x
  self.y = y
  self.width = width
  self.height = height
  self.text = text
  self.onClic = onClicFunction
  self.isHovered = false
  return self
end

function Button:draw()
  if self.isHovered then
    love.graphics.setColor(0.6, 0.6, 1)
  else
    love.graphics.setColor(0.4, 0.4, 0.8)
  end
  -- print("Drawing the button at ", self.x, self.y)
  love.graphics.rectangle("fill", self.x, self.y, self.width,
    self.height, 4, 4)
  love.graphics.setColor(1, 1, 1)
  love.graphics.getFont()
  local font = love.graphics.getFont()
  font:setFilter("nearest", "nearest")
  local textWidth = font:getWidth(self.text)
  local textHeight = font:getHeight()
  love.graphics.print(self.text,
    self.x + (self.width - textWidth) / 2,
    self.y + (self.height - textHeight) / 2)
end

function Button:hover()
  local mouseX, mouseY = love.mouse.getPosition()
  if mouseX >= self.x and mouseX <= self.x + self.width and
  mouseY >= self.y and mouseY <= self.y + self.height then
    self.isHovered = true
  else
    self.isHovered = false
  end
end

function Button:pressed()
  if self.isHovered then
    print("genbutton clicked")
    return true
  end
  return false
end

return Button
