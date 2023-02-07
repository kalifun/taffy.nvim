local taffy = require("taffy")
local colors = taffy.colors()


return {
    normal = {
        a = { bg = colors.tufts_blue, fg = colors.dark_gunmetal, gui = "bold" },
        b = { bg = colors.dominant, fg = colors.tufts_blue },
        c = { bg = colors.dominant, fg = colors.baby_powder },
    },
    insert = {
        a = { bg = colors.banana_yellow, fg = colors.dark_gunmetal, gui = "bold" },
        b = { bg = colors.dominant, fg = colors.banana_yellow },
        c = { bg = colors.dominant, fg = colors.baby_powder },
    },
    visual = {
        a = { bg = colors.baby_powder, fg = colors.dark_gunmetal, gui = "bold" },
        b = { bg = colors.dominant, fg = colors.baby_powder },
        c = { bg = colors.dominant, fg = colors.baby_powder },
    },
    replace = {
        a = { bg = colors.cinnabar, fg = colors.dark_gunmetal, gui = "bold" },
        b = { bg = colors.dominant, fg = colors.cinnabar },
        c = { bg = colors.dominant, fg = colors.baby_powder },
    },
    command = {
        a = { bg = colors.ufo_green, fg = colors.dark_gunmetal, gui = "bold" },
        b = { bg = colors.dominant, fg = colors.ufo_green },
        c = { bg = colors.dominant, fg = colors.baby_powder },
    },
    inactive = {
        a = { bg = colors.dark_gunmetal, fg = colors.pale_cerulean, gui = "bold" },
        b = { bg = colors.dark_gunmetal, fg = colors.pale_cerulean },
        c = { bg = colors.dark_gunmetal, fg = colors.pale_cerulean },
    },
}
