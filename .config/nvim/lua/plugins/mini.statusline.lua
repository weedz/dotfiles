return {
    {
        "nvim-mini/mini.statusline",
        version = false,
        opts = {},
        dependencies = {
            { "nvim-mini/mini-git", version = false },
            { "nvim-mini/mini.diff", version = false },
        },
    },
    {
        "nvim-mini/mini-git",
        version = false,
        opts = {},
        -- does not work with only opts
        config = function()
            require("mini.git").setup()
        end,
    },
    {
        "nvim-mini/mini.diff",
        version = false,
        opts = {},
    },
    {
        "nvim-mini/mini.tabline",
        version = false,
        opts = {},
    },
}
