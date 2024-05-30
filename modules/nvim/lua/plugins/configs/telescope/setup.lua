require("telescope").setup({
	pickers = {
		buffers = {
			initial_mode = "normal",
		},
		oldfiles = {
			initial_mode = "normal",
			only_cwd = true,
			find_command = { "rg", "--ignore-case", "--hidden" },
		},
		find_files = {
			find_command = { "rg", "--ignore-case", "--hidden", "--files", "--glob=!.git/*" },
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
})

require("telescope").load_extension("fzf")
require("telescope").load_extension("ui-select")
