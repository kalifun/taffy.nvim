local o = vim.o
local g = vim.g

local DEFAULT_CONFIG = {
	italic_comment = false,
	transparent_bg = false,
	show_end_of_buffer = false,
	lualine_bg_color = nil,
	colors = require("taffy.palette"),
	overrides = {},
}

local local_configs = DEFAULT_CONFIG

local TRANSPARENTS = {
	"Normal",
	"SignColumn",
	"NvimTreeNormal",
	"NvimTreeVertSplit",
 }

local function load()
	o.background = "dark"
	o.termguicolors = true
	g.colors_name = "taffy"
end

return {
	load = load,
	configs = function()
		return local_configs
	end,
	colors = function()
		return local_configs.colors
	end,
}
