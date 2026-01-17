return {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-telescope/telescope-file-browser.nvim',
			'BurntSushi/ripgrep',
		},
		config = function()
			local telescope = require('telescope')
			local telescope_action = require('telescope.actions')
			telescope.setup({
				defaults = {
					layout_strategy = "vertical",
					layout_config = {
						vertical = {
							preview_cutoff = 25,
						},
					},
					mappings = {
						i = {
							["<C-x>"] = telescope_action.file_vsplit,
							["<C-s>"] = telescope_action.file_split,
						},
						n = {
							["<C-x>"] = telescope_action.file_vsplit,
							["<C-s>"] = telescope_action.file_split,
						},
					},
				},
				pickers = {
					find_files = {
						no_ignore = true
					}
				},
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
			vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
			vim.keymap.set('n', '<leader>f?', builtin.help_tags, {})

			vim.keymap.set('n', '<leader>fs', ':Telescope file_browser<CR>', {})
		end,
	},
}
