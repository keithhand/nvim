-- Set up languages
local servers, tools = {}, {}
local languages = require("keithhand.langs")
for _, value in pairs(vim.tbl_keys(languages)) do
	if type(value) == "string" then
		servers[value] = languages[value]
	elseif type(value) == "number" then
		table.insert(tools, languages[value])
	end
end

-- Configure LSP
local lsp_zero = require("lsp-zero")
lsp_zero.on_attach(function(_, bufnr)
	lsp_zero.default_keymaps({ buffer = bufnr, preserve_mappings = false })
end)

-- Installation of servers and tools
local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, tools)
require("mason").setup()
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
require("mason-lspconfig").setup({
	handlers = {
		function(name)
			local lsp = require("lspconfig")[name]
			if lsp.manager then
				return
			end
			lsp.setup(servers[name])
		end,
	},
})

-- Auto-completion
local luasnip = require("luasnip")
local cmp = require("cmp")
local cmp_format = lsp_zero.cmp_format({ details = true })
local cmp_mappings = lsp_zero.defaults.cmp_mappings({
	["<C-p>"] = cmp.mapping.select_prev_item(),
	["<C-n>"] = cmp.mapping.select_next_item(),
	["<C-l>"] = cmp.mapping(function()
		if luasnip.expand_or_locally_jumpable() then
			luasnip.expand_or_jump()
		end
	end, { "i", "s" }),
	["<C-h>"] = cmp.mapping(function()
		if luasnip.locally_jumpable(-1) then
			luasnip.jump(-1)
		end
	end, { "i", "s" }),
	["<C-y>"] = cmp.mapping.confirm({ select = true }),
	["<C-Space>"] = cmp.mapping.complete(),
	["<Tab>"] = nil,
	["<S-Tab>"] = nil,
})
cmp.setup({
	sources = {
		{ name = "nvim_lsp" },
		{ name = "luasnip" },
		{ name = "buffer" },
		{ name = "path" },
	},
	snippet = {
		expand = function(args)
			luasnip.lsp_expand(args.body)
		end,
	},
	formatting = cmp_format,
	mappings = cmp_mappings,
})
