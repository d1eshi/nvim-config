return {
	"kevinhwang91/nvim-ufo",
	dependencies = { "kevinhwang91/promise-async" },
	config = function()
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true

		local ufo = require("ufo")

		ufo.setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" } -- sin "lsp" para evitar error al iniciar
			end,
			open_fold_hl_timeout = 150,
			close_fold_kinds = { "imports", "comment" },
		})

		-- 🔁 Conectamos manualmente LSP → UFO sólo cuando el LSP esté listo
		vim.api.nvim_create_autocmd("LspAttach", {
			callback = function(args)
				ufo.attach(args.buf)
			end,
		})

		-- Keymaps adicionales
		local keymap = vim.keymap
		keymap.set("n", "zR", function()
			ufo.openAllFolds()
		end, { desc = "Abrir todos los folds" })
		keymap.set("n", "zM", function()
			ufo.closeAllFolds()
		end, { desc = "Cerrar todos los folds" })
		keymap.set("n", "zO", function()
			ufo.openFoldUnderCursor()
		end, { desc = "Abrir fold bajo cursor" })
		keymap.set("n", "zC", function()
			ufo.closeFoldUnderCursor()
		end, { desc = "Cerrar fold bajo cursor" })
	end,
}
