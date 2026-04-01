-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Terminal mode
vim.keymap.set("t", "<ESC>", "<C-\\><C-N>")

-- Telescope
-- vim.keymap.set("n", "<leader>pw", function()
--     local word = vim.fn.expand("<cword>")
--     require("telescope.builtin").grep_string({ search = word })
-- end, { desc = "Find word at cursor" })
-- vim.keymap.set("n", "<leader>pW", function()
--     local word = vim.fn.expand("<cWORD>")
--     require("telescope.builtin").grep_string({ search = word })
-- end, { desc = "Find WORD at cursor" })
-- vim.keymap.set("n", "<leader>pf", function()
--     require("telescope.builtin").find_files()
-- end, { desc = "Find files" })

-- Trouble
vim.keymap.set("n", "<leader>tt", function()
    require("trouble").toggle()
end)
vim.keymap.set("n", "<leader>tn", function()
    require("trouble").next({ skip_groups = true, jump = true })
end)
vim.keymap.set("n", "<leader>tp", function()
    require("trouble").previous({ skip_groups = true, jump = true })
end)

-- incremental selection treesitter/lsp
vim.keymap.set({ "n", "x", "o" }, "<A-o>", function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
        require("vim.treesitter._select").select_parent(vim.v.count1)
    else
        vim.lsp.buf.selection_range(vim.v.count1)
    end
end, { desc = "Select parent treesitter node or outer incremental lsp selections" })

vim.keymap.set({ "n", "x", "o" }, "<A-i>", function()
    if vim.treesitter.get_parser(nil, nil, { error = false }) then
        require("vim.treesitter._select").select_child(vim.v.count1)
    else
        vim.lsp.buf.selection_range(-vim.v.count1)
    end
end, { desc = "Select child treesitter node or inner incremental lsp selections" })
