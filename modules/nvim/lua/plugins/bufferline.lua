local is_dashboard_active = function()
	local bufnr = vim.api.nvim_get_current_buf()
	local name = vim.api.nvim_buf_get_name(bufnr)
	return name == ""
end

return {
	{
		"akinsho/bufferline.nvim",
		version = "*",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
			"famiu/bufdelete.nvim",
		},
		config = function()
			require("bufferline").setup({
				options = {
					style_preset = require("bufferline").style_preset.minimal,
					diagnostics = "nvim_lsp",
					show_buffer_close_icons = false,
					always_show_bufferline = false,
				},
			})
			require("which-key").register({
				["<leader>x"] = {
					function()
						if is_dashboard_active() then
							vim.cmd(":q")
						end
						vim.cmd(":Bdelete")
					end,
					"Delete the open buffer",
				},
			})
			vim.api.nvim_create_augroup("load_alpha_on_empty", { clear = true })
			vim.api.nvim_create_autocmd("User", {
				pattern = "BDeletePre *",
				group = "load_alpha_on_empty",
				callback = function()
					if is_dashboard_active() then
						vim.cmd([[:Alpha | bd#]])
					end
				end,
			})
		end,
	},
}
