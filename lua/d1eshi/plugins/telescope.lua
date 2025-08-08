return {

	"nvim-telescope/telescope.nvim",

	tag = "0.1.x",

	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"ahmedkhalf/project.nvim",
	},

	config = function()
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		telescope.setup({
			defaults = {
				path_display = { "smart" },
				mappings = {
					i = {
						["<C-k>"] = actions.move_selection_previous,
						["<C-n>"] = nil,
						["<C-j>"] = actions.move_selection_next,
						["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
					},
				},
			},
			extensions = {
				projects = {
					hidden_files = true,
					theme = "dropdown",
				},
			},
		})

		telescope.load_extension("fzf")

		require("project_nvim").setup({
			detection_methods = { "lsp", "pattern" },
			patterns = { ".git", "package.json", "tsconfig.json", "Makefile" },
		})

		require("telescope").load_extension("projects")

		local builtin = require("telescope.builtin")

		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<C-p>", builtin.git_files, {})
		-- vim.keymap.set("n", "<leader>fws", function()
		-- 	local word = vim.fn.expand("<cword>")
		-- 	builtin.grep_string({ search = word })
		-- end)
		vim.keymap.set("n", "<leader>fWs", function()
			local word = vim.fn.expand("<cWORD>")
			builtin.grep_string({ search = word })
		end)
		vim.keymap.set("n", "<leader>fs", function()
			builtin.grep_string({ search = vim.fn.input("Grep > ") })
		end)
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
		vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor cwd" })
		vim.keymap.set("n", "<leader>fp", "<cmd>Telescope projects<cr>", { desc = "Buscar proyecto reciente" })
	end,
}
