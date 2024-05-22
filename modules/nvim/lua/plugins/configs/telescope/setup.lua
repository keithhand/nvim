require("telescope").setup({
	pickers = {
		oldfiles = {
			initial_mode = "normal",
			only_cwd = true,
		},
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown(),
		},
	},
})

pcall(require("telescope").load_extension, "fzf")
pcall(require("telescope").load_extension, "ui-select")
