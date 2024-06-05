local config = require("keithhand.lazy.config")

local formatPluginDirectories = function()
	local d = {}
	for _, value in pairs(config.PLUGIN_DIRECTORIES) do
		table.insert(d, { import = value })
	end
	return d
end

if not vim.loop.fs_stat(config.lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"--branch=stable",
		config.lazyrepo,
		config.lazypath,
	})
end

vim.opt.rtp:prepend(config.lazypath)

require("lazy").setup(formatPluginDirectories(), {
	ui = {
		icons = vim.g.have_nerd_font and {} or {
			cmd = "⌘",
			config = "🛠",
			event = "📅",
			ft = "📂",
			init = "⚙",
			keys = "🗝",
			plugin = "🔌",
			runtime = "💻",
			require = "🌙",
			source = "📄",
			start = "🚀",
			task = "📌",
			lazy = "💤 ",
		},
	},
})
