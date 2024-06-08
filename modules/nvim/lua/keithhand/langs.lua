return {
	bashls = {
		filetypes = { "sh", "bash", "zsh" },
	},
	"shellcheck",
	"shfmt",

	gopls = {
		gofumpt = true,
	},
	"golangci-lint",

	lua_ls = {
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	},
	"stylua",

	"markdownlint",
}
