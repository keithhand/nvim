-- alpha-nvim
-- https://github.com/goolord/alpha-nvim

local isGitHubRepo = function()
	local git_dir = vim.loop.cwd() .. "/.git"
	return vim.loop.fs_stat(git_dir) ~= nil
end

local cwdMatchesEnv = function(variable)
	local envRepoDirectory = vim.fn.resolve(vim.env[variable])
	return vim.loop.cwd() == envRepoDirectory
end

local buttons = {
	-- File actions
	{ "r", "   [R]ecent", ":Telescope oldfiles <CR>" },
	{ "e", "   N[e]w file", ":ene <BAR> startinsert <CR>" },
	{ "f", "󰱽   Open [f]ile", ":Telescope find_files <CR>" },
	{ "g", "   [G]rep files", ":Telescope live_grep <CR>" },
	{ enabled = isGitHubRepo(), "o", "   [O]pen GitHub Repo", ":!git open <CR>" },
	-- Open common nvim projects
	{
		enabled = not cwdMatchesEnv("DOTFILES"),
		"c",
		"   [C]onfigure Dotfiles",
		":!tmux-sessionizer $(readlink -f $DOTFILES) <CR>",
	},
	{
		enabled = not cwdMatchesEnv("OBSIDIAN_DIRECTORY"),
		"v",
		"󱓩   Open Obsidian [V]ault",
		":!tmux-sessionizer $OBSIDIAN_DIRECTORY <CR>",
	},
	-- Nvim controls
	{ "u", "󰚰   [U]pdate Plugins", "<cmd>lua require('lazy').sync() <CR>" },
	{ "d", "   [D]ocs Search", ":Telescope help_tags <CR>" },
	{ "x", "   E[x]it NVIM", ":qa <CR>" },
}
local footers = {
	"Create and Evolve",
	"Stay Aware",
	"Keep Calm and Chill",
	"Be Present",
}

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
		dashboard.section.buttons.val = {}
		for i in pairs(buttons) do
			local key, description, command, enabled = buttons[i][1], buttons[i][2], buttons[i][3], buttons[i].enabled
			if enabled ~= false then
				table.insert(dashboard.section.buttons.val, dashboard.button(key, description, command))
			end
		end
		math.randomseed(os.time())
		dashboard.section.footer.val = footers[math.random(#footers)]
		alpha.setup(dashboard.opts)
	end,
}
