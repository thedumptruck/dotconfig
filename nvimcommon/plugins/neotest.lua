local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-neotest/nvim-nio",
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "antoinemadec/FixCursorHold.nvim",
    "sidlatau/neotest-dart",
    "nvim-neotest/neotest-jest",
    "thenbe/neotest-playwright",
  },
  config = function()
    require("neotest").setup {
      adapters = {
        require("neotest-dart") {
          command = 'flutter', -- Command being used to run tests. Defaults to `flutter`
          -- Change it to `fvm flutter` if using FVM
          -- change it to `dart` for Dart only tests
          use_lsp = true -- When set Flutter outline information is used when constructing test name.
        },
        require('neotest-jest')({
          jestCommand = "npx jest",
          env = { CI = true },
          cwd = function(_)
            return vim.fn.getcwd()
          end,
        }),
        require("neotest-playwright").adapter({
          options = {
            preset = "headed",
            persist_project_selection = true,
          }
        }),
      }
    }
  end
}

return M
