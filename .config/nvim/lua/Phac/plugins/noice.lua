return {
    {
        "folke/noice.nvim",
        event = "VeryLazy",
        enabled = true,
        dependencies = {
            "MunifTanjim/nui.nvim",
        },
        config = function()
            local noice = require("noice")

            noice.setup({
                cmdline = {
                    enabled = false,
                },
                views = {
                    popupmenu = {
                        relative = "editor",
                        row = 8,
                        col = "50%",
                    },
                    win_options = {
                        winhighlight = { Normal = "Normal", FloatBorder = "DiagnosticInfo" },
                    },
                    mini = {
                        size = {
                            width = "auto",
                            height = "auto",
                            max_height = 15,
                        },
                        position = {
                            row = -2,
                            col = "100%",
                        },
                    },
                },
                lsp = {
                    progress = {
                        enabled = true,
                    },
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                    signature = {
                        auto_open = {
                            enabled = false, -- disable auto signature help on insert mode
                        },
                    },
                },
                routes = {
                    {
                        filter = {
                            event = "msg_show",
                            any = {
                                { find = "%d+L, %d+B" },
                                { find = "; after #%d+" },
                                { find = "; before #%d+" },
                                { find = "%d fewer lines" },
                                { find = "%d more lines" },
                            },
                        },
                        opts = {
                            skip = true,
                        },
                    },
                },
                messages = {
                    enabled = false,
                },
                health = {
                    checker = true,
                },
                popupmenu = {
                    enabled = true,
                    backend = "cmp",
                },
                signature = {
                    enabled = true,
                },
            })
        end,
    },
}
