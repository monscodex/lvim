vim.api.nvim_create_autocmd({ "FileType" }, {
	pattern = {
		"Jaq",
		"qf",
		"help",
		"man",
		"lspinfo",
		"spectre_panel",
		"lir",
		"DressingSelect",
		"tsplayground",
		"",
	},
	callback = function()
		vim.cmd [[
			      nnoremap <silent> <buffer> q :close<CR>
			      " nnoremap <silent> <buffer> <esc> :close<CR>
			      set nobuflisted
		      ]]
	end,
})

vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter", "BufEnter" }, {
	pattern = { "*" },
	callback = function()
		local buf_ft = vim.bo.filetype
		if buf_ft == "" or buf_ft == nil then
			vim.cmd [[
			      nnoremap <silent> <buffer> q :close<CR>
			      " nnoremap <silent> <buffer> <c-j> j<CR>
			      " nnoremap <silent> <buffer> <c-k> k<CR>
			      set nobuflisted
		      ]]
		end
	end,
})

vim.api.nvim_create_autocmd({ "TermEnter" }, {
	pattern = { "*" },
	callback = function()
		vim.cmd "startinsert"
	end,
})
