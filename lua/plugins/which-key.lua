return {
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- group names shown in the popup, one per plugin prefix
			spec = {
				{ "<leader>f", group = "Telescope" },
				{ "<leader>c", group = "Code (LSP)" },
				{ "<leader>l", group = "Format (conform)" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer keymaps (which-key)",
			},
		},
	},
}
