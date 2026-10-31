return {
	{
		"nvim-telescope/telescope.nvim",
		version = "*",
		dependencies = {
			"nvim-lua/plenary.nvim",
			-- optional but recommended
			{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		},
		config = function()
			require("telescope").load_extension("fzf")

			local builtin = require("telescope.builtin")
			vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Telescope find files" })
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Telescope live grep" })
			vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Telescope buffers" })
			vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Telescope help tags" })

			-- LSP pickers
			vim.keymap.set("n", "<leader>fd", builtin.diagnostics, { desc = "Telescope diagnostics" })
			vim.keymap.set("n", "<leader>fs", builtin.lsp_document_symbols, { desc = "Telescope document symbols" })
			vim.keymap.set(
				"n",
				"<leader>fS",
				builtin.lsp_dynamic_workspace_symbols,
				{ desc = "Telescope workspace symbols" }
			)
		end,
	},
}
