return {
    {
        "echasnovski/mini.comment",
        version = false,
        dependencies = {
            "JoosepAlviste/nvim-ts-context-commentstring",
        },
        config = function()
            require("ts_context_commentstring").setup({
                enable_autocmd = false,
            })
            require("mini.comment").setup({
                options = {
                    custom_commentstring = function()
                        return require("ts_context_commentstring.internal").calculate_commentstring({
                            key = "commentstring"
                        }) or vim.bo.commentstring
                    end,
                },
            })
        end,
    },
    {
        "echasnovski/mini.surround",
        event = { "BufReadPre", "BufNewFile" },
        -- No need to copy this inside `setup()`. Will be used automatically.
        opts = {
            -- Add custom surroundings to be used on top of builtin ones. For more
            -- information with examples, see `:h MiniSurround.config`.
            custom_surroundings = nil,

            -- Duration (in ms) of highlight when calling `MiniSurround.highlight()`
            highlight_duration = 500,

            -- Module mappings. Use `''` (empty string) to disable one.
            mappings = {
                add = "sa", -- Add surrounding in Normal and Visual modes
                delete = "sd", -- Delete surrounding
                find = "sf", -- Find surrounding (to the right)
                find_left = "sF", -- Find surrounding (to the left)
                highlight = "sh", -- Highlight surrounding
                replace = "sr", -- Replace surrounding

                suffix_last = "l", -- Suffix to search with "prev" method
                suffix_next = "n", -- Suffix to search with "next" method
            },

            -- Number of lines within which surrounding is searched
            n_lines = 20,

            -- Whether to respect selection type:
            -- - Place surroundings on separate lines in linewise mode.
            -- - Place surroundings on each line in blockwise mode.
            respect_selection_type = false,

            -- How to search for surrounding (first inside current line, then inside
            -- neighborhood). One of 'cover', 'cover_or_next', 'cover_or_prev',
            -- 'cover_or_nearest', 'next', 'prev', 'nearest'. For more details,
            -- see `:h MiniSurround.config`.
            search_method = "cover",

            -- Whether to disable showing non-error feedback
            -- This also affects (purely informational) helper messages shown after
            -- idle time if user input is required.
            silent = false,
        }
    },
    {
        "echasnovski/mini.trailspace",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            local miniTrailspace = require("mini.trailspace")

            miniTrailspace.setup({
                only_in_normal_buffers = true,
            })

            vim.keymap.set("n", "<leader>cw", function() miniTrailspace.trim() end, { desc = "Erase Whitespace" })

            vim.api.nvim_create_autocmd("CursorMoved", {
                pattern = "*",
                callback = function()
                    require("mini.trailspace").unhighlight()
                end,
            })
        end,
    },
}
