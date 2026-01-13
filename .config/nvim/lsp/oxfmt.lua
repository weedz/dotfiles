-- local util = require("lspconfig.util")

---@type vim.lsp.Config
return {
    cmd = { "oxfmt", "--lsp" },
    filetypes = {
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescriptreact",
        "typescript.tsx",
        "toml",
        "json",
        "jsonc",
        "json5",
        "yaml",
        "html",
        "vue",
        "handlebars",
        "hbs",
        "css",
        "scss",
        "less",
        "graphql",
        "markdown",
        "mdx",
    },
    workspace_required = true,
    -- root_markers = { ".oxfmtrc.jsonc", ".oxfmtrc.json" },
    root_dir = function(bufnr, on_dir)
        local fname = vim.api.nvim_buf_get_name(bufnr)

        -- Oxfmt resolves configuration by walking upward and using the nearest config file
        -- to the file being processed. We therefore compute the root directory by locating
        -- the closest `.oxfmtrc.json` (or `package.json` fallback) above the buffer.
        -- local root_markers = util.insert_package_json({ ".oxfmtrc.json", ".oxfmtrc.jsonc" }, "oxfmt", fname)
        local root_markers = { ".oxfmtrc.json", ".oxfmtrc.jsonc" }
        local root_marker_files = vim.fs.find(root_markers, { path = fname, upward = true })
        local dir = vim.fs.dirname(root_marker_files[1])

        on_dir(dir)
    end,
}
