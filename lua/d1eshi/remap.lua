vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.keymap.set(mode, lhs, rhs, options)
end

-- Toggle NvimTree
map("n", "<C-n>", ":NvimTreeToggle<CR>")
-- -- Focus NvimTree
map("n", "<leader>e", ":NvimTreeFocus<CR>")

vim.keymap.set("x", "<leader>p", [["_dP]])


-- Opcional: Mapeo para alternar el wrap de texto
-- vim.api.nvim_set_keymap('n', '<leader>w', ':set wrap!<CR>', { noremap = true, silent = true })

--local function map(mode, lhs, rhs, opts)
--  local options = { noremap = true, silent = true }
--  if opts then
--    options = vim.tbl_extend("force", options, opts)
--  end
--  vim.api.nvim_set_keymap(mode, lhs, rhs, options)
--end
--
---- Cerrar fold (plegar) en la posición del cursor
--map('n', '<C-[>', ':lua vim.cmd("normal! zc")<CR>')
----
---- -- Abrir todos los folds (desplegar todo)
--map('n', '<C-]>', ':lua vim.cmd("normal! zR")<CR>')
