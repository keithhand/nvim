local lsp_zero = require("lsp-zero")

lsp_zero.on_attach(function(_, bufnr)
	--- @see :help lsp-zero-keybindings
	lsp_zero.default_keymaps({ buffer = bufnr })
end)

local langs = require("keithhand.langs")
print(langs)

require("mason").setup({})
require("mason-lspconfig").setup({
	ensure_installed = {},
	handlers = {
		function(server_name)
			require("lspconfig")[server_name].setup({})
		end,
	},
})
