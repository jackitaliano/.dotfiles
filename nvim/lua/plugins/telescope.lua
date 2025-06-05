-- NOTE: Plugins can specify dependencies.
--
-- The dependencies are proper plugin specifications as well - anything
-- you do for a plugin at the top level, you can do for a dependency.
--
-- Use the `dependencies` key to specify the dependencies of a particular plugin

local prefixes = require 'utils.prefixes'
local utils = require 'utils.common'

local search_prefix = prefixes.search.keys
local find_prefix = prefixes.find.keys

return {
  { -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      { -- If encountering errors, see telescope-fzf-native README for installation instructions
        'nvim-telescope/telescope-fzf-native.nvim',

        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',

        -- `cond` is a condition used to determine whether this plugin should be
        -- installed and loaded.
        cond = function()
          return vim.fn.executable 'make' == 1
        end,
      },
      { 'nvim-telescope/telescope-ui-select.nvim' },

      -- Useful for getting pretty icons, but requires a Nerd Font.
      { 'nvim-tree/nvim-web-devicons', enabled = vim.g.have_nerd_font },
    },
    config = function()
      -- Telescope is a fuzzy finder that comes with a lot of different things that
      -- it can fuzzy find! It's more than just a "file finder", it can search
      -- many different aspects of Neovim, your workspace, LSP, and more!
      --
      -- The easiest way to use Telescope, is to start by doing something like:
      --  :Telescope help_tags
      --
      -- After running this command, a window will open up and you're able to
      -- type in the prompt window. You'll see a list of `help_tags` options and
      -- a corresponding preview of the help.
      --
      -- Two important keymaps to use while in Telescope are:
      --  - Insert mode: <c-/>
      --  - Normal mode: ?
      --
      -- This opens a window that shows you all of the keymaps for the current
      -- Telescope picker. This is really useful to discover what Telescope can
      -- do as well as how to actually do it!

      -- [[ Configure Telescope ]]
      -- See `:help telescope` and `:help telescope.setup()`
      require('telescope').setup {
        -- You can put your default mappings / updates / etc. in here
        --  All the info you're looking for is in `:help telescope.setup()`
        --
        defaults = {
          mappings = {
            i = { ['<c-f>'] = 'to_fuzzy_refine' },
          },
        },
        -- pickers = {}
        extensions = {
          ['ui-select'] = {
            require('telescope.themes').get_dropdown(),
          },
        },
      }

      -- Enable Telescope extensions if they are installed
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require('telescope').load_extension, 'ui-select')

      local drop_picker = require('telescope.themes').get_dropdown { winblend = 10, previewer = false }
      local ivy_picker = require('telescope.themes').get_ivy { winblend = 10, previewer = true }

      local drop = function(func)
        return function()
          func(drop_picker)
        end
      end

      local ivy = function(func)
        return function()
          func(ivy_picker)
        end
      end

      -- See `:help telescope.builtin`
      local builtin = require 'telescope.builtin'

      local search_map = utils.get_prefix_map(search_prefix)
      local find_map = utils.get_prefix_map(find_prefix)
      local map = utils.get_prefix_map ''

      search_map('n', 'r', builtin.resume, '[S]earch [R]esume')
      search_map('n', 'h', drop(builtin.help_tags), '[S]earch [H]elp')
      search_map('n', 'k', drop(builtin.keymaps), '[S]earch [K]eymaps')
      search_map('n', 'w', ivy(builtin.grep_string), '[S]earch current [W]ord')
      search_map('n', 'g', ivy(builtin.live_grep), '[S]earch by [G]rep')
      search_map('n', 's', ivy(builtin.lsp_document_symbols), '[S]earch Document [s]ymbols')
      search_map('n', 'S', ivy(builtin.lsp_workspace_symbols), '[S]earch Workspace [S]symbols')
      search_map('n', 'd', ivy(builtin.diagnostics), '[S]earch [D]iagnostics')
      search_map('n', 'R', drop(builtin.registers), '[S]earch [R]egisters')
      search_map('n', 'm', ivy(builtin.marks), '[S]earch [M]arks')
      search_map('n', 'C', ivy(builtin.commands), '[S]earch [C]ommands')
      search_map('n', 't', '<cmd>TodoTelescope keywords=TODO<CR>', '[S]earch [T]odo')
      search_map('n', 'T', '<cmd>TodoTelescope keywords=FIX<CR>', '[S]earch [T]odo')
      search_map('n', '/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, '[S]earch [/] in Open Files')

      find_map('n', 'f', drop(builtin.find_files), '[S]earch [f]iles')
      find_map('n', 'F', ivy(builtin.find_files), '[S]earch [F]iles')
      find_map('n', '.', ivy(builtin.oldfiles), '[S]earch Recent Files ("." for repeat)')

      map('n', '<leader><leader>', drop(builtin.buffers), '[ ] Find existing buffers')

      map('n', '<leader>/', drop(builtin.current_buffer_fuzzy_find), '[/] Fuzzily search in current buffer')
    end,
  },
}
