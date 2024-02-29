return {
	-- amongst your other plugins
	{
		'akinsho/toggleterm.nvim',
		version = "*",
		config = function()
			vim.cmd("let &shell = executable('pwsh') ? 'pwsh' : 'powershell'")
			vim.cmd("let &shellcmdflag = '-NoLogo -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.UTF8Encoding]::new();$PSDefaultParameterValues[''Out-File:Encoding'']=''utf8'';'")
			vim.cmd("let &shellredir = '2>&1 | %%{ \"$_\" } | Out-File %s; exit $LastExitCode'")
			vim.cmd("let &shellpipe  = '2>&1 | %%{ \"$_\" } | Tee-Object %s; exit $LastExitCode'")
			vim.cmd("set shellquote= shellxquote=")
			require("toggleterm").setup {
				open_mapping = [[<C-\>]],
				size = 12,
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
