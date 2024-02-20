-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
vim.keymap.set("n", "<leader>pw", function()
    local word = vim.fn.expand("<cword>")
    require("telescope.builtin").grep_string({ search = word })
end, { desc = "Find word at cursor" })
vim.keymap.set("n", "<leader>pW", function()
    local word = vim.fn.expand("<cWORD>")
    require("telescope.builtin").grep_string({ search = word })
end, { desc = "Find WORD at cursor" })
vim.keymap.set("n", "<leader>pf", function()
    require("telescope.builtin").find_files()
end, { desc = "Find files" })
