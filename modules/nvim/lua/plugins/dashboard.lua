-- alpha-nvim
-- https://github.com/goolord/alpha-nvim

return {
	"goolord/alpha-nvim",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		"nvim-lua/plenary.nvim",
		{ "MaximilianLloyd/ascii.nvim", dependencies = "MunifTanjim/nui.nvim" },
	},
	config = function()
		local alpha = require("alpha")
		local dashboard = require("alpha.themes.startify")
		local ascii = require("ascii")
		-- local telescope = require("telescope")
		-- telescope.load_extension("ascii")

		dashboard.section.header.val = ascii.get_random("text", "neovim")
		dashboard.section.header.opts = {
			hl = "Type",
			position = "center",
			-- shrink_margin = true,
		}
		dashboard.section.mru.val = {}
		dashboard.section.top_buttons.val = {
			dashboard.button("e", "   New file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰱽   Open file", ":Telescope find_files <CR>"),
			dashboard.button("g", "   Find words", ":Telescope live_grep <CR>"),
		}
		dashboard.section.bottom_buttons.val = {
			dashboard.button("o", "󱓩   Open Obsidian Vault", ":!tmux-sessionizer $OBSIDIAN_DIRECTORY<CR>"),
			dashboard.button("c", "   Configure Dotfiles", ":!tmux-sessionizer $(readlink -f $DOTFILES)<CR>"),
			dashboard.button("u", "󰚰   Update Plugins", "<cmd>lua require('lazy').sync()<CR>"),
			dashboard.button("q", "   Quit NVIM", ":qa<CR>"),
		}

		alpha.setup(dashboard.opts)
	end,
}
