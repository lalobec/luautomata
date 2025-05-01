## Code Snippets
### Generic button from IA
```lua
-- button.lua
local Button = {}
Button.__index = Button
function Button.new(x, y, width, height, text, onClick)
    local self = setmetatable({}, Button)
    self.x = x
    self.y = y
    self.width = width
    self.height = height
    self.text = text
    self.onClick = onClick or function() end
    self.isHovered = false
    return self
end
-- Add the same draw/update/mousePressed methods as above
-- ...
return Button
```
Use this as 
```lua
local Button = require("button")

local buttons = {}

function love.load()
    table.insert(buttons, Button.new(100, 100, 200, 50, "Start Game", function()
        print("Starting game...")
    end))
end
```
