return {
	{
		"folke/todo-comments.nvim",
		lazy = false,
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			keywords = {
				-- My own keywords
				TODO = {icon = "", color = "info"},
				DONE = {icon = "", color = "hint"},
				WARN = {alt = {"WARNING", "XXX"}},
				TEST = {icon = "󱈲", color = "warning", alt = {"TESTING"}},
				PASS = {icon = "󱈬", color = "hint", alt = {"PASSED"}},
				FAIL = {icon = "󱈴", color = "error", alt = {"FAILED"}},
				TEMP = {icon = "󰶯", color = "warning", alt = {"BANDAID", "BANDAGE", "PATCH", "PATCHWORK"}},
				WTF = {icon = "󰚌", color = "error", alt = {"SKULL", "HUH", "OMG"}},
				-- TODO:
				-- DONE:
				-- NOTE:
				-- HACK:
				-- BUG:
				-- FIX:
				-- FIXME:
				-- FIXIT:
				-- ISSUE:
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
				-- OMG:
				-- XXX:
				-- WARN:
				-- WARNING:
				-- TEST:
				-- TESTING:
				-- PASS:
				-- PASSED:
				-- FAIL:
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
