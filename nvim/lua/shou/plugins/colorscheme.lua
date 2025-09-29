return {
    {
        "folke/tokyonight.nvim",
        enabled = false,
        lazy = false,
        prority = 1000,
        config = function()
            require("tokyonight").setup()
        end,
    },
    {
        "craftzdog/solarized-osaka.nvim",
        enabled = true,
        lazy = false,
        prority = 1000,
        config = function()
            require("solarized-osaka").setup()
        end,
    },
}
