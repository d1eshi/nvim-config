return {
  "folke/which-key.nvim",
  config = function()
    local wk = require("which-key")
    wk.setup()

    local map = vim.keymap.set

    -- Movimiento en modo inserción
    map("i", "<C-h>", "<Left>", { desc = "Mover izquierda" })
    map("i", "<C-l>", "<Right>", { desc = "Mover derecha" })
    map("i", "<C-j>", "<Down>", { desc = "Mover abajo" })
    map("i", "<C-k>", "<Up>", { desc = "Mover arriba" })

    -- Movimiento entre ventanas
    map("n", "<C-h>", "<C-w>h", { desc = "Ventana izquierda" })
    map("n", "<C-l>", "<C-w>l", { desc = "Ventana derecha" })
    map("n", "<C-j>", "<C-w>j", { desc = "Ventana abajo" })
    map("n", "<C-k>", "<C-w>k", { desc = "Ventana arriba" })
    -- Guardar y copiar
    map("n", "<C-s>", "<cmd>w<CR>", { desc = "Guardar archivo" })
    map("n", "<C-c>", "<cmd>%y+<CR>", { desc = "Copiar todo el archivo" })

    -- Toggles
    map("n", "<leader>n", "<cmd>set nu!<CR>", { desc = "Toggle números de línea" })
    map("n", "<leader>rn", "<cmd>set rnu!<CR>", { desc = "Toggle números relativos" })

    -- Buffers
    map("n", "<Tab>", "<cmd>bnext<CR>", { desc = "Siguiente buffer" })
    map("n", "<S-Tab>", "<cmd>bprevious<CR>", { desc = "Buffer anterior" })
    map("n", "<leader>x", "<cmd>bd<CR>", { desc = "Cerrar buffer" })

    -- NvimTree
    map("n", "<C-n>", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle NvimTree" })
    map("n", "<leader>e", "<cmd>NvimTreeFocus<CR>", { desc = "Foco en NvimTree" })

    -- Telescope
    map("n", "<leader>pf", "<cmd>Telescope find_files<CR>", { desc = "Buscar archivos" })
    map("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Buscar en archivos" })
    map("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Buscar buffers" })
    end,
}
