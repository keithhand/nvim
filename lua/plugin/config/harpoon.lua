local harpoon = require("harpoon")

harpoon:setup({})
harpoon:extend(require("harpoon.extensions").builtins.navigate_with_number())

vim.keymap.set("n", "<leader>a", function()
	harpoon:list():add()
end, { desc = "[A]dd to harpoon list" })

vim.keymap.set("n", "<C-e>", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<C-S-P>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<C-S-N>", function()
	harpoon:list():next()
end)
