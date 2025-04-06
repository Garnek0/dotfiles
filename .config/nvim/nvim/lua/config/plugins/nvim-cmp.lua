return {
	"hrsh7th/nvim-cmp",
	event = "InsertEnter",
	dependencies = {
		"hrsh7th/cmp-buffer",
		"hrsh7th/cmp-path",
    	"onsails/lspkind.nvim",
	},
	config = function()
		local cmp = require("cmp")

    	local lspkind = require("lspkind")

		cmp.setup({
			completion = {
				completeopt = "menu,menuone,preview,noselect",
			},
			mapping = cmp.mapping.preset.insert({
				["<CR>"] = cmp.mapping.confirm({ select = false })
			}),
			sources = cmp.config.sources({
				{ name = "nvim_lsp"},
				{ name = "buffer" },
				{ name = "path" },
			}),
			formatting = {
        		format = lspkind.cmp_format({
         			maxwidth = 50,
          			ellipsis_char = "...",
        		}),
			},
		})
	end,
}
