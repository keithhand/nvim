-- Better Around/Inside textobjects
require("mini.ai").setup({ n_lines = 500 })

-- Add/delete/replace surroundings (brackets, quotes, etc.)
require("mini.surround").setup()

-- Simple and easy statusline.
local statusline = require("mini.statusline")
statusline.setup({ use_icons = vim.g.have_nerd_font })

statusline.section_location = function()
	return "%2l:%-2v"
end