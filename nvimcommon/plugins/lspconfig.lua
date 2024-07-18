local M = {
	"neovim/nvim-lspconfig",
	opts = function(_, opts)
		local cwd = vim.fn.getcwd()
		local clangBin = "clangd"
		if vim.fn.filereadable(cwd .. "/sdkconfig") == 1 then
			clangBin = "/Users/palanglung/Repo/t/esp/tools/tools/esp-clang/16.0.1-fe4f10a809/esp-clang/bin/clangd"
		end

		opts.servers.clangd.cmd = {
			clangBin,
			"--background-index",
			"--clang-tidy",
			"--header-insertion=iwyu",
			"--completion-style=detailed",
			"--function-arg-placeholders",
		}
	end,
}

return M
