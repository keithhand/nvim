local PLUGIN_CONFIGS = "keithhand.plugins"
local pluginConfigs = function(config)
	return PLUGIN_CONFIGS .. "." .. config
end

return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			require(pluginConfigs("autopairs"))
		end,
	},

	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"famiu/bufdelete.nvim",
		},
		config = function()
			require(pluginConfigs("bufferline"))
		end,
	},

	{
		"numToStr/Comment.nvim",
		opts = {
			ignore = "^$",
		},
	},

	{
		"goolord/alpha-nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"nvim-lua/plenary.nvim",
			{ "MaximilianLloyd/ascii.nvim", dependencies = "MunifTanjim/nui.nvim" },
		},
		config = function()
			require(pluginConfigs("dashboard"))
		end,
	},

	{
		"stevearc/conform.nvim",
		lazy = false,
		keys = {},
		opts = {
			notify_on_error = false,
			format_on_save = function(bufnr)
				local disable_filetypes = { c = true, cpp = true }
				return {
					timeout_ms = 500,
					lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
				}
			end,
			formatters_by_ft = {
				lua = { "stylua" },
				sh = { "shfmt" },
				zsh = { "shfmt" },
			},
		},
	},

	{
		"numToStr/FTerm.nvim",
		config = function()
			require(pluginConfigs("lazygit"))
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			on_attach = require(pluginConfigs("gitsigns")),
		},
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("harpoon")
		end,
	},

	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
	},

	{
		"mfussenegger/nvim-lint",
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			require(pluginConfigs("lint"))
		end,
	},

	{
		"VonHeikemen/lsp-zero.nvim",
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			{ "VonHeikemen/lsp-zero.nvim", branch = "v3.x" },
			"neovim/nvim-lspconfig",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
		},
		config = function()
			require(pluginConfigs("lsp"))
		end,
	},

	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},

	{
		"echasnovski/mini.nvim",
		config = function()
			require(pluginConfigs("mini"))
		end,
	},

	{
		"stevearc/oil.nvim",
		opts = {
			default_file_explorer = true,
			open_fn = require("lazy.util").open,
		},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	{
		"rmagatti/gx-extended.nvim",
		keys = { "gx" },
		opts = {
			open_fn = require("lazy.util").open,
		},
	},

	{
		"nvim-neo-tree/neo-tree.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
		},
		cmd = "Neotree",
		keys = {
			{ "\\", ":Neotree reveal<CR>", { desc = "NeoTree reveal" } },
		},
		init = function()
			require(pluginConfigs("neo-tree"))
		end,
		opts = {
			filesystem = {
				follow_current_file = { enabled = true },
				window = {
					width = 30,
					mappings = {
						["\\"] = "close_window",
					},
				},
			},
		},
	},

	{
		"epwalsh/obsidian.nvim",
		enabled = require(pluginConfigs("obsidian")).isVaultDirectory,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = require(pluginConfigs("obsidian")).setupConfig,
	},

	{
		"nvim-telescope/telescope.nvim",
		event = "VimEnter",
		branch = "0.1.x",
		dependencies = {
			{ "nvim-lua/plenary.nvim" },
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
				cond = function()
					return vim.fn.executable("make") == 1
				end,
			},
			{ "sharkdp/fd" },
			{ "nvim-telescope/telescope-ui-select.nvim" },
			{ "nvim-tree/nvim-web-devicons", enabled = vim.g.have_nerd_font },
		},
		config = function()
			require(pluginConfigs("telescope"))
		end,
	},

	{
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
				require(pluginConfigs("theme"))
			end,
		},
	},

	{
		"folke/todo-comments.nvim",
		event = "VimEnter",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = { signs = false },
	},

	{ "xiyaowong/transparent.nvim" },

	{
		"nvim-treesitter/nvim-treesitter",
		dependencies = "nvim-treesitter/nvim-treesitter-context",
		build = ":TSUpdate",
		config = function()
			require(pluginConfigs("treesitter"))
		end,
	},

	{
		"folke/trouble.nvim",
		opts = {
			modes = {
				diagnostics = {
					groups = {
						{ "filename", format = "{file_icon} {basename:Title} {count}" },
					},
					preview = {
						type = "split",
						relative = "win",
						position = "right",
						size = 0.3,
					},
				},
			},
		},
		cmd = "Trouble",
		keys = {
			{
				"<leader>dd",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Diagnostics (Trouble)",
			},
		},
	},

	{ "tpope/vim-sleuth" },

	{
		"christoomey/vim-tmux-navigator",
		event = "VimEnter",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
		},
		keys = {
			{ "<c-h>", "<cmd><C-U>TmuxNavigateLeft<cr>" },
			{ "<c-j>", "<cmd><C-U>TmuxNavigateDown<cr>" },
			{ "<c-k>", "<cmd><C-U>TmuxNavigateUp<cr>" },
			{ "<c-l>", "<cmd><C-U>TmuxNavigateRight<cr>" },
		},
	},

	{
		"folke/which-key.nvim",
		event = "VimEnter",
		config = function()
			require(pluginConfigs("which-key"))
		end,
	},
}
