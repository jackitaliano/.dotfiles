local function debug_args()
  vim.ui.input({ prompt = "Debug Args: " }, function(input)
    vim.cmd({ cmd = "GoDebug", args = { input } })
  end)
end

return {
  "ray-x/go.nvim",
  dependencies = {  -- optional packages
    "ray-x/guihua.lua",
    "neovim/nvim-lspconfig",
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("go").setup()

    local format_sync_grp = vim.api.nvim_create_augroup("GoFormat", {})
    vim.api.nvim_create_autocmd("BufWritePre", {
      pattern = "*.go",
      callback = function()
        require('go.format').goimports()
      end,
      group = format_sync_grp,
    })

  end,
  keys = {
    { "<leader>ds",  "<cmd>GoDebug<cr>", desc = "Start Debug"},
    { "<leader>dS", debug_args, desc = "Start Debug (args)"}
  },
  event = {"CmdlineEnter"},
  ft = {"go", 'gomod'},
  build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
}
