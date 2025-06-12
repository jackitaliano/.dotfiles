--[[

=====================================================================
=====================================================================
========                                    .-----.          ========
========         .----------------------.   | === |          ========
========         |.-""""""""""""""""""-.|   |-----|          ========
========         ||                    ||   | === |          ========
========         ||        NVIM        ||   |-----|          ========
========         ||                    ||   | === |          ========
========         ||                    ||   |-----|          ========
========         ||                    ||   |:::::|          ========
========         |'-..................-'|   |____o|          ========
========         `"")----------------(""`                    ========
========        /::::::::::|  |::::::::::\                   ========
========       /:::========|==|==hjkl==:::\                  ========
========      '""""""""""""""""""""""""""""'                 ========
========                                                     ========
=====================================================================

--]]

if not vim.fs.abspath then
  vim.fs.abspath = function(path)
    -- try the new name, then fallback to vim.loop.fs_realpath
    return (vim.fs.realpath and vim.fs.realpath(path)) or vim.loop.fs_realpath(path)
  end
end

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.g.have_nerd_font = true

-- [[ Setting options ]]
require 'config.options'
require 'config.keymaps'

-- [[ Install `lazy.nvim` plugin manager ]]
require 'lazy-bootstrap'

-- [[ Configure and install plugins ]]
require 'lazy-plugins'
