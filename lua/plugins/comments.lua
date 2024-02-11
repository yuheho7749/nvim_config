return {
	{
		"folke/todo-comments.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			keywords = {
				-- My own keywords
				WARN = {alt = {"WARNING", "XXX"}},
				TEST = {icon = "", alt = { "TESTING", "PASSED", "FAILED" }},
				TEMP = {icon = "󰶯", color = "warning", alt = {"BANDAID", "BANDAGE", "PATCH", "PATCHWORK"}},
				WTF = {icon = "󰚌", color = "error", alt = {"SKULL", "HUH"}},
				-- TODO:
				-- NOTE:
				-- HACK:
				-- FIX:
				-- FIXME:
				-- FIXIT:
				-- ISSUE:
				-- BUG:
				-- PERF:
				-- OPTIM:
				-- PERFORMANCE:
				-- OPTIMIZE:
				-- TEMP:
				-- BANDAGE:
				-- BANDAID:
				-- PATCH:
				-- PATCHWORK:
				-- WTF:
				-- HUH:
				-- XXX:
				-- WARNING:
				-- WARN:
				-- TEST:
				-- TESTING:
				-- PASSED:
				-- FAILED:
			},
		},
		vim.keymap.set('n', '<leader>tt', ":TodoTelescope<CR>"),
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
