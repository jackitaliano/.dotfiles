local prefixes = require 'utils.prefixes'
local utils = require 'utils.common'

local search_prefix = prefixes.search.keys
local find_prefix = prefixes.find.keys
local git_prefix = prefixes.git.keys

return {
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        build = 'make',
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = require('telescope.themes').get_ivy { winblend = 10, previewer = true },
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
          advanced_git_search = {
            telescope_theme = {
              diff_commit_line = 'ivy',
              diff_commit_file = 'ivy',
              search_log_content_file = 'ivy',

              show_custom_functions = {},
            },
          },
        },
      }
      local grey = '#161616'
      local light_grey = '#2f2f31'

      local hl_groups = {
        TelescopeNormal = grey,
        TelescopeBorder = grey,
        TelescopeSelection = light_grey,
        TelescopePromptNormal = grey,
        TelescopePromptPrefix = grey,
        TelescopePromptBorder = grey,
        TelescopePromptTitle = grey,
        TelescopePreviewTitle = grey,
        TelescopePreviewBorder = grey,
        TelescopeResultsTitle = grey,
        TelescopeResultsBorder = grey,
      }

      for hl_group, color in pairs(hl_groups) do
        vim.api.nvim_set_hl(0, hl_group, { bg = color })
      end

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')
      local ags_success = pcall(require('telescope').load_extension, 'advanced_git_search')

      local drop_picker = require('telescope.themes').get_dropdown { winblend = 10, previewer = false }
      local ivy_picker = require('telescope.themes').get_ivy { winblend = 10, previewer = true }

      ---@param func function
      ---@param opts? table
      local function drop(func, opts)
        return function()
          opts = vim.tbl_deep_extend('force', {}, drop_picker, opts or {})
          func(opts)
        end
      end

      ---@param func function
      ---@param opts? table
      local function ivy(func, opts)
        return function()
          opts = vim.tbl_deep_extend('force', {}, ivy_picker, opts or {})
          func(opts)
        end
      end

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'

      local nmap = utils.get_mode_map('n', {})

      if ags_success then
        local ags = require('telescope').extensions.advanced_git_search
        nmap('<leader>gs', ags.search_log_content_file, '')
        nmap('<leader>gf', ags.diff_commit_file, 'File Commit Hist')
        nmap('<leader>gb', ags.diff_commit_line, 'Blame')
      end

      nmap('<leader>sr', builtin.resume, 'Resume')
      nmap('<leader>sh', drop(builtin.help_tags), 'Help')
      nmap('<leader>sk', drop(builtin.keymaps), 'Keymaps')
      nmap('<leader>sw', ivy(builtin.grep_string), 'current Word')
      nmap('<leader>sg', ivy(builtin.live_grep), 'Grep')
      nmap('<leader>sd', ivy(builtin.diagnostics), 'Diagnostics')
      nmap('<leader>sR', drop(builtin.registers), 'Registers')
      nmap('<leader>sm', ivy(builtin.marks), 'Marks')
      nmap('<leader>sC', ivy(builtin.commands), 'Commands')
      nmap('<leader>st', ivy(builtin.grep_string, { search = 'TODO:' }), 'Todo')
      nmap('<leader>sT', ivy(builtin.grep_string, { search = 'FIX:' }), 'Todo Fix')
      nmap('<leader>s/', ivy(builtin.live_grep, { grep_open_files = true, prompt_title = 'Live Grep in Open Files' }), 'Grep Buffers')
      nmap('<leader>sf', drop(builtin.find_files, { hidden = true }), 'files')
      nmap('<leader>sF', ivy(builtin.find_files, { hidden = true }), 'Files')
      nmap('<leader>s.', ivy(builtin.oldfiles), 'Recent Files ("." for repeat)')

      nmap('<leader><leader>', drop(builtin.buffers), 'Find Buffers')
      nmap('<leader>/', drop(builtin.current_buffer_fuzzy_find), 'Fuzzy Buffer')
    end,
  },
  {
    'aaronhallaert/advanced-git-search.nvim',
    cmd = { 'AdvancedGitSearch' },
    dependencies = {
      'nvim-telescope/telescope.nvim',
      'tpope/vim-fugitive',
    },
  },
}
