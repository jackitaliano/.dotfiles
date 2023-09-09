return {

  -- markdown flow
  {
    "jakewvincent/mkdnflow.nvim",
    ft = "markdown",
    config = true,
    keys = { { "<leader>mt", "<cmd>MkdnToggleToDo<cr>", desc = "Toggle ToDo" } },
    rocks = "luautf8", -- Ensures optional luautf8 dependency is installed
    opts = {
      links = {},
      new_file_template = {
        use_template = false,
        placeholders = {
          before = {
            title = "link_title",
            date = "os_date",
          },
          after = {},
        },
        template = "# {{ title }}",
      },
    },
  },

  -- markdown preview popup
  {
    "ellisonleao/glow.nvim",
    ft = "markdown",
    keys = { { "<leader>mp", "<cmd>Glow<cr>", desc = "Markdown Preview" } },
    opts = {
      width = 700,
      height = 500,
      width_ratio = 0.9, -- maximum width of the Glow window compared to the nvim window size (overrides `width`)
      height_ratio = 0.9,
    },
    cmd = "Glow",
  },

  -- markdown preview web page
  {
    "iamcco/markdown-preview.nvim",
    mkdp_port = "",
    keys = { { "<leader>mb", "<cmd>MarkdownPreview<cr>", desc = "Markdown Browser" } },
    config = function()
      vim.fn["mkdp#util#install"]()
    end,
    opts = {
      mkdp_port = "9000",
    },
    ft = "markdown",
  },
}
