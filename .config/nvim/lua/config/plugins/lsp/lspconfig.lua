return {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"hrsh7th/cmp-nvim-lsp",
    	{ "antosha417/nvim-lsp-file-operations", config = true },
    	{ "folke/neodev.nvim", opts = {} },
	},
	config = function()
    	-- import lspconfig plugin
    	local lspconfig = require("lspconfig")

    	-- import mason_lspconfig plugin
    	local mason_lspconfig = require("mason-lspconfig")

    	-- import cmp-nvim-lsp plugin
    	local cmp_nvim_lsp = require("cmp_nvim_lsp")

 		-- used to enable autocompletion (assign to every lsp server config)
    	local capabilities = cmp_nvim_lsp.default_capabilities()

    	vim.diagnostic.config({
			virtual_text = true,
			severity_sort = true,
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = "",
					[vim.diagnostic.severity.WARN] = "",
					[vim.diagnostic.severity.INFO] = "",
					[vim.diagnostic.severity.HINT] = "",
				},
			},
		})

    	mason_lspconfig.setup_handlers({
      		-- default handler for installed servers
      		function(server_name)
        		lspconfig[server_name].setup({
          			capabilities = capabilities,
        		})
      		end,

      		["clangd"] = function()
        		-- configure clang server
        		lspconfig["clangd"].setup({
  					filetypes = {"c", "cpp", "objc", "objcpp"},
					cmd = {
						"clangd",
						"--header-insertion=never",
						"--background-index"
					},
  					capabilities = capabilities,
        		})
      		end,

    	})
	end,
}
