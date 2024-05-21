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
		local dashboard = require("alpha.themes.dashboard")
		local ascii = require("ascii")

		dashboard.section.header.val = ascii.get_random("text", "neovim")
		dashboard.section.header.opts = {
			hl = "Type",
			position = "center",
			-- shrink_margin = true,
		}
		dashboard.section.buttons.val = {
			dashboard.button("r", "   [R]ecent", ":Telescope oldfiles <CR>"),
			dashboard.button("e", "   N[e]w file", ":ene <BAR> startinsert <CR>"),
			dashboard.button("f", "󰱽   Open [f]ile", ":Telescope find_files <CR>"),
			dashboard.button("g", "   [G]rep files", ":Telescope live_grep <CR>"),
			dashboard.button("v", "󱓩   Open Obsidian [V]ault", ":!tmux-sessionizer $OBSIDIAN_DIRECTORY <CR>"),
			dashboard.button("c", "   [C]onfigure Dotfiles", ":!tmux-sessionizer $(readlink -f $DOTFILES) <CR>"),
			dashboard.button("u", "󰚰   [U]pdate Plugins", "<cmd>lua require('lazy').sync() <CR>"),
			dashboard.button("d", "   [D]ocs Search", ":Telescope help_tags <CR>"),
			dashboard.button("x", "   E[x]it NVIM", ":qa <CR>"),
		}
		dashboard.section.footer.val = "Create and Evolve"
		alpha.setup(dashboard.opts)
	end,
}
