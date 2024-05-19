return {
	"numToStr/FTerm.nvim",
	config = function()
		local fterm = require("FTerm")
		local gitui = fterm:new({
			ft = "fterm_lazygit",
			cmd = "lazygit",
			dimensions = {
				height = 0.95,
				width = 0.95,
			},
		})
		vim.keymap.set("n", "<leader>g", function()
			gitui:toggle()
		end, { desc = "Open Lazy[g]it" })
	end,
}
