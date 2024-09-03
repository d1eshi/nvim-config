vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)


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
