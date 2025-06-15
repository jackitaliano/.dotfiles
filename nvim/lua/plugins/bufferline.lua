return {
  enabled = false,
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require('bufferline').setup {
      options = {
        offsets = {
          {
            filetype = 'neo-tree',
            text = 'File Explorer',
            separator = true,
            text_align = 'center',
          },
        },
        show_close_icon = false,
        show_buffer_close_icons = false,
      },
    }
  end,
}
