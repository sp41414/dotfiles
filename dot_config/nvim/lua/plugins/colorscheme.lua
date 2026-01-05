return {
    -- {
    -- 	"rose-pine/neovim",
    -- 	name = "rose-pine",
    -- 	config = function()
    -- 		require("rose-pine").setup({
    -- 			styles = {
    -- 				bold = true,
    -- 				italic = true,
    -- 				transparency = false,
    -- 			},
    -- 			highlight_groups = {
    -- 				Normal = { bg = "#000000" },
    -- 				NormalNC = { bg = "#000000" },
    -- 				NormalFloat = { bg = "#000000" },
    -- 				FloatBorder = { fg = "subtle", bg = "#000000" },
    -- 				FloatTitle = { bg = "#000000" },
    -- 				DiagnosticFloatingError = { bg = "#000000" },
    -- 				DiagnosticFloatingWarn = { bg = "#000000" },
    -- 				DiagnosticFloatingInfo = { bg = "#000000" },
    -- 				DiagnosticFloatingHint = { bg = "#000000" },
    -- 			},
    -- 		})
    --
    -- 		vim.cmd("colorscheme rose-pine")
    -- 	end,
    -- },
    {
        "tiagovla/tokyodark.nvim",
        opts = {
            -- custom options here
        },
        config = function(_, opts)
            require("tokyodark").setup(opts) -- calling setup is optional
            vim.cmd [[colorscheme tokyodark]]
        end,
    }
}
