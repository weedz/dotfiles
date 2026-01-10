local util = require("conform.util")

return {
    "stevearc/conform.nvim",
    opts = {
        formatters_by_ft = {
            typescript = { "oxfmt" },
            typescriptreact = { "oxfmt" },
            json = { "oxfmt" },
        },
        formatters = {
            oxfmt = {
                command = util.from_node_modules("oxfmt"),
                -- can't use `--stdin-filepath`. something dies after exactly 146177 bytes
                args = { "$FILENAME" },
                stdin = false,
            },
        },
    },
}
