return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "MunifTanjim/nui.nvim",
    },
    config = function()
        vim.keymap.set("n", "<leader>nn", ":Neotree toggle<CR>", { desc = "Neotree toggle" })
        vim.keymap.set("n", "<leader>nr", ":Neotree reveal<CR>", { desc = "Neotree reveal with current file" })
        require("neo-tree").setup({
            close_if_last_window = true,
            popup_border_style = "rounded",
            window = {
                position = "right",
                width = 35,
            }
        })
        buffers = {
            follow_current_file = { enabled = true, -- This will find and focus the file in the active buffer every time -- -- the current file is changed while the tree is open.
            }
        }
    end
}
