return {
    "stevearc/oil.nvim",
    opts = {
        keymaps = {
            ["<C-h>"] = false,
            ["<C-j>"] = false,
            ["<C-k>"] = false,
            ["<C-l>"] = false,
        },
        view_options = {
            show_hidden = true,
        },
    },
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
