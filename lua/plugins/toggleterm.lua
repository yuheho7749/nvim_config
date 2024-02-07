return {
	-- amongst your other plugins
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = function()
			require("toggleterm").setup {
				open_mapping = [[<C-\>]],
				size = 10,
				persist_size = false,
				on_open = function()
					local opts = {buffer = 0}
					vim.keymap.set('t', '<esc>', [[<C-\><C-n>]], opts)
				end
			}

		end
	},
	-- or
	-- {'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}}

}
