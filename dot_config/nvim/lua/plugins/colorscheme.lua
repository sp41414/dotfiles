return {
    -- {
    --     "rose-pine/neovim",
    --     name = "rose-pine",
    --     config = function()
    --         require("rose-pine").setup({
    --             styles = {
    --                 bold = true,
    --                 italic = true,
    --                 transparency = false,
    --             },
    --             highlight_groups = {
    --                 Normal = { bg = "#000000" },
    --                 NormalNC = { bg = "#000000" },
    --                 NormalFloat = { bg = "#000000" },
    --                 FloatBorder = { fg = "subtle", bg = "#000000" },
    --                 FloatTitle = { bg = "#000000" },
    --                 DiagnosticFloatingError = { bg = "#000000" },
    --                 DiagnosticFloatingWarn = { bg = "#000000" },
    --                 DiagnosticFloatingInfo = { bg = "#000000" },
    --                 DiagnosticFloatingHint = { bg = "#000000" },
    --             },
    --         })
    --
    --         vim.cmd("colorscheme rose-pine")
    --     end,
    -- },
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        config = function()
            require("tokyonight").setup({
                style = "night",
                on_colors = function(colors)
                    colors.bg = "#000000"
                    colors.bg_dark = "#000000"
                    colors.bg_float = "#000000"
                    colors.bg_popup = "#000000"
                    colors.bg_sidebar = "#000000"
                    colors.bg_statusline = "#000000"
                end,
            })

            vim.cmd("colorscheme tokyonight")
        end,
    }
}
