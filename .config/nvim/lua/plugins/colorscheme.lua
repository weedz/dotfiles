-- return {
--     "rose-pine/neovim",
--     name = "rose-pine",
--     opts = {
--         styles = {
--             transparency = true,
--         },
--     },
-- }

-- return {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     lazy = false,
--     priority = 1000,
--     opts = {
--         transparent_background = false,
--     },
-- }

return {
    "folke/tokyonight.nvim",
    lazy = true,
    opts = {
        style = "night",
        transparent = true,
        styles = {
            sidebars = "transparent",
            floats = "transparent",
        },
    },
}
