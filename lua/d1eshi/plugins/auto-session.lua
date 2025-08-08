return {
	"rmagatti/auto-session",
	config = function()
		local auto_session = require("auto-session")

		auto_session.setup({
			auto_restore_enabled = false,
			auto_session_supress_dirs = { "~/", "~/Dev/", "~/Downloads", "~/Documents", "~/Desktop/", "~/projects/" },
			post_restore_cmds = { "cd %:p:h" }, -- cambia el cwd al path del archivo actual
		})

		local keymap = vim.keymap

		keymap.set("n", "<leader>wr", "<cmd>SessionRestore<CR>", { desc = "Restore session for cwd" })
		keymap.set("n", "<leader>ws", "<cmd>SessionSave<CR>", { desc = "Save session for auto session root dir" })
		vim.keymap.set("n", "<leader>cwd", function()
			print("Current directory: " .. vim.fn.getcwd())
		end, { desc = "Mostrar CWD actual" })
	end,
}
