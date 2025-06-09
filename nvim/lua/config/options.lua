local opt = vim.opt

-------------------------------------
-- UI
-------------------------------------
opt.relativenumber = false
opt.number = true
vim.o.laststatus = 3

-- don't show mode since in statusline
opt.showmode = false

-- Sets how neovim will display certain whitespace characters in the editor.
opt.list = true
opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 8
opt.sidescrolloff = 8

opt.tabstop = 4
opt.shiftwidth = 4

opt.linebreak = true

-- Keep signcolumn on by default
opt.signcolumn = 'yes'
opt.ruler = false

opt.smoothscroll = true
opt.termguicolors = true -- True color support

opt.wrap = false

opt.winminwidth = 5

opt.linebreak = true
opt.expandtab = true

-- Enable break indent
opt.breakindent = true

opt.fillchars = {
  foldopen = '',
  foldclose = '',
  fold = ' ',
  foldsep = ' ',
  diff = '╱',
  eob = ' ',
}

-------------------------------------
-- Search
-------------------------------------

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Preview substitutions live, as you type!
opt.inccommand = 'split'

-------------------------------------
-- QOL
-------------------------------------

-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  opt.clipboard = 'unnamedplus'
end)

-- Save undo history
opt.undofile = true
opt.undolevels = 10000
opt.virtualedit = 'block'

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time
opt.timeoutlen = 300

-- Configure how new splits should be opened
opt.splitright = true
opt.splitbelow = true

opt.spelllang = { 'en' }

opt.wildmode = 'longest:full,full' -- Command-line completion mode

-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
opt.confirm = true

-- Enable mouse mode, can be useful for resizing splits for example!
opt.mouse = 'a'
