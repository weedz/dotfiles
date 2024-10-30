return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            typescript = { "prettierd", "dprint" },
            typescriptreact = { "prettierd", "dprint" },
            json = { "jsonls" },
        },
        formatters = {
            prettier = {
                -- Make sure to only run prettier if the directory contains a '.prettierrc' file
                condition = function(ctx)
                    return vim.fs.find(".prettierrc", {
                        path = ctx.filename,
                        upward = true,
                        stop = vim.fs.dirname(vim.fn.getcwd()),
                    })[1]
                end,
            },
            prettierd = {
                -- Make sure to only run prettier if the directory contains a '.prettierrc' file
                condition = function(ctx)
                    return vim.fs.find(".prettierrc", {
                        path = ctx.filename,
                        upward = true,
                        stop = vim.fs.dirname(vim.fn.getcwd()),
                    })[1]
                end,
            },
            dprint = {
                condition = function(ctx)
                    return vim.fs.find({ "dprint.json" }, { path = ctx.filename, upward = true })[1]
                end,
            },
        },
    },
}
