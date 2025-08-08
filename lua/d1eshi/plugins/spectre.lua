return {
	"nvim-pack/nvim-spectre",
	cmd = "Spectre",
	keys = {
		{ "<leader>sr", "<cmd>Spectre<cr>", desc = "Buscar/Reemplazar en proyecto" },
		{
			"<leader>sw",
			function()
				require("spectre").open_visual({ select_word = true })
			end,
			mode = "v",
			desc = "Buscar palabra seleccionada",
		},
		{ "<leader>sp", "<cmd>lua require('spectre').open_file_search()<CR>", desc = "Buscar en archivo actual" },
	},
}
