require("trouble").setup({
	modes = {
		diagnostics = {
			groups = {
				{ "filename", format = "{file_icon} {basename:Title} {count}" },
			},
			preview = {
				type = "split",
				relative = "win",
				position = "right",
				size = 0.3,
			},
		},
	},
})
