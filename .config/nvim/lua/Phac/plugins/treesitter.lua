return {
    {
        "nvim-treesitter/nvim-treesitter",
        event = { "BufReadPre", "BufNewFile" },
        build = ":TSUpdate",
        config = function()
            local treesitter = require("nvim-treesitter")

            treesitter.setup({
                highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
                },
                indent = {
                    enable = true,
                },
                ensure_installed = {
                    "json",
                    "javascript",
                    "tsx",
                    "go",
                    "yaml",
                    "html",
                    "css",
                    "python",
                    "http",
                    "prisma",
                    "markdown",
                    "bash",
                    "lua",
                    "vim",
                    "dockerfile",
                    "query",
                    "gitignore",
                    "c",
                    "java",
                },
                incremental_selection = {
                    enable = true,
                    keymaps = {
                        init_selection = "<C-space>",
                        node_incremental = "<C-space>",
                        node_decremental = "<C-backspace>",
                    },
                },
            })

            vim.api.nvim_create_autocmd("FileType", {
                pattern = "*",
                callback = function()
                    pcall(vim.treesitter.start)
                end,
            })
        end,
    },
    {
        "windwp/nvim-ts-autotag",
        enable = true,
        ft = {
            "html",
            "xml",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "svelte",
        },
        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = false,
                },
                per_filetype = {
                    ["html"] = {
                        enable_close = true,
                    },
                    ["typescriptreact"] = {
                        enable_close = true,
                    },
                },
            })
        end,
    }
}
