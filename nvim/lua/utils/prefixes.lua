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
  },
  search = {
    name = 'Search',
    keys = leader .. 's',
  },
  ui = {
    name = 'UI',
    keys = leader .. 'u',
  },
  qf = {
    name = 'QuickFix',
    keys = leader .. 'q',
  },
}

return M
