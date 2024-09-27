return {
  'akinsho/bufferline.nvim',
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function()
    require("bufferline").setup {
      options = {
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer",
            separator = true,
            text_align = "center"
          }
        },
        show_close_icon = false,
        show_buffer_close_icons = false,
      }
    }

    vim.keymap.set("n", "H", "<cmd>BufferLineCyclePrev<cr>", { desc = "Prev Buffer" })
    vim.keymap.set("n", "L", "<cmd>BufferLineCycleNext<cr>", { desc = "Next Buffer" })
    vim.keymap.set("n", "<leader>bd", "<cmd>bd<cr>", { desc = "Delete Buffer" })
    vim.keymap.set("n", "<leader>bp", "<cmd>BufferLineTogglePin<cr>", { desc = "Pin Buffer" })
    vim.keymap.set("n", "<leader>bf", "<cmd>BufferLineCloseOthers<cr>", { desc = "Close Other Buffers" })
  end,
}
