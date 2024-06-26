local noice = require("noice")

require("lualine").setup({
	sections = {
		lualine_x = {
			{
				noice.api.statusline.mode.get,
				cond = noice.api.statusline.mode.has,
				color = { fg = "#ff9e64" },
			},
		},
	},
})
