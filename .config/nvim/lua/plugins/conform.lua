return {
    "stevearc/conform.nvim",
    opts = {
        default_format_opts = {
            lsp_format = "fallback",
        },
        formatters_by_ft = {
            javascript = { "prettierd" },
            javascriptreact = { "prettierd" },
            typescript = { "prettierd" },
            typescriptreact = { "prettierd" },
        },
        formatters = {
            prettierd = {
                condition = function(ctx, file)
                    if not (file and file.buf) then
                        return false
                    end
                    -- vim.print("bufnr:", file.buf)
                    local oxfmt = vim.lsp.get_clients({ name = "oxfmt", bufnr = file.buf })[1]
                    -- vim.print("oxfmt:", oxfmt)
                    return oxfmt == nil
                end,
            },
        },
    },
}
