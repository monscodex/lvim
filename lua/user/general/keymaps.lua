-- Shortened function name
local keymap = vim.api.nvim_set_keymap

local function apply_keymap_for_different_keys(mode, base_activator, base_command, keys, opts)
	for _, key in ipairs(keys) do
		local activator = string.format(base_activator, key)
		local command = string.format(base_command, key)

		keymap(mode, activator, command, opts)
	end
end

local function main()
	local options = { noremap = true }

	-- Remap space as leader key
	keymap("n", "<Space>", "", options)
	vim.g.mapleader = " "
	vim.g.maplocalleader = " "

	keymap("n", "<C-Space>", "<cmd>WhichKey \\<leader><cr>", options)

	-- Modes
	--   normal_mode = "n",
	--   insert_mode = "i",
	--   visual_mode = "v",
	--   visual_block_mode = "x",
	--   term_mode = "t",
	--   command_mode = "c",

	-- Faster quit to normal mode
	local kj_remap_modes = { "i", "v", "x", "c" }
	for _, mode in ipairs(kj_remap_modes) do
		keymap(mode, "kj", "<C-c>", options)
		keymap(mode, "KJ", "<C-c>", options)
	end

	-- Session
	-- keymap("n", "<Leader>se", "<C-c>:mksession ~/.config/nvim/sessions/.vim<Left><Left><eeft><Left>", options) -- Create
	-- keymap("n", "<Leader>sr", "<C-c>:source ~/.config/nvim/sessions/", options) -- Restore
	-- keymap("n", "<Leader>sd", "<C-c>:!rm -f ~/.config/nvim/sessions/", options) -- Delete

	-- Undo break points (When inserting text we want undo breakpoints to avoid going back to normal mode and doing undo)
	local break_points = { "[", "]", "(", ")", ",", ".", "!", "?", ">", "<", "=" }
	for _, break_point in ipairs(break_points) do
		keymap("i", break_point, break_point .. "<c-g>u", options)
	end


	--  Window managing  --
	local silent_options = { noremap = true, silent = true }

	-- Better window navigation
	lvim.keys.normal_mode["M-j"] = false
	lvim.keys.normal_mode["M-k"] = false
	local movement_keys = { "k", "j", "l", "h" }
	apply_keymap_for_different_keys("n", "<M-%s>", ":wincmd %s<CR>", movement_keys, silent_options) -- Normal windows

	-- Move windows
	local move_windows_keys = { "K", "J", "L", "H" }
	apply_keymap_for_different_keys("n", "<M-%s>", ":wincmd %s<CR>", move_windows_keys, silent_options)

	-- Resize windows
	lvim.keys.normal_mode["C-h"] = false
	lvim.keys.normal_mode["C-j"] = false
	lvim.keys.normal_mode["C-k"] = false
	lvim.keys.normal_mode["C-l"] = false
	keymap("n", "<C-j>", ":resize -2<CR>", silent_options)
	keymap("n", "<C-k>", ":resize +2<CR>", silent_options)
	keymap("n", "<C-l>", ":vertical resize -2<CR>", silent_options)
	keymap("n", "<C-h>", ":vertical resize +2<CR>", silent_options)
	keymap("n", "<C-=>", "<C-w>=", silent_options) -- Resize all windows to the same size

	--  Better moving in Command mode & Insert mode  --
	keymap("c", "<C-j>", "<C-n>", options)
	keymap("c", "<C-k>", "<C-p>", options)
	keymap("c", "<C-h>", "<Left>", options)
	keymap("c", "<C-l>", "<Right>", options)

	--  Disable cutting when deleting in x and dw  --
	keymap("n", "x", '"_x', options)
	keymap("x", "x", '"_x', options)
	keymap("n", "dw", '"_dw', options)
	keymap("x", "dw", '"_dw', options)
end

main()
