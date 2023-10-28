local options = {
	-- Search options
	hlsearch = true,                         -- highlight all matches on previous search pattern
	ignorecase = true,                       -- ignore case in search patterns
	incsearch = true,                        -- highlight all matches while typing search
	smartcase = true,                        -- apply smartcase to search (search for exact case if there is an uppercase letter)
	syntax = "enable",
	-- UI options
	cmdheight = 2,
	history = 1000,                          -- Set a large history
	termguicolors = true,                    -- set term gui colors (most terminals support this)
	scrolloff = 10,                           -- large scrolloff
	sidescrolloff = 10,                       -- large scrollof
	guifont = "monospace:h17",               -- the font used in graphical neovim applications
	numberwidth = 4,                         -- set number column width to 4
	signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
	background = "dark",                     -- show dark background
	list = true,                             -- show hidden characters
	laststatus = 3,                          -- Always show statusline
	conceallevel = 0,                        -- so that `` is visible in markdown files
	-- Split
	splitbelow = true,                       -- force all horizontal splits to go below current window
	splitright = true,                       -- force all vertical splits to go to the right of current window
	-- Tab vs Spaces options
	showtabline = 0,
	expandtab = false,                        -- convert tabs to spaces
	tabstop = 8,                             -- insert 4 spaces for a tab
	shiftwidth = 8,                          -- the number of spaces inserted for each indentation
	-- Indenting options
	smartindent = true,                      -- make indenting smarter again
	-- autoindent = true,                       -- make indenting smarter again
	-- Backup files configurations
	swapfile = false,                        -- creates a swapfile
	writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
	undofile = true,                         -- enable persistent undo
	backup = false,                          -- creates a backup file
	-- Timing
	updatetime = 100,                         -- faster completion (4000ms default)
	timeoutlen = 300,                        -- time to wait for a mapped sequence to complete (in milliseconds)
	-- Cursor
	cursorline = true,                       -- highlight the current line
	ruler = true,                            -- show the cursor's position at the bottom of the screen
	relativenumber = true,                   -- relativenumber followed by number shows both of them
	number = true,                           -- relativenumber followed by number shows both of them
	-- Wrap
	wrap = false,                            -- display lines as one long line
	-- Buffer
	hidden = true,                           -- sync visual modifications to two opened instances of the same buffer
	-- Miscellaneous
	shell = "/bin/bash",                     -- avoid this error https://github.com/kyazdani42/nvim-tree.lua/issues/549
	clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
	encoding = "utf-8",                      -- the encoding written to a file
	fileencoding = "utf-8",                  -- the encoding written to a file
	mouse = "a",                             -- allow the mouse to be used in neovim
}

vim.opt.shortmess:append "c"


for key, value in pairs(options) do
	vim.opt[key] = value
end


vim.cmd [[set undodir=~/.config/lvim/undodir]]
vim.cmd [[set path+=**]] -- search directories recursively
vim.cmd [[set iskeyword+=-]]
vim.cmd [[set formatoptions-=cro]]
vim.cmd [[ filetype plugin on ]]
