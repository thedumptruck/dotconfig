local M = {
  "glepnir/lspsaga.nvim",
  config = function()
    local saga = require("lspsaga")

    saga.setup({
      -- keybinds for navigation in lspsaga window
      move_in_saga = { prev = "<C-k>", next = "<C-j>" },
      -- use enter to open file with finder
      finder = {
        open = "<CR>",
      },
      -- use enter to open file with definition preview
      definition = {
        edit = "<CR>",
      },
    })

    local keymap = vim.keymap.set

    -- Lsp finder find the symbol definition implement reference
    -- if there is no implement it will hide
    -- when you use action in finder like open vsplit then you can
    -- use <C-t> to jump back
    keymap("n", "gh", "<cmd>Lspsaga lsp_finder<CR>", { silent = true })

    -- Rename
    keymap("n", "gr", "<cmd>Lspsaga rename<CR>", { silent = true })

    -- Peek Definition
    -- you can edit the definition file in this flaotwindow
    -- also support open/vsplit/etc operation check definition_action_keys
    -- support tagstack C-t jump back
    keymap("n", "gd", "<cmd>Lspsaga peek_definition<CR>", { silent = true })

    -- Hover Doc
    keymap("n", "K", "<cmd>Lspsaga hover_doc<CR>", { silent = true })

    -- Float terminal
    keymap("n", "<A-d>", "<cmd>Lspsaga open_floaterm<CR>", { silent = true })
    keymap("n", "∂", "<cmd>Lspsaga open_floaterm<CR>", { silent = true }) -- macos ALT+d(Option+d) binding
    -- close floaterm
    keymap("t", "<A-d>", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true })
    keymap("t", "∂", [[<C-\><C-n><cmd>Lspsaga close_floaterm<CR>]], { silent = true }) -- macos ALT+d(Option+d) binding
  end,
}

return M
