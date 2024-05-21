require("telescope").setup({
	pickers = {
		find_files = {
			find_command = { "fd", "--strip-cwd-prefix", "--exclude", ".git" },
		},
		oldfiles = {
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
