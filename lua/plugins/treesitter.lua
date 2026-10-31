return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter").install({ "lua", "tsx", "typescript", "php" })

		vim.api.nvim_create_autocmd("FileType", {
			pattern = { "lua", "typescript", "typescriptreact", "php" },
			callback = function()
				vim.treesitter.start() -- highlight
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" -- indent
			end,
		})
	end,
}
