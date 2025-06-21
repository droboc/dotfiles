return {

	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "typescript", "c", "go", "lua", "vim", "vimdoc", "query", "elixir", "heex", "javascript", "html", "tsx" },
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end

	}

}
