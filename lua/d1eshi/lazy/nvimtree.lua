return {
	"nvim-tree/nvim-tree.lua",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	config = function()
		require("nvim-tree").setup({
			filters = { 
				dotfiles = false,  -- Mostrar archivos ocultos
			},
			disable_netrw = true,  -- Deshabilitar netrw en favor de nvim-tree
			hijack_cursor = true,  -- Mantener el cursor en el primer carácter del nombre del archivo
			sync_root_with_cwd = true,  -- Cambiar el directorio raíz de nvim-tree cuando cambia el CWD
			update_focused_file = {
				enable = true,  -- Actualizar el foco al cambiar de buffer
				update_root = false,  -- No cambiar el directorio raíz al enfocar un archivo
			},
			view = {
				width = 30,  -- Ancho del panel de nvim-tree
				preserve_window_proportions = true,  -- Mantener las proporciones de las ventanas al redimensionar
			},
			renderer = {
				highlight_git = true,  -- Resaltar archivos según su estado en Git
				indent_markers = {
					enable = true,  -- Mostrar marcadores de indentación
				},
				icons = {
					glyphs = {
						default = "󰈚",
						folder = {
							default = "",
							empty = "",
							empty_open = "",
							open = "",
							symlink = "",
						},
						git = {
							unstaged = "✗",
							staged = "✓",
							unmerged = "",
							renamed = "➜",
							untracked = "★",
							deleted = "",
							ignored = "◌",
						},
					},
				},
			},
			actions = {
				open_file = {
					quit_on_open = false,  -- No cerrar nvim-tree al abrir un archivo
					resize_window = true,  -- Redimensionar la ventana al abrir un archivo
				},
			},
		})
	end,
}
