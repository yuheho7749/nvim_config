return {
	{
		"folke/todo-comments.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		}
	},
	{
		'numToStr/Comment.nvim',
		lazy = false,
		config = function()
			require("Comment").setup({
				---LHS of toggle mappings in NORMAL mode
				toggler = {
					---Line-comment toggle keymap
					line = '<leader>cl',
					---Block-comment toggle keymap
					block = '<leader>cb',
				},
				---LHS of operator-pending mappings in NORMAL and VISUAL mode
				opleader = {
					---Line-comment keymap
					line = '<leader>cl',
					---Block-comment keymap
					block = '<leader>cb',
				},
				extra = {
					---Add comment on the line above
					above = '<leader>ck',
					---Add comment on the line below
					below = '<leader>cj',
					---Add comment at the end of line
					eol = '<leader>ce',
				},
			})
		end
	},
}
