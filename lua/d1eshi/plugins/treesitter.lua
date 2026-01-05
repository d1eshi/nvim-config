return {
	"nvim-treesitter/nvim-treesitter",
	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		treesitter.setup({
			auto_install = true,

			indent = { enable = true },

			highlight = { enable = true },

			-- A list of parser names, or "all"
			ensure_installed = {
				"vimdoc",
				"javascript",
				"typescript",
				"c",
				"lua",
				"rust",
				"jsdoc",
				"bash",
				"json",
				"tsx",
				"yaml",
				"html",
				"css",
				"prisma",
				"markdown",
				"markdown_inline",
				"graphql",
				"query",
				"gitignore",
				"dockerfile",
				"python",
			},
		})

		require("nvim-ts-autotag").setup({
			opts = {
				-- Defaults
				enable_close = true, -- Auto close tags
				enable_rename = true, -- Auto rename pairs of tags
				enable_close_on_slash = false, -- Auto close on trailing </
			},
			-- Also override individual filetype configs, these take priority.
			-- Empty by default, useful if one of the "opts" global settings
			-- doesn't work well in a specific filetype
		})
	end,
}
