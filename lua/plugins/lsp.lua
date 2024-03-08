return {
	{
		"neovim/nvim-lspconfig",
		event = { "BufReadPre", "BufNewFile" },
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/nvim-cmp",
			"L3MON4D3/LuaSnip"
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
					vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts("Goto definition"))
					vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts("Hover"))
					vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts("Open Diagnostic"))
					vim.keymap.set("n", "[d", function() vim.diagnostic.goto_prev() end, opts("Goto next diagnostic"))
					vim.keymap.set("n", "]d", function() vim.diagnostic.goto_next() end, opts("Goto prev diagnostic"))
					vim.keymap.set("n", "<leader>ca", function() vim.lsp.buf.code_action() end, opts("Code action"))
					vim.keymap.set("n", "<leader>cr", function() vim.lsp.buf.references() end, opts("References"))
					vim.keymap.set('n', '<leader>td', vim.lsp.buf.type_definition, opts("Type def"))
					vim.keymap.set("n", "<leader>rn", function() vim.lsp.buf.rename() end, opts("Rename"))
					vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts("Signature Help"))
				end
			})
		end,

	},
}
