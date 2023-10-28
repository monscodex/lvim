lvim.builtin.project.silent_chdir = false

lvim.plugins = {
	{
		-- When typing the arguments of fn, shows docs and highlights arguments
		"ray-x/lsp_signature.nvim",
		event = "BufRead",
		config = function() require"lsp_signature".on_attach() end,
	},

	-- Colorschemes
	{ "lunarvim/colorschemes" },
	{ "marko-cerovac/material.nvim" },
	{ "morhetz/gruvbox" },
	{ "joshdick/onedark.vim" },
	{ "mhartington/oceanic-next" },

	{ 'stevearc/dressing.nvim' }, -- Beautiful selection board and input boxes

	-- Treesitter
	{
		url = "https://gitlab.com/HiPhish/rainbow-delimiters.nvim",
	},
	{
		"windwp/nvim-ts-autotag",
		ft = { 'astro', 'md', 'markdown', 'html', 'js', 'jsx', 'php', 'tsx', 'ts', 'xml', 'vue', 'hbs', 'gjs', 'gts', 'map', 'svelte' },
		config = function()
			require("nvim-ts-autotag").setup()
		end,
	},

	{
		-- Colorize hex codes and color names
		"norcalli/nvim-colorizer.lua",
		ft = { "css", "scss", "html", "js", "jsx", "ts", "tsx" },
		config = function()
			require("colorizer").setup({ "css", "scss", "html", "javascript" }, {
				RGB = true, -- #RGB hex codes
				RRGGBB = true, -- #RRGGBB hex codes
				RRGGBBAA = true, -- #RRGGBBAA hex codes
				rgb_fn = true, -- CSS rgb() and rgba() functions
				hsl_fn = true, -- CSS hsl() and hsla() functions
				css = true, -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
				css_fn = true, -- Enable all CSS *functions*: rgb_fn, hsl_fn
			})
		end,
	},

	{
		-- Icon Picker
		"ziontee113/icon-picker.nvim",
		config = function()
		require("icon-picker").setup({
				disable_legacy_commands = true
			})
		end,

		lazy = true,
		cmd = { "IconPickerNormal", "IconPickerInsert", "IconPickerYank" },
	},

	-- Undotree
	{
		"mbbill/undotree",

		lazy = true,
		cmd = { "UndotreeToggle", "UndotreeShow", "UndotreeHide", "UndotreeFocus" },
	},

	-- Git
	--[[ {
		"FabijanZulj/blame.nvim",
		config = function()
			require('blame').setup({
				date_format = "%d/%m/%y %Hh",
				merge_consecutive = true,
			})
		end,

		cmd = { 'ToggleBlame', 'EnableBlame', 'DisableBlame' },
		lazy = true,
	}, ]]

	{
		'smoka7/hop.nvim',
		version = "*",
		opts = {},
		config = function ()
		require('hop').setup()
		end
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {}
	},

	{
		-- Markdown preview
		'toppair/peek.nvim',
		build = 'deno task --quiet build:fast',
		config = function()
			require('peek').setup()
		end,
	},
	{
		-- Edit cross-language embedded code blocks
		'AckslD/nvim-FeMaco.lua',
		config = 'require("femaco").setup()',
	},

	{
		-- Remember last position when opened file
		-- NOTE: No longer mantained
		'ethanholz/nvim-lastplace',
		config = function()
			require'nvim-lastplace'.setup {
				lastplace_ignore_buftype = {"quickfix", "nofile", "help"},
				lastplace_ignore_filetype = {"gitcommit", "gitrebase", "svn", "hgcommit"},
				lastplace_open_folds = true
			}
		end
	},
	{
		"kylechui/nvim-surround",
		version = "*", -- Use for stability; omit to use `main` branch for the latest features
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({})
		end
	}
};
