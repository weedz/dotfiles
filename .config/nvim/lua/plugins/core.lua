return {
    {
        "LazyVim/LazyVim",
        opts = {
            -- colorscheme = "rose-pine-main",
            -- From <https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/init.lua#L101>
            kind_filter = {
                default = {
                    "Class",
                    "Constructor",
                    "Constant", -- added
                    "Enum",
                    "Field",
                    "Function",
                    "Interface",
                    "Method",
                    "Module",
                    "Namespace",
                    "Package",
                    "Property",
                    "Struct",
                    "Trait",
                    "Variable", -- added. For global variables (eg. `const foo = () => {}`)
                },
            },
        },
    },
}
