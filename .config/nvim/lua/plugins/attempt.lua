return {
    "m-demare/attempt.nvim",
    lazy = true,
    opts = {
        run = {
            ts = { "w", "!tsx %:p" },
        },
        ext_options = { "ts", "js", "lua", "sh", "py" },
    },
    keys = {
        { "<leader>a", desc = "+attempt" },
        { "<leader>an", '<cmd>lua require("attempt").new_select()<cr>', desc = "New attempt (with extenstion)" },
        { "<leader>ai", '<cmd>lua require("attempt").new_input_ext()<cr>', desc = "New" },
        { "<leader>ar", '<cmd>lua require("attempt").run()<cr>', desc = "Run" },
        { "<leader>ad", '<cmd>lua require("attempt").delete_buf()<cr>', desc = "Delete buffer" },
        { "<leader>ac", '<cmd>lua require("attempt").rename_buf()<cr>', desc = "Rename" },
        { "<leader>al", "<cmd>Telescope attempt<cr>", desc = "Telescope" },
    },
    -- init = function()
    --     -- require("telescope").load_extension("attempt")
    -- end,
    dependencies = {
        "nvim-telescope/telescope.nvim",
        "nvim-lua/plenary.nvim",
    },
}
