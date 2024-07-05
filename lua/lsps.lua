-- HACK:
-- objects are lsps
-- strings are tools
return {
	dockerls = {},
	docker_compose_language_service = {},
	"hadolint",

	"yamlfmt",

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
