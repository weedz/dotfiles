return {
    {
        "folke/snacks.nvim",
        opts = {
            dashboard = { enabled = false },
            picker = { enabled = false },
        },
    },
    {
        "nvim-mini/mini.notify",
        version = false,
        config = function()
            require("mini.notify").setup()
        end,
    },
    {
        "rachartier/tiny-cmdline.nvim",
        init = function()
            vim.o.cmdheight = 0
        end,
        config = function()
            require("tiny-cmdline").setup({
                width = {
                    value = "60%",
                    min = 40,
                    max = 80,
                },
                position = {
                    x = "50%", -- horizontal: "0%" = left, "50%" = center, "100%" = right
                    y = "25%", -- vertical:   "0%" = top,  "50%" = center, "100%" = bottom
                },
                menu_col_offset = 3,
                native_types = { "/", "?" },
                on_reposition = require("tiny-cmdline").adapters.blink,
            })
        end,
    },
}
