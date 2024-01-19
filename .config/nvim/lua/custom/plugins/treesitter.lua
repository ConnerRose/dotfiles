return {
	"nvim-treesitter/nvim-treesitter",
	opts = function()
		return require("plugins.configs.treesitter")
	end,
	config = function(_, opts)
		dofile(vim.g.base46_cache .. "syntax")

		opts.ensure_installed = {
			"c",
			"css",
			"git_config",
			"git_rebase",
			"gitattributes",
			"gitcommit",
			"gitignore",
			"html",
			"htmldjango",
			"lua",
			"python",
			"query",
			"vim",
			"vimdoc",
		}
		opts.ignore_install = { "tex" }
		opts.highlight.disable = { "tex" }
		opts.auto_install = true

		require("nvim-treesitter.configs").setup(opts)
	end,
}
