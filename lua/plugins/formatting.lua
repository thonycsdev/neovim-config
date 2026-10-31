return {
	{
		"stevearc/conform.nvim",
		event = "BufWritePre",
		cmd = "ConformInfo",
		keys = {
			{
				"<leader>lf",
				function()
					require("conform").format({ async = true })
				end,
				mode = "",
				desc = "Format buffer",
			},
		},
		opts = {
			-- formatters must be installed separately (see :Mason)
			formatters_by_ft = {
				lua = { "stylua" },
				javascript = { "prettier" },
				javascriptreact = { "prettier" },
				typescript = { "prettier" },
				typescriptreact = { "prettier" },
				json = { "prettier" },
				php = { "php_cs_fixer" },
			},
			-- use the LSP formatter when no formatter is configured for the filetype
			default_format_opts = { lsp_format = "fallback" },
			format_on_save = { timeout_ms = 500 },
		},
	},
}
