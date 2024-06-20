local fterm = require("FTerm")
local gitui = fterm:new({
	ft = "fterm_lazygit",
	cmd = "lazygit",
	dimensions = {
		height = 1,
		width = 1,
	},
})
vim.keymap.set("n", "<leader>og", function()
	gitui:toggle()
end, { desc = "[O]pen Lazy[g]it" })
vim.keymap.set("n", "<leader>or", "<cmd>silent !git open <cr>", { desc = "[O]pen GitHub [R]epo" })
