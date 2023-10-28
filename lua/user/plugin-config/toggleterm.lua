lvim.builtin.terminal.shell = '/usr/bin/fish' -- I have set vim.o.shell to bash because plugins need a POSIX compliant shell
lvim.builtin.terminal.size = 60
lvim.builtin.terminal.autochdir = true

function _G.set_terminal_keymaps()
	local opts = {noremap = true}
	vim.api.nvim_buf_set_keymap(0, 't', 'kj', [[<C-\><C-n>]], opts) -- Escape easily!


	-- Terminal mappings
	vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
	vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd('autocmd! TermOpen term://* lua set_terminal_keymaps()')