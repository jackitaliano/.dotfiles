-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  -- 'windwp/nvim-autopairs',
  -- event = 'InsertEnter',
  -- opts = {},
  {
    'altermo/ultimate-autopair.nvim',
    event = { 'InsertEnter', 'CmdlineEnter' },
    branch = 'v0.6',
    opts = {},
  },
}
