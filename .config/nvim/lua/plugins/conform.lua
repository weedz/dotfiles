return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            typescript = { "prettierd" },
            typescriptreact = { "prettierd" },
        },
        formatters = {
            prettierd = {
                -- Make sure to only run prettier if the directory contains a '.prettierrc' file
                condition = function(self, ctx)
                    return vim.fs.find(".prettierrc", {
                        path = ctx.filename,
                        upward = true,
                        stop = vim.fs.dirname(vim.fn.getcwd()),
                    })[1]
                end,
            },
        },
    },
}
