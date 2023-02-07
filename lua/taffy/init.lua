local o = vim.o
local g = vim.g
local cmd = vim.cmd
local nvim_set_hl = vim.api.nvim_set_hl
local tbl_deep_extend = vim.tbl_deep_extend

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

local function apply_term_colors(colors)
	g.terminal_color_0 = colors.dark_gunmetal
	g.terminal_color_1 = colors.cinnabar
	g.terminal_color_2 = colors.ufo_green
	g.terminal_color_3 = colors.banana_yellow
	g.terminal_color_4 = colors.glaucous
	g.terminal_color_5 = colors.paradise_pink
	g.terminal_color_6 = colors.tufts_blue
	g.terminal_color_7 = colors.baby_powder
	g.terminal_color_8 = colors.begonia
	g.terminal_color_9 = colors.english_red
	g.terminal_color_10 = colors.french_lime
	g.terminal_color_11 = colors.cadmium_orange
	g.terminal_color_12 = colors.violet_blue
	g.terminal_color_13 = colors.light_tangelo
	g.terminal_color_14 = colors.glaucous
	g.terminal_color_15 = colors.baby_powder
	g.terminal_color_background = colors.dominant
	g.terminal_color_foreground = colors.glaucous
end


local function apply(configs)
	local colors = configs.colors
	apply_term_colors(colors)
	local groups = require("taffy.groups").setup(configs)

	-- apply transparents
	if configs.transparent_bg then
		for _, group in ipairs(TRANSPARENTS) do
			groups[group].bg = nil
		end
	end

	for group, setting in pairs(configs.overrides) do
		groups[group] = setting
	end

	-- set defined highlights
	for group, setting in pairs(groups) do
		nvim_set_hl(0, group, setting)
	end
end

local function setup(configs)
	if type(configs) == "table" then
		local_configs = tbl_deep_extend("force", DEFAULT_CONFIG, configs)
	end
end


local function load()
	if vim.version().minor < 7 then
		vim.notify_once("taffy.nvim: you must use neovim 0.7 or higher")
		return
	end

	-- reset colors
	if g.colors_name then
		cmd("hi clear")
	end

	if vim.fn.exists("syntax_on") then
		cmd("syntax reset")
	end

	o.background = "dark"
	o.termguicolors = true
	g.colors_name = "taffy"
	apply(local_configs)
end

return {
	load = load,
	setup = setup,
	configs = function()
		return local_configs
	end,
	colors = function()
		return local_configs.colors
	end,
}
