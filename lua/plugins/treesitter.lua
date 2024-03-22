return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local configTreeSitter = require("nvim-treesitter.configs")

		configTreeSitter.setup({
			ensure_installed = { "lua", "javascript", "c_sharp", "go" },
			auto_install = true,
			highlight = { enable = true },
			indent = { enable = true },
			autotag = {enable = true}
		})
	end
}
