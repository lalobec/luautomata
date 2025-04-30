local gen_button = require("generic_button")
local params = require("parameters")
local menu = {}

local conways_button = gen_button.new(0, 0, 200, 30, "Conway's Game of Life")

function menu:draw()
  conways_button:draw()
end


return menu
