-- Supported:
-- tokyonight,,
-- OceanicNext,
-- cobalt2
-- zephyr
-- material,
-- aurora
-- nord,
-- gruvbox,
-- onedark,
-- onedarker,
-- darkplus,
-- tomorrow,
-- spacedark

lvim.colorscheme = "material"

local function make_comments_red()
	vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
		pattern = { "*" },
		callback = function()
			vim.cmd('hi Comment guifg=#ff5e7e')
		end,
	})
end

local function adjust_colorscheme_options()
	if lvim.colorscheme == "tokyonight" then
		require("tokyonight").setup({
			style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
			terminal_colors = true,
			styles = {
				-- Style to be applied to different syntax groups
				-- Value is any valid attr-list value for `:help nvim_set_hl`
				comments = { italic = true },
				keywords = { italic = true },
				functions = { italic = true },
				variables = {},

				-- Background styles. Can be "dark", "transparent" or "normal"
				sidebars = "dark", -- style for sidebars, see below
				floats = "dark", -- style for floating windows
			},
			sidebars = { "qf", "vista_kind", "terminal", "help" },
			lualine_bold = true
		})
	elseif lvim.colorscheme == "OceanicNext" then
		vim.g.oceanic_next_terminal_bold = true
		vim.g.oceanic_next_terminal_italic = true
	elseif lvim.colorscheme == "material" then
		-- darker, lighter, oceanic, palenight, deep ocean
		vim.g.material_terminal_italics = 1
		vim.g.material_style = "deep ocean"
	elseif lvim.colorscheme == "onedark" then
		vim.g.onedark_termcolors = 256
		vim.g.onedarker_italic_keywords = true
		vim.g.onedarker_italic_functions = false
		vim.g.onedarker_italic_comments = true
		vim.g.onedarker_italic_loops = true
		vim.g.onedarker_italic_conditionals = true
	elseif lvim.colorscheme == "gruvbox" then
		vim.g.gruvbox_contrast_dark = "hard"
	elseif lvim.colorscheme == "cobalt2" then
		require("colorbuddy").colorscheme("cobalt2")
	elseif lvim.colorscheme == "zephyr" then
		require("zephyr")
	end
end

adjust_colorscheme_options();
make_comments_red();
