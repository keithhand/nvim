return {
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		dependencies = { "hrsh7th/nvim-cmp" },
		config = function()
			require("custom.autopairs")
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
			require("custom.bufferline")
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
			require("custom.dashboard")
		end,
	},

	{
		"stevearc/conform.nvim",
		lazy = false,
		config = function()
			require("custom.conform")
		end,
	},

	{
		"numToStr/FTerm.nvim",
		config = function()
			require("custom.lazygit")
		end,
	},

	{
		"lewis6991/gitsigns.nvim",
		opts = {
			on_attach = require("custom.gitsigns"),
		},
	},

	{
		"ThePrimeagen/harpoon",
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			require("custom.harpoon")
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
			require("custom.lint")
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
			require("custom.lsp")
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
			require("custom.mini")
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
			require("custom.neo-tree")
		end,
	},

	{
		"epwalsh/obsidian.nvim",
		enabled = require("custom.obsidian").isVaultDirectory,
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-telescope/telescope.nvim",
			"nvim-treesitter/nvim-treesitter",
		},
		config = require("custom.obsidian").setupConfig,
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
			require("custom.telescope")
		end,
	},

	{
		{
			"catppuccin/nvim",
			name = "catppuccin",
			priority = 1000,
			config = function()
				require("custom.theme")
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
			require("custom.treesitter")
		end,
	},

	{
		"folke/trouble.nvim",
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
			require("custom.which-key")
		end,
	},

	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("custom.inc-rename")
		end,
	},

	{
		"folke/noice.nvim",
		event = "VeryLazy",
		opts = {},
		dependencies = {
			"MunifTanjim/nui.nvim",
			"rcarriga/nvim-notify",
		},
		config = function()
			require("custom.noice")
		end,
	},

	{
		"nvim-lualine/lualine.nvim",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"folke/noice.nvim",
		},
		config = function()
			require("custom.lualine")
		end,
	},
}
