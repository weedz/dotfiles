return {
    "m-demare/attempt.nvim",
    opts = {
        run = {
            ts = { "w", "!tsx %:p" },
        },
        ext_options = { "ts", "js", "lua", "sh", "py" },
    },
    init = function()
        local wk = require("which-key")
        wk.register({
            ["<leader>a"] = { name = "+attempt" },
        })
        require("telescope").load_extension("attempt")
    end,
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
}
