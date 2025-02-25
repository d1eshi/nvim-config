return {
  'nvim-tree/nvim-tree.lua',
  dependencies = 'nvim-tree/nvim-web-devicons',

  config = function()
    local nvimtree = require("nvim-tree")

    -- recommended settings from nvim-tree documentation
    vim.g.loaded_netrw = 1
    vim.g.loaded_netrwPlugin = 1

    nvimtree.setup({
      view = {
        width = 1000,
        relativenumber = true,
        --adaptive_size = true, -- Ajusta automáticamente el tamaño
      },
      -- change folder arrow icons
      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          glyphs = {
            folder = {
              arrow_closed = "", -- arrow when folder is closed
              arrow_open = "", -- arrow when folder is open
            },
          },
        },
      },
      -- disable window_picker for
      -- explorer to work well with
      -- window splits
      actions = {
        open_file = {
          window_picker = {
            enable = false,
          },
          quit_on_open = true
        },
      },
     update_focused_file = {
        enable = true, -- Resalta el archivo actual
      },
      filters = {
        custom = { ".DS_Store" },
      },
      git = {
        ignore = false,
      },
    })
    
-- 📌 Función para abrir nvim-tree en pantalla completa
    local function toggle_nvim_tree_fullscreen()
      local view = require("nvim-tree.view")

      if view.is_visible() then
        -- Si `nvim-tree` está abierto, lo cerramos y cerramos el tab si fue creado para esto
        require("nvim-tree").toggle()
        vim.cmd("tabclose")  
      else
        -- Guardamos el buffer actual para volver después
        vim.g.last_buffer = vim.api.nvim_get_current_buf()

        -- Abrimos un nuevo tab y activamos `nvim-tree`
        vim.cmd("tabnew")
        require("nvim-tree").toggle(true, true)
      end
    end


vim.keymap.set("n", "pv", ":lua toggle_nvim_tree_fullscreen()<CR>", { noremap = true, silent = true })

  end
}

