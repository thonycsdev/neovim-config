return {
	{
		"saghen/blink.cmp",
		-- release tag: downloads the prebuilt binary (no Rust needed)
		version = "1.*",
		dependencies = { "rafamadriz/friendly-snippets" },
		opts = {
			-- <C-space> opens menu / docs, <C-y> accepts, <C-n>/<C-p> navigate, <C-e> closes
			keymap = { preset = "default" },
			completion = {
				documentation = { auto_show = true },
			},
			signature = { enabled = true },
			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},
		},
	},
}
