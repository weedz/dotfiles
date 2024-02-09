-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local attempt = require("attempt")
vim.keymap.set("n", "<leader>an", attempt.new_select, { desc = "New (with extension)" }) -- new attempt, selecting extension
vim.keymap.set("n", "<leader>ai", attempt.new_input_ext, { desc = "New" }) -- new attempt, inputing extension
vim.keymap.set("n", "<leader>ar", attempt.run, { desc = "Run" }) -- run attempt
vim.keymap.set("n", "<leader>ad", attempt.delete_buf, { desc = "Delete attempt buffer" }) -- delete attempt from current buffer
vim.keymap.set("n", "<leader>ac", attempt.rename_buf, { desc = "Rename attempt " }) -- rename attempt from current buffer
vim.keymap.set("n", "<leader>al", "<cmd>Telescope attempt<cr>") -- search through attempts
