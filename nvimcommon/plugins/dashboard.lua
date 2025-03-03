local Logo = {
	[[                                                                            ]],
	[[         __         __            __       __           __           __     ]],
	[[        /\ \       /\ \          /\ \     /\ \         /\ \         /\ \    ]],
	[[       /  \ \     /  \ \____     \ \ \    \_\ \       /  \ \       /  \ \   ]],
	[[      / /\ \ \   / /\ \_____\    /\ \_\   /\__ \     / /\ \ \     / /\ \ \  ]],
	[[     / / /\ \_\ / / /\/___  /   / /\/_/  / /_ \ \   / / /\ \ \   / / /\ \_\ ]],
	[[    / /_/_ \/_// / /   / / /   / / /    / / /\ \ \ / / /  \ \_\ / / /_/ / / ]],
	[[   / /____/\  / / /   / / /   / / /    / / /  \/_// / /   / / // / /__\/ /  ]],
	[[  / /\____\/ / / /   / / /   / / /    / / /      / / /   / / // / /_____/   ]],
	[[ / / /______ \ \ \__/ / /___/ / /__  / / /      / / /___/ / // / /\ \ \     ]],
	[[/ / /_______\ \ \___\/ //\__\/_/___\/_/ /      / / /____\/ // / /  \ \ \    ]],
	[[\/__________/  \/_____/ \/_________/\_\/       \/_________/ \/_/    \_\/    ]],
	[[                                                                            ]],
	[[                                                                            ]],
}

local Footer = "One Per/Cent a Day"

local M = {
	{ "goolord/alpha-nvim", enabled = false },
	{ "echasnovski/mini.starter", enabled = false },
	{
		"folke/snacks.nvim",
		opts = {
			dashboard = {
				preset = {
					header = table.concat(Logo, "\n"),
				},
			},
		},
	},
	{
		"nvimdev/dashboard-nvim",
		enabled = true,
		lazy = false,
		event = "VimEnter",
		dependencies = { { "nvim-tree/nvim-web-devicons" } },
		opts = function()
			local opts = {
				theme = "doom",
				hide = {
					-- this is taken care of by lualine
					-- enabling this messes up the actual laststatus setting after loading a file
					statusline = false,
				},
				config = {
					header = Logo,
          -- stylua: ignore
          center = {
            { action = 'lua LazyVim.pick()()',                           desc = " Find File",       icon = " ", key = "f" },
            { action = "ene | startinsert",                              desc = " New File",        icon = " ", key = "n" },
            { action = 'lua LazyVim.pick("oldfiles")()',                 desc = " Recent Files",    icon = " ", key = "r" },
            { action = 'lua LazyVim.pick("live_grep")()',                desc = " Find Text",       icon = " ", key = "g" },
            { action = 'lua LazyVim.pick.config_files()()',              desc = " Config",          icon = " ", key = "c" },
            { action = 'lua require("persistence").load()',              desc = " Restore Session", icon = " ", key = "s" },
            { action = "Lazy",                                           desc = " Lazy",            icon = "󰒲 ", key = "l" },
            { action = function() vim.api.nvim_input("<cmd>qa<cr>") end, desc = " Quit",            icon = " ", key = "q" },
          },
					footer = function()
						local stats = require("lazy").stats()
						local ms = (math.floor(stats.startuptime * 100 + 0.5) / 100)
						return {
							"⚡" .. Footer .. " " .. stats.loaded .. "/" .. stats.count .. " within in " .. ms .. "ms",
						}
					end,
				},
			}

			for _, button in ipairs(opts.config.center) do
				button.desc = button.desc .. string.rep(" ", 43 - #button.desc)
				button.key_format = "  %s"
			end

			-- open dashboard after closing lazy
			if vim.o.filetype == "lazy" then
				vim.api.nvim_create_autocmd("WinClosed", {
					pattern = tostring(vim.api.nvim_get_current_win()),
					once = true,
					callback = function()
						vim.schedule(function()
							vim.api.nvim_exec_autocmds("UIEnter", { group = "dashboard" })
						end)
					end,
				})
			end

			return opts
		end,
	},
}

return M
