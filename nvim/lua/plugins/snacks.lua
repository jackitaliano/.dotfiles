local layouts = require('utils.snacks').layouts

return {
  'folke/snacks.nvim',
  priority = 1000,
  lazy = false,
  config = function()
    local snacks = require 'snacks'
    ---@type snacks.Config
    local opts = {
      bigfile = { enabled = true },
      dashboard = {
        sections = {
          { section = 'header' },
          { section = 'keys', gap = 1, padding = 1 },
          { section = 'startup' },
          {
            pane = 2,
            icon = ' ',
            desc = 'Browse Repo',
            padding = 1,
            key = 'b',
            action = function()
              Snacks.gitbrowse()
            end,
          },
          -- function()
          --   local in_git = Snacks.git.get_root() ~= nil
          --   local cmds = {
          --     {
          --       title = 'Notifications',
          --       cmd = 'gh notify -s -a -n5',
          --       action = function()
          --         vim.ui.open 'https://github.com/notifications'
          --       end,
          --       key = 'n',
          --       icon = ' ',
          --       height = 5,
          --       enabled = true,
          --     },
          --     {
          --       title = 'Open Issues',
          --       cmd = 'gh issue list -L 3',
          --       key = 'i',
          --       action = function()
          --         vim.fn.jobstart('gh issue list --web', { detach = true })
          --       end,
          --       icon = ' ',
          --       height = 7,
          --     },
          --     {
          --       icon = ' ',
          --       title = 'Open PRs',
          --       cmd = 'gh pr list -L 3',
          --       key = 'P',
          --       action = function()
          --         vim.fn.jobstart('gh pr list --web', { detach = true })
          --       end,
          --       height = 7,
          --     },
          --     {
          --       icon = ' ',
          --       title = 'Git Status',
          --       cmd = 'git --no-pager diff --stat -B -M -C',
          --       height = 10,
          --     },
          --   }
          --   return vim.tbl_map(function(cmd)
          --     return vim.tbl_extend('force', {
          --       pane = 2,
          --       section = 'terminal',
          --       enabled = in_git,
          --       padding = 1,
          --       ttl = 5 * 60,
          --       indent = 3,
          --     }, cmd)
          --   end, cmds)
          -- end,
        },
      },
      indent = { enabled = true },
      input = { enabled = true },
      picker = {
        enabled = true,
        layouts = {
          default = layouts.ivy,
        },
      },
      notifier = { enabled = true },
      quickfile = { enabled = true },
      scope = { enabled = true },
      scroll = {
        animate = {
          duration = { step = 10, total = 100 },
          easing = 'linear',
        },
        -- faster animation when repeating scroll after delay
        animate_repeat = {
          delay = 50, -- delay in ms before using the repeat animation
          duration = { step = 5, total = 50 },
          easing = 'linear',
        },
        -- what buffers to animate
        filter = function(buf)
          return vim.g.snacks_scroll ~= false and vim.b[buf].snacks_scroll ~= false and vim.bo[buf].buftype ~= 'terminal'
        end,
        debug = false,
      },
      statuscolumn = { enabled = true },
      words = { enabled = true },
    }

    -- local grey = '#161616'
    local grey = '#1E1E2E'
    local light_grey = '#282838'

    snacks.setup(opts)
    local hl_groups = {
      SnacksPicker = grey,
      SnacksPickerCursorLine = light_grey,
      SnacksPickerListCursorLine = light_grey,
      SnacksPickerPreviewCursorLine = light_grey,
      SnacksPickerBoxCursorLine = light_grey,
      SnacksPickerInputCursorLine = light_grey,
      SnacksPickerDimmed = grey,
      SnacksPickerGitBreaking = grey,
      SnacksPickerSearch = grey,
      SnacksPickerPickWin = grey,
      SnacksPickerPickWinCurrent = grey,
      SnacksPickerBox = grey,
      SnacksPickerList = grey,
      SnacksPickerInput = grey,
      SnacksPickerPreview = grey,
    }

    for hl_group, color in pairs(hl_groups) do
      vim.api.nvim_set_hl(0, hl_group, { bg = color })
    end
  end,
  keys = {
    {
      '<leader>f',
      function()
        Snacks.picker.smart {
          layout = layouts.select,
        }
      end,
      desc = 'Files',
    },
    -- {
    --   '<leader>sF',
    --   function()
    --     Snacks.picker.smart()
    --   end,
    --   desc = 'File Previews',
    -- },
    -- {
    --   '<leader>sH',
    --   function()
    --     Snacks.picker.highlights { pattern = 'hl_group:^' }
    --   end,
    --   desc = 'Highlights',
    -- },
    -- {
    --   '<leader>sh',
    --   function()
    --     Snacks.picker.help {
    --       layout = layouts.select,
    --     }
    --   end,
    --   desc = 'Help',
    -- },
    -- {
    --   '<leader>sk',
    --   function()
    --     Snacks.picker.keymaps {
    --       layout = layouts.select,
    --     }
    --   end,
    --   desc = 'Keymaps',
    -- },
    -- {
    --   '<leader>sw',
    --   function()
    --     Snacks.picker.grep_word()
    --   end,
    --   desc = 'Word',
    -- },
    {
      '<leader>/',
      function()
        Snacks.picker.grep()
      end,
      desc = 'Grep',
    },
    -- {
    --   '<leader>s/',
    --   function()
    --     Snacks.picker.grep_buffers()
    --   end,
    --   desc = 'Grep Buffers',
    -- },
    {
      '<leader><leader>',
      function()
        Snacks.picker.lines {
          layout = layouts.select,
        }
      end,
      desc = 'Fuzzy Buffer',
    },
    -- {
    --   '<leader>sd',
    --   function()
    --     Snacks.picker.diagnostics_buffer()
    --   end,
    --   desc = 'Diagnostics',
    -- },
    -- {
    --   '<leader>sD',
    --   function()
    --     Snacks.picker.diagnostics()
    --   end,
    --   desc = 'Workspace Diagnostics',
    -- },
    -- {
    --   '<leader>sm',
    --   function()
    --     Snacks.picker.marks()
    --   end,
    --   desc = 'Marks',
    -- },
    -- {
    --   '<leader>sr',
    --   function()
    --     Snacks.picker.registers { layout = layouts.select }
    --   end,
    --   desc = 'Registers',
    -- },
    -- {
    --   '<leader>sc',
    --   function()
    --     Snacks.picker.commands { layout = layouts.select }
    --   end,
    --   desc = 'Commands',
    -- },
    -- {
    --   '<leader>s.',
    --   function()
    --     Snacks.picker.recent { layout = layouts.select }
    --   end,
    --   desc = 'Commands',
    -- },
    -- {
    --   '<leader><leader>',
    --   function()
    --     Snacks.picker.buffers { layout = layouts.select }
    --   end,
    --   desc = 'Commands',
    -- },
    {
      '<leader>gb',
      function()
        Snacks.picker.git_log_line()
      end,
      desc = 'Git Blame Line',
    },
    {
      '<leader>gf',
      function()
        Snacks.picker.git_log_file()
      end,
      desc = 'Git Log File',
    },
    {
      '<leader>gl',
      function()
        Snacks.picker.git_log()
      end,
      desc = 'Git Log',
    },
    -- {
    --   '<leader>sn',
    --   function()
    --     Snacks.picker.notifications()
    --   end,
    --   desc = 'Notifications',
    -- },
    -- {
    --   '<leader>sq',
    --   function()
    --     Snacks.picker.qflist()
    --   end,
    --   desc = 'Quickfix',
    -- },
    -- {
    --   '<leader>sa',
    --   function()
    --     Snacks.picker.autocmds()
    --   end,
    --   desc = 'AutoCommands',
    -- },
  },
}
