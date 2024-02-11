return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-file-browser.nvim',
			-- 'BurntSushi/ripgrep',
		},
		config = function()
			local telescope = require('telescope')
			telescope.setup({
				extensions = {
					file_browser = {
						theme = 'ivy',
						hijack_netw = true,

					},
				},

			})
			telescope.load_extension('file_browser')

			local builtin = require('telescope.builtin')
			vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
			vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
			vim.keymap.set('n', '<leader>ft', builtin.buffers, {})
			vim.keymap.set('n', '<leader>fh', builtin.help_tags, {})

			vim.keymap.set('n', '<leader>fb', ':Telescope file_browser<CR>', {})
		end,
	},
}
