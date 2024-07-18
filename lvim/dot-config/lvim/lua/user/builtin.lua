-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
vim.opt.relativenumber = true
vim.g.editorconfig = true
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.colorscheme = "catppuccin"

-- lvim.builtin.theme.options.dim_inactive = true
-- lvim.builtin.theme.options.style = "storm"

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

lvim.builtin.alpha.dashboard.section.header.val = {
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
}

lvim.builtin.alpha.dashboard.section.footer.val = "One Per/Cent a Day"
