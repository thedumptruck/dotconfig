lvim.keys.insert_mode["jk"] = "<ESC>"
-- delete single character without copying into register
lvim.keys.normal_mode["x"] = '"_x'
-- spit windows verticall and horizontally
lvim.keys.normal_mode["<leader>|"] = ":vsplit<CR>"
lvim.keys.normal_mode["<leader>sv"] = ":vsplit<CR>"
lvim.keys.normal_mode["<leader>-"] = ":split<CR>"
-- aligh cursor on screen center during scroll
lvim.keys.normal_mode["<C-d>"] = "<C-d>zz"
lvim.keys.normal_mode["<C-u>"] = "<C-u>zz"

-- nvim spectre (find and replace)
lvim.keys.normal_mode["<leader>S"] = "<cmd>lua require('spectre').open()<CR>"

-- search current word
lvim.keys.normal_mode["<leader>Sw"] = "<cmd>lua require('spectre').open_visual({select_word=true})<CR>"
lvim.keys.normal_mode["<leader>SS"] = "<esc>:lua require('spectre').open_visual()<CR>"
--  search in current file
lvim.keys.normal_mode["<leader>Sf"] = "viw:lua require('spectre').open_file_search()<cr>"

-- github.com/palanglung/vimtastic adaptations
lvim.keys.normal_mode["gt"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["gT"] = ":BufferLineCyclePrev<CR>"
