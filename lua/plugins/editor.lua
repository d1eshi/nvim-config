return {
  {
    "telescope.nvim",
    dependencies = {
      "nvim-telescope/telescope-file-browser.nvim",
    },
    keys = {
      {
        "<leader>pf",
        function()
          require("telescope.builtin").find_files({})
        end,
      },

      {
        "<leader>pws",
        function()
          local builtin = require("telescope.builtin")
          builtin.live_grep()
        end,
        desc = "Find Plugin Words",
      },
    },
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    cmd = "Neotree",
    keys = {
      -- Toggle NeoTree
      {
        "<C-n>",
        function()
          require("neo-tree.command").execute({ toggle = true, dir = LazyVim.root() })
        end,
        desc = "Toggle NeoTree (Root Dir)",
      },
      -- Focus NeoTree
      {
        "<leader>e",
        function()
          require("neo-tree.command").execute({ toggle = false, focus = true })
        end,
        desc = "Focus NeoTree",
      },
    },
  },
}
