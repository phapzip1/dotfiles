return {
    {
        "folke/todo-comments.nvim",
        event = { "BufReadPre", "BufNewFile" },
        dependencies = {
            "nvim-lua/plenary.nvim"
        },
        config = function()
            local todo_comments = require("todo-comments")

            todo_comments.setup({
                keywords = {
                    FIX = {
                        color = "error",
                        alt = { "FIXME", "BUG", "FIXIT", "ISSUE" },
                    },
                    TODO = {
                        color = "info",
                    },
                    WARN = {
                        color = "warning",
                    },
                    NOTE = {
                        color = "hint",
                    },
                },
                highlight = {
                    multiline = true,
                    multiline_pattern = "^.",
                    multiline_context = 10,
                    before = "",
                    keyword = "wide",
                    after = "fg",
                    pattern = {
                        [[.*(KEYWORDS)]\s*:]], -- default pattern,
                        [[<!--\s*(KEYWORDS)\s*:.*-->]], -- html with colon
                        [[<!--\s*(KEYWORDS)\s*.*-->]], -- html without colon
                    },
                    comments_only = false,
                },
                search = {
                    command = "rg",
                    args = {
                        "--color=never",
                        "--no-heading",
                        "--with-filename",
                        "--linenumber",
                        "--column",
                    },
                    pattern = [[\b(KEYWORDS)\B]],
                },
            })

            vim.keymap.set("n", "]t", function()
                todo_comments.jump_next()
            end, { desc = "next todo comment" })

            vim.keymap.set("n", "[t", function()
                todo_comments.jump_prev()
            end, { desc = "previous todo comment" })
        end,
    },
}
