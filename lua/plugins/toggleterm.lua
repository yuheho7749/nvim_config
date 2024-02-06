return {
	-- amongst your other plugins
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = function()
			require("toggleterm").setup {
				open_mapping = [[<c-\>]],
			}

		end
	},
	-- or
	-- {'akinsho/toggleterm.nvim', version = "*", opts = {--[[ things you want to change go here]]}}

}
