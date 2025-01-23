local Util = require("config/util")

local git_url_template = os.getenv("LAZY_GIT_TEMPLATE")

local servers = {
  lua_ls = {},
  pyright = {},
  terraformls = {},
}

return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
      { "j-hui/fidget.nvim", opts = {} }, -- status updates for lsp
      "folke/neodev.nvim", -- additional lua config
      "stevearc/conform.nvim", -- autoformatting
    },
    config = function()
      require("mason").setup({
        log_level = vim.log.levels.DEBUG,
        github = {
          download_url_template = git_url_template,
        },
      })

      local ensure_installed = {
        "lua_ls",
        "pyright",
        "terraformls",
      }

      local servers_to_install = vim.tbl_filter(function(key)
        local t = servers[key]
        if type(t) == "table" then
          return not t.manual_install
        else
          return t
        end
      end, vim.tbl_keys(servers))

      vim.list_extend(ensure_installed, servers_to_install)
      require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

      local capabilities = nil
      if pcall(require, "cmp_nvim_lsp") then
        capabilities = require("cmp_nvim_lsp").default_capabilities()
      end

      local lspconfig = require("lspconfig")
      for name, config in pairs(servers) do
        if config == true then
          config = {}
        end
        config = vim.tbl_deep_extend("force", {}, {
          capabilities = capabilities,
        }, config)
        lspconfig[name].setup(config)
      end

      local disable_semantic_tokens = {
        lua = true,
      }

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = assert(vim.lsp.get_client_by_id(args.data.client_id), "must have valid client")

          local lsp = vim.lsp.buf

          Util.remap({ from = "<leader>r", to = lsp.rename, desc = "[R]ename", bufrn = 0 })
          Util.remap({ from = "gd", to = lsp.definition, desc = "[G]oto [D]efinition", bufrn = 0 })
          Util.remap({ from = "gr", to = lsp.references, desc = "[G]oto [R]eferences", bufrn = 0 })
          Util.remap({ from = "gi", to = lsp.type_definition, desc = "[G]oto [I]mplementation", bufrn = 0 })
          Util.remap({ from = "gD", to = lsp.declaration, desc = "[G]oto [D]eclaration", bufrn = 0 })
          Util.remap({ from = "K", to = lsp.hover, desc = "Hover Docs", bufrn = 0 })

          local bufnr = args.buf
          local filetype = vim.bo[bufnr].filetype
          if disable_semantic_tokens[filetype] then
            client.server_capabilities.semanticTokensProvider = nil
          end
        end,
      })

      require("conform").setup({
        formatters_by_ft = {
          lua = { "stylua" },
          python = { "autopep8" },
        },
        format_on_save = nil,
      })

      local diag = vim.diagnostic
      Util.remap({ from = "[d", to = diag.goto_prev, desc = "Go to previous diagnostic message" })
      Util.remap({ from = "]d", to = diag.goto_next, desc = "Go to next diagnostic message" })
      Util.remap({ from = "<leader>d", to = diag.open_float, desc = "Open floating diagnostic message" })
    end,
  },
}
