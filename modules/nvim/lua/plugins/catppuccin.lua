return {
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			flavour = "mocha",
			integrations = {
				gitsigns = true,
				treesitter = true,
			},
		},
		config = function()
			require("catppuccin").setup()
			vim.cmd.colorscheme("catppuccin")
		end,
	},
}
