local opt = vim.opt
local o = vim.o
local g = vim.g

-------------------------------------- globals -----------------------------------------
g.toggle_theme_icon = "   "

vim.wo.number = true
vim.wo.relativenumber = true

----- desactiva el wrap de líneas
vim.wo.wrap = false
---
----- muestra un indicador para líneas que continúan fuera de la pantalla
vim.wo.listchars = 'extends:→,precedes:←'

-- opcional: habilita el desplazamiento horizontal suave
vim.o.sidescroll = 1
vim.o.sidescrolloff = 8

-- theme

vim.cmd [[colorscheme tokyonight]]
--

vim.cmd [[augroup AutoFormat]]
vim.cmd [[autocmd!]]
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]
vim.cmd [[augroup END]]



-- add binaries installed by mason.nvim to path
local is_windows = vim.fn.has "win32" ~= 0
local sep = is_windows and "\\" or "/"
local delim = is_windows and ";" or ":"
vim.env.PATH = table.concat({ vim.fn.stdpath "data", "mason", "bin" }, sep) .. delim .. vim.env.PATH




-- ñade esto a tu archivo de configuración de Neovim (e.g., init.lua)

-- Detecta si estamos en WSL
local in_wsl = vim.fn.has('wsl') == 1

-- Configura el portapapeles
if in_wsl then
	vim.g.clipboard = {
		name = 'WslClipboard',
		copy = {
			['+'] = 'clip.exe',
			['*'] = 'clip.exe',
		},
		paste = {
			['+'] =
			'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
			['*'] =
			'powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace("`r", ""))',
		},
		cache_enabled = 0,
	}
else
	vim.opt.clipboard:append("unnamedplus")
	-- Configura Neovim para usar el registro del sistema por defecto
	vim.opt.clipboard:append("unnamedplus")
	-- Función para sincronizar el yanking con el portapapeles del sistema
	local function sync_clipboard(event)
		if event.operator == 'y' and event.regname == '' then
			vim.fn.setreg('+', vim.fn.getreg('"'))
		end
	end

	-- Configura un autocomando para sincronizar después de cada operación de yanking
	vim.api.nvim_create_autocmd("TextYankPost", {
		callback = sync_clipboard
	})

	-- Mapeos opcionales para copiar/pegar explícitamente al portapapeles del sistema
	vim.api.nvim_set_keymap('n', '<leader>y', '"+y', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('v', '<leader>y', '"+y', { noremap = true, silent = true })
	vim.api.nvim_set_keymap('n', '<leader>p', '"+p', { noremap = true, silent = true })
end
