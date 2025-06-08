return {
  {
    'navarasu/onedark.nvim',
    priority = 1000,
    enabled = true,
    config = function()
      require('onedark').setup {
        style = 'warmer',
        transparent = true,

        lualine = {
          transparent = false, -- lualine center bar transparency
        },
        colors = {
          dark_green = '#475a39',
        },
        highlights = {
          ['comment'] = { fg = '$dark_green', fmt = 'none' },
          ['@comment'] = { fg = '$dark_green', fmt = 'none' },
          ['@lsp.type.comment'] = { fg = '$dark_green', fmt = 'none' },
        },
        diagnostics = {
          darker = true, -- darker colors for diagnostic
          undercurl = true, -- use undercurl instead of underline for diagnostics
          background = false, -- use background color for virtual text
        },
      }
      require('onedark').load()
    end,
    -- config = function()
    --   require('onedark').setup {
    --     style = 'warmer',
    --   }
    --   -- Enable theme
    --   require('onedark').load()
    -- end,
  },
  {
    'rockyzhang24/arctic.nvim',
    branch = 'v2',
    enabled = true,
    dependencies = { 'rktjmp/lush.nvim' },
    name = 'arctic',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'arctic'
    end,
  },
}
