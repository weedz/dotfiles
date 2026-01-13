return {
    {
        "mason.nvim",
        opts = { ensure_installed = { "hadolint" } },
    },
    {
        "mfussenegger/nvim-lint",
        opts = {
            linters_by_ft = {
                dockerfile = { "hadolint" },
            },
        },
    },
}
