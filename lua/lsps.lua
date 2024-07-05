return {
	bashls = {
		filetypes = { "sh", "bash", "zsh" },
	},
	"shellcheck",
	"shfmt",

	gopls = {
		settings = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
			gofumpt = true,
		},
	},
	templ = {},
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
