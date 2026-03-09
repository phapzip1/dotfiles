return {
    {
        "stevearc/oil.nvim",
        dependencies = {
            "nvim-tree/nvim-web-devicons"
        },
        config = function()
            require("oil").setup({
                default_file_explorer = true,
                column = { },
                keymaps = {
                    ["<C-h>"] = false,
                    ["<C-c>"] = false,
                    ["<C-h>"] = "actions.select_split",
                    ["q"] = "actions.close",
                },
                delete_to_trash = true,
                view_options = {
                    show_hidden = true,
                },
                skip_confirm_for_simple_edits = true,
            })

            vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

            vim.api.nvim_create_autocmd("FileType", {
                callback = function()
                    vim.opt_local.cursorline = true
                end,
            })
        end,
    }
}
