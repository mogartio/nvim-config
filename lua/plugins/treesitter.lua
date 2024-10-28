return {
    "nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config =  function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {"lua", "javascript", "c", "cpp"},
			highlight = { enable = true },
			indent = { enable = true },
            incremental_selection = {
                enable = true, 
                keymaps = {
                    init_selection = "<C-space>",
                    node_incremental = "<C-space>",
                    scope_incremental = false,
                    node_decremental = "<bs>"
                },
            },
		})
		end
}

