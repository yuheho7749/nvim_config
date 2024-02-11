return {
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		config = function()
			vim.g.loaded_netrw = 1
			vim.g.loaded_netrwPlugin = 1

			local function my_on_attach(bufnr)
				local api = require "nvim-tree.api"

				local function opts(desc)
					return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
				end

				-- default mappings
				-- api.config.mappings.default_on_attach(bufnr)

				-- Add more custom mappings
				vim.keymap.set('n', '<CR>', api.node.open.edit, opts('Open'))
				vim.keymap.set('n', 'o', api.node.open.edit, opts('Open'))
				vim.keymap.set('n', '<Tab>', api.node.open.preview, opts('Open Preview'))
				vim.keymap.set('n', 'vs', api.node.open.vertical, opts('Open: Vertical Split'))
				vim.keymap.set('n', 'sp', api.node.open.horizontal, opts('Open: Horizontal Split'))
				vim.keymap.set('n', 'wt', api.node.open.tab, opts('Open: New Tab'))

				vim.keymap.set('n', 'a', api.fs.create, opts('Create File/Directory'))
				vim.keymap.set('n', 'c', api.fs.copy.node, opts('Copy'))
				vim.keymap.set('n', 'x', api.fs.cut, opts('Cut'))
				vim.keymap.set('n', 'p', api.fs.paste, opts('Paste'))
				vim.keymap.set('n', 'r', api.fs.rename, opts('Rename'))
				vim.keymap.set('n', 'd', api.fs.remove, opts('Delete'))
				vim.keymap.set('n', 't', api.fs.trash, opts('Trash'))
				vim.keymap.set('n', 'm', api.marks.toggle, opts('Toggle Bookmark'))

				vim.keymap.set('n', 'C', api.tree.collapse_all, opts('Collapse All'))
				vim.keymap.set('n', 'E', api.tree.expand_all, opts('Expand All'))
				vim.keymap.set('n', '<C-]>', api.tree.change_root_to_node, opts('CD'))
				vim.keymap.set('n', 'hd', api.tree.toggle_hidden_filter, opts('Toggle Filter: Dotfiles'))
				vim.keymap.set('n', 'hi', api.tree.toggle_gitignore_filter, opts('Toggle Filter: Git Ignore'))

				vim.keymap.set('n', 'S', api.tree.search_node, opts('Search'))
				vim.keymap.set('n', 'R', api.tree.reload, opts('Refresh'))
				vim.keymap.set('n', ']d', api.node.navigate.diagnostics.next, opts('Next Diagnostics'))
				vim.keymap.set('n', '[d', api.node.navigate.diagnostics.prev, opts('Prev Diagnostics'))

				vim.keymap.set('n', 'y', api.fs.cut, opts('Copy Name'))
				vim.keymap.set('n', '<leader>pwd', api.fs.copy.absolute_path, opts('Copy Absolute Path'))
				vim.keymap.set('n', '<leader>rpwd', api.fs.copy.relative_path, opts('Copy Relative Path'))

				-- vim.keymap.set('n', '<leader>wf', "<C-W>l", opts('Focus On Right Window'))
				vim.keymap.set('n', 'q', api.tree.close, opts('Close'))
				vim.keymap.set('n', 'K', api.node.show_info_popup, opts('Info Popup'))
				vim.keymap.set('n', '?', api.tree.toggle_help, opts('Help'))
			end

			require("nvim-tree").setup({
				on_attach = my_on_attach,
			})

			vim.keymap.set("n", "<leader>ee", "<cmd>NvimTreeToggle<CR>", { desc = "Toggle file explorer" })
			vim.keymap.set("n", "<leader>we", "<cmd>NvimTreeFindFile<CR>", { desc = "Focus file explorer on current file" })
			vim.keymap.set("n", "<leader>ec", "<cmd>NvimTreeCollapse<CR>", { desc = "Collapse file explorer" })
			vim.keymap.set("n", "<leader>er", "<cmd>NvimTreeRefresh<CR>", { desc = "Refresh file explorer" })
		end
	},

}
