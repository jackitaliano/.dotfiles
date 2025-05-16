return {
  {
    "navarasu/onedark.nvim",
    priority = 1000,
    enabled = true,
  },
  {
    "rockyzhang24/arctic.nvim",
    enabled = true,
    dependencies = { "rktjmp/lush.nvim" },
    name = "arctic",
    priority = 1000,
    config = function()
      vim.cmd.colorscheme("arctic")
    end,
  },
}
