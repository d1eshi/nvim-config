return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup {
			ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "python" },
			auto_install = true,
			highlight = { enable = true },
		}
	end,
}
