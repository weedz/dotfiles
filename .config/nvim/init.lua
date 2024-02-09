-- bootstrap lazy.nvim, LazyVim and your plugins
-- disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- vim.g.netrw_browse_split = 0
-- vim.g.netrw_winsize = 25

vim.g.loaded_python3_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0

require("config.lazy")

-- require private/excluded stuff, if exists
pcall(require, "private.autocmds")
