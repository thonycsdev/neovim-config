return {
    {
	"mason-org/mason-lspconfig.nvim",
	dependencies = {
	    { "mason-org/mason.nvim", opts = {} },
	    "neovim/nvim-lspconfig",
	},
	config = function()
	    -- lua_ls: recognize the Neovim API (`vim` global, runtime)
	    vim.lsp.config("lua_ls", {
		settings = {
		    Lua = {
			runtime = { version = "LuaJIT" },
			diagnostics = { globals = { "vim" } },
			workspace = {
			    checkThirdParty = false,
			    library = { vim.env.VIMRUNTIME },
			},
		    },
		},
	    })

	    -- installs the servers via Mason and calls vim.lsp.enable() on them
	    require("mason-lspconfig").setup({
		ensure_installed = { "lua_ls", "ts_ls", "intelephense" },
	    })

	    vim.diagnostic.config({ virtual_text = true })

	    vim.api.nvim_create_autocmd("LspAttach", {
		callback = function(args)
		    local opts = { buffer = args.buf }
		    vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
		    vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
		    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
		    vim.keymap.set("n", "gri", vim.lsp.buf.implementation, opts)
		    vim.keymap.set("n", "go", vim.lsp.buf.type_definition, opts)
		    vim.keymap.set("n", "grr", vim.lsp.buf.references, opts)
		    vim.keymap.set("n", "gs", vim.lsp.buf.signature_help, opts)
		    vim.keymap.set("n", "gn", vim.diagnostic.open_float, opts)
		    vim.keymap.set("n", "<F2>", vim.lsp.buf.rename, opts)
		    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
		end,
	    })
	end,
    },
}
