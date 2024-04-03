lvim.lsp.installer.setup.ensure_installed = {
	'bashls',
	'cssls',
	'dockerls',
	'jsonls',
	'pyright',
	'tsserver',
	'sqlls',
	'yamlls'
}


require 'lvim.lsp.null-ls.linters'.setup {
	{
		name = "cspell",

		-- force the severity to be HINT
		diagnostics_postprocess = function(diagnostic)
			diagnostic.severity = vim.diagnostic.severity.HINT
		end,
	},
}

require 'lvim.lsp.null-ls.code_actions'.setup {
	{ name = "cspell" },
}

require 'lvim.lsp.null-ls.formatters'.setup {
	{ name = 'black' },
	{ name = 'fixjson' },
	{ name = 'prettier' },
	{ name = 'shfmt' },
	{ name = 'cbfmt' },
}

lvim.format_on_save.enabled = true
lvim.format_on_save.pattern = {
	'*.css',
	'*.js',
	'*.jsx',
	'*.lua',
	'*.md',
	'*.php',
	'*.tsx',
	'*.yml',
	'*.sh',
	'*.json',
}
