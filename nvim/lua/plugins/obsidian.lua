return {
  'obsidian-nvim/obsidian.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  keys = {
    { '<leader>oo', '<cmd>Obsidian<cr>', desc = 'Obsidian' },
    { '<leader>on', '<cmd>ObsidianNew<cr>', desc = 'New' },
    { '<leader>oN', '<cmd>ObsidianNewFromTemplate<cr>', desc = 'New Template' },
    { '<leader>ow', '<cmd>ObsidianWorkspace<cr>', desc = 'Workspace' },
    { '<leader>or', '<cmd>ObsidianRename<cr>', desc = 'Rename' },
    { '<leader>sod', '<cmd>ObsidianDailies<cr>', desc = 'Dailies' },
    { '<leader>sof', '<cmd>ObsidianQuickSwitch<cr>', desc = 'Files' },
    { '<leader>sos', '<cmd>ObsidianSearch<cr>', desc = 'Search' },
    { '<leader>sot', '<cmd>ObsidianTags<cr>', desc = 'Tags' },
    { '<leader>sol', '<cmd>ObsidianLinks<cr>', desc = 'Links', ft = 'md' },
    { '<leader>sob', '<cmd>ObsidianBacklinks<cr>', desc = 'Backlinks', ft = 'md' },
    { '<leader>soc', '<cmd>ObsidianTOC<cr>', desc = 'TOC', ft = 'md' },
    { 'gl', '<cmd>ObsidianLink<cr>', desc = 'Obsidian Link', mode = 'v', ft = 'md' },
    { 'gL', '<cmd>ObsidianLinkNew<cr>', desc = 'Obsidian Link New', mode = 'v', ft = 'md' },
  },
  ---@type obsidian.config.ClientOpts
  opts = {
    workspaces = {
      {
        name = 'notes',
        path = '~/notes',
      },
    },
    notes_subdir = 'scratch',
    daily_notes = {
      folder = 'daily',
      date_format = '%Y-%m-%d',
      alias_format = '%B %-d, %Y',
      default_tags = { 'daily-notes' },
      template = 'daily.md',
      workdays_only = true,
    },
    completion = {
      blink = true,
    },
    new_notes_location = 'notes_subdir',
    preferred_link_style = 'markdown',
    picker = {
      name = 'telescope.nvim',
    },
    templates = {
      folder = 'templates',
      date_format = '%Y-%m-%d',
      time_format = '%H:%M',
      substitutions = {},
    },
    -- Optional, customize how note IDs are generated given an optional title.
    ---@param title string|?
    ---@return string
    note_id_func = function(title)
      if title == nil then
        return tostring(os.date '%Y%m%d%H%M') .. '-new'
      end

      -- If title is given, transform it into valid file name.
      return title:gsub(' ', '_'):gsub('[^A-Za-z0-9_-]', ''):lower()
    end,

    -- Optional, customize how note file names are generated given the ID, target directory, and title.
    ---@param spec { id: string, dir: obsidian.Path, title: string|? }
    ---@return string|obsidian.Path The full path to the new note.
    note_path_func = function(spec)
      -- This is equivalent to the default behavior.
      local path = spec.dir / tostring(spec.id)
      return path:with_suffix '.md'
    end,
  },
}
