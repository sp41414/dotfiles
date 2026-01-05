return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		opts = {
			ensure_installed = {
				"c",
				"lua",
				"markdown",
				"javascript",
				"typescript",
				"css",
				"html",
				"json",
				"yaml",
				"python",
				"go",
				"bash",
				"fish",
				"java",
			},
			sync_install = false,
			auto_install = true,

			indent = {
				enable = true,
			},

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = { "markdown" },
			},
		},
	},
}
