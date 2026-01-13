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

vim.diagnostic.config({
    -- Use the default configuration
    -- virtual_lines = true,

    -- Alternatively, customize specific options
    virtual_lines = {
        -- Only show virtual line diagnostics for the current cursor line
        current_line = true,
    },
})

---@param server string
---@param bufnr integer
local function disable_format_cap(server, bufnr)
    local client = vim.lsp.get_clients({ name = server, bufnr = bufnr })[1]
    if client then
        client.server_capabilities.documentFormattingProvider = false
    end
end

---@param server string
local function disable_client_format_cap(server)
    vim.lsp.config(server, {
        on_attach = function(client, bufnr)
            local oxfmt = vim.lsp.get_clients({ name = "oxfmt", bufnr = bufnr })[1]
            if oxfmt then
                client.server_capabilities.documentFormattingProvider = false
            end
        end,
    })
end

vim.lsp.enable("oxfmt")
vim.lsp.config("oxfmt", {
    on_attach = function(client, bufnr)
        -- NOTE: Disables `prettierd` in `conform` config (`lua/plugins/conform.lua`)
        disable_format_cap("tsgo", bufnr)
        disable_format_cap("vtsls", bufnr)
    end,
})
disable_client_format_cap("tsgo")
disable_client_format_cap("vtsls")
