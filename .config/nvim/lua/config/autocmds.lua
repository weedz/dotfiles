-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

vim.api.nvim_create_autocmd({ "BufNewFile", "BufEnter" }, {
    pattern = "*.md",
    callback = function()
        vim.opt.conceallevel = 0
    end,
})

-- Fix "super tab" to not move the cursor to the next position if we have manually moved the cursor
-- https://github.com/Aumnescio/dotfiles/blob/a3efe4d1fdbc7592dd0d84f39539a93b7a119e43/nvim/init.lua#L3365
local luasnip_fix_augroup = vim.api.nvim_create_augroup("MyLuaSnipHistory", { clear = true })
vim.api.nvim_create_autocmd("ModeChanged", {
    pattern = "*",
    callback = function()
        if
            ((vim.v.event.old_mode == "s" and vim.v.event.new_mode == "n") or vim.v.event.old_mode == "i")
            and require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
            and not require("luasnip").session.jump_active
        then
            require("luasnip").unlink_current()
        end
    end,
    group = luasnip_fix_augroup,
})
