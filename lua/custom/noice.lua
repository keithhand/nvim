require("noice").setup({
	views = {
		cmdline_popup = {
			position = {
				row = 9,
				col = "80%",
			},
			border = {
				style = "none",
				padding = { 1, 0 },
			},
			filter_options = {},
			win_options = {
				winhighlight = "NormalFloat:NormalFloat,FloatBorder:FloatBorder",
			},
		},
	},
	lsp = {
		-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
		override = {
			["vim.lsp.util.convert_input_to_markdown_lines"] = true,
			["vim.lsp.util.stylize_markdown"] = true,
			["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
		},
	},
	-- you can enable a preset for easier configuration
	presets = {
		bottom_search = true,
		command_palette = true,
		long_message_to_split = true,
		inc_rename = true,
		lsp_doc_border = true,
	},
})

require("notify").setup({
	background_colour = "#000000",
	render = "wrapped-compact",
	max_width = 33,
})

local telescope = require("telescope")
telescope.load_extension("noice")
