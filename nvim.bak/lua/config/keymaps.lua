return {
  -- Quit
  vim.keymap.set('n', '<leader>q', "<cmd>q<cr><esc>", { desc = '[q]uit' }),
  -- Write
  vim.keymap.set('n', '<leader>ww', "<cmd>w<cr><esc>", { desc = 'Write Buf' }),
  vim.keymap.set('n', '<leader>wa', "<cmd>wa<cr><esc>", { desc = 'Write All' }),

  -- Resize window using <ctrl> arrow keys
  vim.keymap.set("n", "<A-Up>", "<cmd>resize +2<cr>", { desc = "Increase window height" }),
  vim.keymap.set("n", "<A-Down>", "<cmd>resize -2<cr>", { desc = "Decrease window height" }),
  vim.keymap.set("n", "<A-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease window width" }),
  vim.keymap.set("n", "<A-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase window width" }),

  -- Splits
  vim.keymap.set("n", "<leader>-", "<C-W>s", { desc = "Split window below", remap = true }),
  vim.keymap.set("n", "<leader>\\", "<C-W>v", { desc = "Split window right", remap = true }),

  -- Move Lines
  -- vim.keymap.set("n", "<A-j>", "<cmd>m .+1<cr>==", { desc = "Move down" }),
  -- vim.keymap.set("n", "<A-k>", "<cmd>m .-2<cr>==", { desc = "Move up" }),
  -- vim.keymap.set("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move down" }),
  -- vim.keymap.set("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move up" }),
  -- vim.keymap.set("v", "<A-j>", ":m '>+1<cr>gv=gv", { desc = "Move down" }),
  -- vim.keymap.set("v", "<A-k>", ":m '<-2<cr>gv=gv", { desc = "Move up" }),
  vim.keymap.set("v", ">", ">gv", { desc = "Persist select" }),
  vim.keymap.set("v", "<", "<gv", { desc = "Persist select" }),

}
