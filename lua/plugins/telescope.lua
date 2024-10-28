return {
    {
        'nvim-telescope/telescope.nvim',
        branch = "0.1.*",
        dependencies = {
            "nvim-lua/plenary.nvim",
            { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release' },
            "sharkdp/fd",
            "nvim-telescope/telescope-ui-select.nvim",
            "debugloop/telescope-undo.nvim",
            "AckslD/nvim-neoclip.lua",
        },
        config = function()
            local telescope = require("telescope")
            local actions = require("telescope.actions")
            local builtin = require("telescope.builtin")
            telescope.setup({
                defaults = {
                    path_display = { "smart" },
                    mappings = {
                        i = {
                            ["<C-k>"] = actions.move_selection_previous,
                            ["<C-j>"] = actions.move_selection_next,
                            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
                        },
                    },
                },
                extensions = {
                    fzf = {
                        fuzzy = true,                   -- false will only do exact matching
                        override_generic_sorter = true, -- override the generic sorter
                        override_file_sorter = true,    -- override the file sorter
                        case_mode = "smart_case",       -- or "ignore_case" or "respect_case"
                    },
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                    undo = {
                        use_delta = true,
                        use_custom_command = nil, -- setting this implies `use_delta = false`. Accepted format is: { "bash", "-c", "echo '$DIFF' | delta" }
                        side_by_side = false,
                        vim_diff_opts = { ctxlen = vim.o.scrolloff },
                        entry_format = "state #$ID, $STAT, $TIME",
                        mappings = {
                            i = {
                                ["<C-cr>"] = require("telescope-undo.actions").yank_additions,
                                ["<S-cr>"] = require("telescope-undo.actions").yank_deletions,
                                ["<cr>"] = require("telescope-undo.actions").restore,
                            },
                        },
                    },
                },
            })

            require("telescope").load_extension("ui-select")
            require('telescope').load_extension("fzf")
            require('telescope').load_extension("undo")
            require('neoclip').setup()
            require("telescope").load_extension("neoclip")
            vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
            vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
            vim.keymap.set("n", "<leader>fs", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor" })
            vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Find recent files" })
            vim.keymap.set("n", "<leader>ft", "<cmd>TodoTelescope<cr>", { desc = "Find todos" })
            vim.keymap.set("n", "<leader>u", "<cmd>Telescope undo<cr>", { desc = "Undo tree" })
            vim.keymap.set("n", "<leader>o", "<cmd>Telescope neoclip<cr>", { desc = "Neoclip" })
            vim.keymap.set("n", "<leader>fi", builtin.lsp_document_symbols, { desc = "Find document symbols" })
            vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Find buffers" })
        end
    },
}
