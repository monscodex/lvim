lvim.builtin.nvimtree.setup.on_attach = function (bufnr)
	local api = require('nvim-tree.api')

	local function opts(desc)
		return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
	end

	vim.keymap.set('n', '-',     api.tree.change_root_to_parent,        opts('Up'))
	vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node,          opts('CD'))
	vim.keymap.set('n', 'P',     api.node.navigate.parent,              opts('Parent Directory'))

	vim.keymap.set('n', 'K',     api.node.show_info_popup,              opts('Info'))

	vim.keymap.set('n', '<C-t>', api.node.open.tab,                     opts('Open: New Tab'))
	vim.keymap.set('n', '<C-v>', api.node.open.vertical,                opts('Open: Vertical Split'))
	vim.keymap.set('n', 'v',     api.node.open.vertical,                opts('Open: Vertical Split'))
	vim.keymap.set('n', '<C-x>', api.node.open.horizontal,              opts('Open: Horizontal Split'))
	vim.keymap.set('n', 's',     api.node.open.vertical,                opts('Open: Vertical Split'))
	vim.keymap.set('n', '<CR>',  api.node.open.edit,                    opts('Open'))

	vim.keymap.set('n', '.',     api.node.run.cmd,                      opts('Run Command'))

	vim.keymap.set('n', 'E',     api.tree.expand_all,                   opts('Expand All'))
	vim.keymap.set('n', 'F',     api.live_filter.clear,                 opts('Clean Filter'))
	vim.keymap.set('n', 'f',     api.live_filter.start,                 opts('Filter'))
	vim.keymap.set('n', 'g?',    api.tree.toggle_help,                  opts('Help'))
	vim.keymap.set('n', 'H',     api.tree.toggle_hidden_filter,         opts('Toggle Dotfiles'))
	vim.keymap.set('n', 'I',     api.tree.toggle_gitignore_filter,      opts('Toggle Git Ignore'))

	vim.keymap.set('n', '<BS>',  api.tree.toggle_custom_filter,         opts('Toggle Hidden'))

	vim.keymap.set('n', 'mf',     api.fs.create,                         opts('Create'))
	vim.keymap.set('n', 'DD',    api.fs.remove,                         opts('Delete'))
	vim.keymap.set('n', 'dd',    api.fs.trash,                          opts('Trash'))
	vim.keymap.set('n', 'c',     api.fs.copy.node,                      opts('Copy'))
	vim.keymap.set('n', 'x',     api.fs.cut,                            opts('Cut'))
	vim.keymap.set('n', 'p',     api.fs.paste,                          opts('Paste'))

	vim.keymap.set('n', '<C-r>', api.fs.rename_sub,                     opts('Rename: Omit Filename'))
	vim.keymap.set('n', 'r',     api.fs.rename_basename,                opts('Rename: Basename'))

	vim.keymap.set('n', 'y',     api.fs.copy.filename,                  opts('Copy Name'))
	vim.keymap.set('n', 'Y',     api.fs.copy.relative_path,             opts('Copy Relative Path'))
	vim.keymap.set('n', 'gy',    api.fs.copy.absolute_path,             opts('Copy Absolute Path'))
end
