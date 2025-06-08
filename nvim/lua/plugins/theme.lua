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
    enabled = true,
    dependencies = { 'rktjmp/lush.nvim' },
    name = 'arctic',
    priority = 1000,
    config = function()
      -- vim.cmd.colorscheme 'arctic'
    end,
  },
  { -- You can easily change to a different colorscheme.
    -- Change the name of the colorscheme plugin below, and then
    -- change the command in the config to whatever the name of that colorscheme is.
    --
    -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
    'folke/tokyonight.nvim',
    priority = 1000, -- Make sure to load this before all the other start plugins.
    enabled = true,
    config = function()
      ---@diagnostic disable-next-line: missing-fields
      require('tokyonight').setup {
        styles = {
          comments = { italic = false }, -- Disable italics in comments
        },
      }

      -- Load the colorscheme here.
      -- Like many other themes, this one has different styles, and you could load
      -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
      -- vim.cmd.colorscheme 'tokyonight-night'
    end,
  },
}
