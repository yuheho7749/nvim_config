return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip",
			'nvim-telescope/telescope.nvim',
		},
		config = function()
			require("mason").setup()
			require("mason-lspconfig").setup {
				ensure_installed = {
					"lua_ls",
					"pyright",
					"clangd",
					"rust_analyzer",
				},
				automatic_installation = true,
			}

			local lspconfig = require('lspconfig')

			local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
			local default_setup = function(server, opt)
				lspconfig[server].setup({
					capabilities = lsp_capabilities,
					settings = opt,
				})
			end

			-- Add more languages here if needed 
			default_setup("lua_ls", {
				Lua = {
					diagnostics = {
						globals = {"vim"}
					}
				}
			})
			default_setup("pyright")
			default_setup("clangd")
			default_setup("rust_analyzer")

			vim.api.nvim_create_autocmd('LspAttach', {
				desc = 'LSP Actions',
				callback = function(event)
					-- local opts = { buffer = event.buf }
					local opts = function(desc)
						return {
							buffer = event.buf,
							remap = false,
							desc = desc
						}
					end
					local telescope_builtin = require('telescope.builtin')
					vim.keymap.set("n", "gd", telescope_builtin.lsp_definitions, opts("Goto definitions"))
					vim.keymap.set("n", "gr", telescope_builtin.lsp_references, opts("Goto references"))
					vim.keymap.set('n', '<leader>td', telescope_builtin.lsp_type_definitions, opts("Type definitions"))
					vim.keymap.set('n', '<leader>ds', telescope_builtin.lsp_document_symbols, opts("Document symbols"))
					vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts("Hover"))
					vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts("Open Diagnostic"))
					vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts("Goto next diagnostic"))
					vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts("Goto prev diagnostic"))
					vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts("Code action"))
					vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts("Rename"))
					vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts("Signature Help"))
				end
			})
		end,

	},
}
