return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
        {
            "<leader>xx",
            "<cmd> Trouble diagnostics toggle<cr>",
            desc = "Diagnostics (Trouble)"
        },
        {
            "<leader>xX",
            "<cmd> Trouble diagnostics toggle filter.buf=0<cr>",
            desc = "Buffer Diagnostics (Trouble)"
        },
        {
            "<leader>cs",
            "<cmd> Trouble symbols toggle focus=false<cr>",
            desc = "Symbols (Trouble)"
        },
        {
            "<leader>cs",
            "<cmd> Trouble lsp toggle focus=false win.position=righta<cr>",
            desc = "LSP Definitions / references / ... (Trouble)"
        },
        {
            "<leader>xL",
            "<cmd> Trouble loclist toggle<cr>",
            desc = "Location List(Trouble)"
        },
        {
            "<C-q>",
            "<cmd> Trouble qflist toggle<cr>",
            desc = "Qukckfix List(Trouble)"
        },
        {
            "<C-n>",
            "<cmd>cnext<cr>",
            desc = "Qukckfix Next(Trouble)"
        },
        {
            "<C-p>",
            "<cmd>cprev<cr>",
            desc = "Qukckfix Prev(Trouble)"
        },
        -- {
        --     "<C-N>",
        --     "<cmd>cnewer<cr>",
        --     desc = "Qukckfix Newer(Trouble)"
        -- },
        -- {
        --     "<C-P>",
        --     "<cmd>colder<cr>",
        --     desc = "Qukckfix Newer(Trouble)"
        -- },
    }
}
