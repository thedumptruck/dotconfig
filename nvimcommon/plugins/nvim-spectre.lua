local M = {
	"nvim-pack/nvim-spectre",
	-- event = "BufRead",
	config = function()
		require("spectre").setup()
	end,
}

return M
