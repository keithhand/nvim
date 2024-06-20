require("neo-tree").setup({
	close_if_last_window = true,
	filesystem = {
		follow_current_file = { enabled = true },
		window = {
			position = "right",
			width = 30,
			mappings = {
				["\\"] = "close_window",
			},
		},
	},
})

vim.api.nvim_create_autocmd("BufEnter", {
	-- make a group to be able to delete it later
	group = vim.api.nvim_create_augroup("NeoTreeInit", { clear = true }),
	callback = function()
		local f = vim.fn.expand("%:p")
		if vim.fn.isdirectory(f) ~= 0 then
			vim.cmd("Neotree current dir=" .. f)
			-- neo-tree is loaded now, delete the init autocmd
			vim.api.nvim_clear_autocmds({ group = "NeoTreeInit" })
		end
	end,
})
