vim.g.mapleader = " "

local keymap = vim.keymap

-- keymap.set("n", "<leader>pv", vim.cmd.Ex)

keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window managment
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split windows vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split windows horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

vim.keymap.set("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Ver diagnóstico en popup" })

vim.keymap.set("n", "<leader>fd", "<cmd>Telescope diagnostics<cr>", { desc = "Ver diagnósticos del proyecto" })

-- see type or help LSP

vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Ver tipo o ayuda LSP" })

-- create new file from buffer
--
vim.keymap.set("n", "<leader>nf", function()
	local input = vim.fn.input("New file path: ", vim.fn.expand("%:p:h") .. "/", "file")
	if input ~= "" then
		vim.cmd("edit " .. input)
	end
end, { desc = "Create new file in current directory" })

-- test
vim.keymap.set("n", "<A-h>", "<C-w>h", { desc = "Ir a split izq" })
vim.keymap.set("n", "<A-j>", "<C-w>j", { desc = "Ir a split abajo" })
vim.keymap.set("n", "<A-k>", "<C-w>k", { desc = "Ir a split arriba" })
vim.keymap.set("n", "<A-l>", "<C-w>l", { desc = "Ir a split der" })
