return {
    {
        "mason-org/mason.nvim",
        lazy = false,
        dependencies = {
            "williamboman/mason-lspconfig.nvim",
            "WhoIsSethDaniel/mason-tool-installer.nvim",
            "hrsh7th/cmp-nvim-lsp",
            "neovim/nvim-lspconfig",
        },
        config = function()
            local mason = require("mason")
            local mason_lspconfig = require("mason-lspconfig")
            local mason_tool_installer = require("mason-tool-installer")

            mason.setup({
                ui = {
                    icons = {
                        package_installed = "✓",
                        package_pending = "➜",
                        package_uninstalled = "✗",
                    },
                },
            })

            mason_lspconfig.setup({
                automatic_enable = false,
                -- servers for mason to install
                ensure_installed = {
                    "lua_ls",
                    "ts_ls", -- currently using a ts plugin
                    "html",
                    "cssls",
                    "tailwindcss",
                    "angularls",
                    "emmet_ls",
                    "emmet_language_server",
                    -- "eslint",
                    "marksman",
                },
            })

            mason_tool_installer.setup({
                ensure_installed = {
                    "prettier", -- prettier formatter
                    "stylua",   -- lua formatter
                    "denols",
                    -- { 'eslint_d', version = '13.1.2' },
                },

                -- NOTE: mason BREAKING Change! Removed setup_handlers
                -- moved lsp configuration settings back into lspconfig.lua file
            })
        end,
    }
}
