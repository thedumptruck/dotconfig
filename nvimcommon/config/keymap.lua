local map = LazyVim.safe_keymap_set

map("v", "<leader>ts", ":TidalSend<Cr>")
for i = 1, 9 do
	map("n", "<leader>t" .. i .. "=", ":TidalPlay " .. i .. "<Cr>")
	map("n", "<leader>t" .. i .. "-", ":TidalSilence " .. i .. "<Cr>")
end
