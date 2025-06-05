local leader = vim.g.mapleader

local M = {
  debug = {
    name = 'Debug',
    keys = leader .. 'd',
  },
  find = {
    name = 'Find',
    keys = leader .. 'f',
  },
  git = {
    name = 'Git',
    keys = leader .. 'g',
    hunk = {
      name = 'Hunk',
      keys = leader .. 'gh',
    },
  },
  search = {
    name = 'Search',
    keys = leader .. 's',
  },
  ui = {
    name = 'UI',
    keys = leader .. 'u',
    git = {
      name = 'Git',
      keys = leader .. 'ug',
    },
  },
  qf = {
    name = 'QuickFix',
    keys = leader .. 'q',
  },
  code_actions = {
    name = 'Code Actions',
    keys = leader .. 'c',
  },
}

return M
