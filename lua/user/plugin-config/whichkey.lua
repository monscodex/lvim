local function remove_unused_keymaps()
	lvim.builtin.which_key.mappings['c'] = {}
	lvim.builtin.which_key.mappings[';'] = {}
	lvim.builtin.which_key.mappings['b'] = {}
	lvim.builtin.which_key.mappings['h'] = {}
end

remove_unused_keymaps()

lvim.builtin.which_key.mappings['o'] = {
	name = "Options",
	w = { '<cmd>lua require("general.functions").toggle_option("wrap")<cr>', "Wrap" },
	r = { '<cmd>lua require("general.functions").toggle_option("relativenumber")<cr>', "Relative" },
	l = { '<cmd>lua require("general.functions").toggle_option("cursorline")<cr>', "Cursorline" },
	s = { '<cmd>lua require("general.functions").toggle_option("spell")<cr>', "Spell" },
	t = { '<cmd>lua require("general.functions").toggle_tabline()<cr>', "Tabline" },
};

lvim.builtin.which_key.mappings['u'] = { "<cmd>UndotreeToggle<cr>", "Undotree" }

lvim.builtin.which_key.mappings['h'] = { "<cmd>HopChar2MW<cr>", "Hop" }
lvim.builtin.which_key.vmappings['h'] = { "<cmd>HopChar2MW<cr>", "Hop" }

local function fix_search_with_telescope()
	lvim.builtin.which_key.mappings['s'] = {}
	lvim.builtin.which_key.mappings['f'] = {
		name = "Find",
		f = { "<cmd>Telescope find_files<cr>", "FILES" },
		s = { "<cmd>Telescope session-lens search_session<cr>", "Sessions" },
		g = { "<cmd>Telescope live_grep<cr>", "GREP" },
		p = { "<cmd>Telescope projects<cr>", "PROJECTS" },
		b = { "<cmd>Telescope buffers<cr>", "Buffers" },
		B = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
		h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
		-- H = { "<cmd>Telescope highlights<cr>", "Highlights" },
		H = {
			name = "History",
			c = { "<cmd>Telescope command_history<cr>", "Commands" },
			s = { "<cmd>Telescope search_history<cr>", "Search" },
			n = { "<cmd>Telescope notify<cr>", "Notifications" },
		},
		m = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
		M = { "<cmd>Telescope media_files<cr>", "Media Files" },
		r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
		R = { "<cmd>Telescope registers<cr>", "Registers" },
		k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
		c = { "<cmd>Telescope commands<cr>", "List" },
		C = { "<cmd>Telescope colorscheme<cr>", "Colorschemes" },
		t = { "<cmd>Telescope builtin<cr>", "Telescope Commands" },
		l = {
			name = "LSP",
			d = { "<cmd>Telescope lsp_definitions<cr>", "Definitions" },
			D = { "<cmd>Telescope lsp_declarations<cr>", "Declarations" },
			i = { "<cmd>Telescope lsp_implementations<cr>", "Implamentations" },
			r = { "<cmd>Telescope lssp_references<cr>", "References" },
		}
	};
end

local function add_markdown_bindings()
	lvim.builtin.which_key.mappings['m'] = {
		name = "Markdown",
		o = { "<cmd>lua require('peek').open()<cr>", "Open" },
		c = { "<cmd>lua require('peek').close()<cr>", "Close" },
		e = { "<cmd>lua require('femaco.edit').edit_code_block()<cr>", "Edit Code" },
	}
end

local function fix_terminal_bindings()
	-- Use with numbers
	lvim.builtin.terminal.open_mapping = '<c-t>'

	lvim.builtin.which_key.mappings['t'] = {
		name = "Terminal",
		v = { "<cmd>ToggleTerm direction=vertical<cr>", "Vertical" },
		s = { "<cmd>ToggleTerm direction=horizontal size=15<cr>", "Horizontal" },
	}
end

local function fix_comments()
	lvim.builtin.which_key.mappings['/'] = {}

	local comment_api = require('Comment.api')

	local esc = vim.api.nvim_replace_termcodes(
		'<ESC>', true, false, true
	)

	-- Toggle selection (linewise)
	local function visual_line_comment()
		vim.api.nvim_feedkeys(esc, 'nx', false)
		comment_api.toggle.linewise(vim.fn.visualmode())
	end

	-- Toggle selection (blockwise)
	local function visual_block_comment()
		vim.api.nvim_feedkeys(esc, 'nx', false)
		comment_api.toggle.blockwise(vim.fn.visualmode())
	end

	lvim.builtin.which_key.mappings['/'] = { comment_api.toggle.linewise.current, "Comment Line" }
	lvim.builtin.which_key.mappings[';'] = { comment_api.toggle.blockwise.current, "Comment Block" }

	lvim.builtin.which_key.vmappings['/'] = { visual_line_comment, "Comment Line" }
	lvim.builtin.which_key.vmappings[';'] = { visual_block_comment, "Comment Block" }
end

local function add_icon_picker_bindings()
	lvim.builtin.which_key.mappings['i'] = {
		name = "Icons",
		E = { "<cmd>IconPickerNormal<cr>", "Everything" },
		e = { "<cmd>IconPickerNormal emoji<cr>", "Emoji" },
		n = { "<cmd>IconPickerNormal nerd_font<cr>", "Nerd" },
		s = { "<cmd>IconPickerNormal symbols<cr>", "Symbols" },
		a = { "<cmd>IconPickerNormal alt_font<cr>", "Alt characters" },
	};
end

fix_search_with_telescope();
fix_comments();
add_icon_picker_bindings();
add_markdown_bindings();
fix_terminal_bindings();
