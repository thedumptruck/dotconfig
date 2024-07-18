local M = {
	"nvim-treesitter/nvim-treesitter",
	opts = function(_, opts)
		opts.auto_install = true
		return opts
	end,
}

return M
