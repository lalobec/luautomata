local Win = {}

function Win:new(color)
  local self = {
    color = color
  }
  return setmetatable(self, {__index = Win})
end

function Win:load()
  love.graphics.setBackgroundColor(self.color)
end

return Win
