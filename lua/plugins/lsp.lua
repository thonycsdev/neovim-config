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
					local function map(lhs, rhs, desc)
						vim.keymap.set("n", lhs, rhs, { buffer = args.buf, desc = "LSP: " .. desc })
					end
					map("K", vim.lsp.buf.hover, "Hover docs")
					map("gd", vim.lsp.buf.definition, "Go to definition")
					map("gD", vim.lsp.buf.declaration, "Go to declaration")
					map("gri", vim.lsp.buf.implementation, "Go to implementation")
					map("go", vim.lsp.buf.type_definition, "Go to type definition")
					map("grr", vim.lsp.buf.references, "References")
					map("gs", vim.lsp.buf.signature_help, "Signature help")
					map("gn", vim.diagnostic.open_float, "Line diagnostics")
					map("<F2>", vim.lsp.buf.rename, "Rename")
					map("<leader>ca", vim.lsp.buf.code_action, "Code action")
				end,
			})
		end,
	},
}
