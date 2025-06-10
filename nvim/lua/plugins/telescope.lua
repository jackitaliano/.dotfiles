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
        defaults = {
          mappings = {
            i = { ['<c-f>'] = 'to_fuzzy_refine' },
          },
        },
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

      local search_map = utils.get_prefix_map(search_prefix)
      local find_map = utils.get_prefix_map(find_prefix)
      local git_map = utils.get_prefix_map(git_prefix)
      local map = utils.get_prefix_map ''

      if ags_success then
        local ags = require('telescope').extensions.advanced_git_search
        git_map('n', 's', ags.search_log_content_file, '')
        git_map('n', 'f', ags.diff_commit_file, '[F]ile Commit Hist')
        git_map('n', 'b', ags.diff_commit_line, '[B]lame')
      end

      search_map('n', 'r', builtin.resume, '[S]earch [R]esume')
      search_map('n', 'h', drop(builtin.help_tags), '[S]earch [H]elp')
      search_map('n', 'k', drop(builtin.keymaps), '[S]earch [K]eymaps')
      search_map('n', 'w', ivy(builtin.grep_string), '[S]earch current [W]ord')
      search_map('n', 'g', ivy(builtin.live_grep), '[S]earch by [G]rep')
      search_map('n', 'd', ivy(builtin.diagnostics), '[S]earch [D]iagnostics')
      search_map('n', 'R', drop(builtin.registers), '[S]earch [R]egisters')
      search_map('n', 'm', ivy(builtin.marks), '[S]earch [M]arks')
      search_map('n', 'C', ivy(builtin.commands), '[S]earch [C]ommands')
      search_map('n', 't', ivy(builtin.grep_string, { search = 'TODO:' }), '[S]earch [T]odo')
      search_map('n', 'T', ivy(builtin.grep_string, { search = 'FIX:' }), '[S]earch [T]odo Fix')
      search_map('n', '/', ivy(builtin.live_grep, { grep_open_files = true, prompt_title = 'Live Grep in Open Files' }), '[S]earch [/] in Open Files')

      find_map('n', 'f', drop(builtin.find_files, { hidden = true }), '[S]earch [f]iles')
      find_map('n', 'F', ivy(builtin.find_files, { hidden = true }), '[S]earch [F]iles')
      find_map('n', '.', ivy(builtin.oldfiles), '[S]earch Recent Files ("." for repeat)')

      map('n', '<leader><leader>', drop(builtin.buffers), '[ ] Find existing buffers')

      map('n', '<leader>/', drop(builtin.current_buffer_fuzzy_find), '[/] Fuzzily search in current buffer')
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
