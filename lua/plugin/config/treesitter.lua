local opts = {
	ensure_installed = {
		"bash",
		"c",
		"html",
		"jsonc",
		"lua",
		"luadoc",
		"markdown",
		"markdown_inline",
		"regex",
		"vim",
		"vimdoc",
	},
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = { "ruby" },
	},
	indent = { enable = true, disable = { "ruby" } },
}
require("nvim-treesitter.install").prefer_git = true
require("nvim-treesitter.configs").setup(opts)
require("treesitter-context").setup(opts)
