local function setup_treesitter_rainbow()
	require 'rainbow-delimiters.setup'.setup {
		query = {
			[''] = 'rainbow-delimiters',
		},
		highlight = {
			"RainbowDelimiterBlue",
			"RainbowDelimiterYellow",
			"RainbowDelimiterGreen",
			"RainbowDelimiterRed",
		},
	}

	lvim.builtin.treesitter.rainbow.enable = true
end

setup_treesitter_rainbow()
