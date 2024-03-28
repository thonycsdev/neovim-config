return {
	--- Uncomment the two plugins below if you want to manage the language servers from neovim
	{ 'williamboman/mason.nvim',   config = function() require('mason').setup({
    }) end },
	{
		'williamboman/mason-lspconfig.nvim',
		config = function()
			require('lsp-zero').extend_lspconfig()
			require('mason-lspconfig').setup({
				ensure_installed = {"gopls"},
				handlers = {
					require('lsp-zero').default_setup
				}
			})
			require('lsp-zero').on_attach(function(client, bufnr)
				require('lsp-zero').default_keymaps({ buffer = bufnr })
			end
			)
			vim.keymap.set('n', '<C-k>', vim.lsp.buf.code_action, {})
		end
	},

	{ 'VonHeikemen/lsp-zero.nvim', branch = 'v3.x' },
	{ 'neovim/nvim-lspconfig' },
	{ 'hrsh7th/cmp-nvim-lsp' },
	{ 'hrsh7th/nvim-cmp' },
	{ 'L3MON4D3/LuaSnip' },
}
