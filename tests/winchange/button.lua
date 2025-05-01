local Button = {}

function Button.new(x, y, width, height, text, onClick)
  local self = {
    x = x,
    y = y,
    width = width,
    height = height,

    text = text or "",
    font = love.graphics.getFont(),
    color = {0.4, 0.4, 0.8},     -- blue
    hoverColor = {0.6, 0.6, 1}, -- light blue
    textColor = {1, 1, 1},      -- white
    textOffset = {x=0, y=0},     -- text position

    onClick = onClick or function() end,
    isHovered = false,
    isPressed = false
  }
  return setmetatable(self, {__index = Button})
end

function Button:draw()
  -- Draw button
  local color = self.isPressed and {0.3, 0.3, 0.7} or -- and returns the second operator if the first is truthy 
                self.isHovered and self.hoverColor or
                self.color
  love.graphics.setColor(color)
  love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)

  -- Add text
  love.graphics.setColor(self.textColor)
  local textWidth = self.font:getWidth(self.text)
  local textHeight = self.font:getHeight()
  love.graphics.print(
    self.text,
    self.x + (self.width - textWidth)/2 + self.textOffset.x,
    self.y + (self.height - textHeight)/2 + self.textOffset.y
  )
end

function Button:update()
  local mx, my = love.mouse.getPosition()
  self.isHovered = mx >= self.x and mx <= self.x + self.width and
                   my >= self.y and my <= self.y + self.height

  if self.isHovered and love.mouse.isDown(1) then
    self.isPressed = true
  else
    if self.isHovered and self.isPressed then
      self.onClick()
    end
    self.isPressed = false
  end

end

return Button

