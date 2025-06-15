local utils = require 'utils.common'
local prefixes = require 'utils.prefixes'

local default_opts = {}
local map = utils.get_prefix_map('', default_opts)
local map_l = utils.get_prefix_map('<leader>', default_opts)
local map_ui = utils.get_prefix_map(prefixes.ui.keys, default_opts)
local map_code = utils.get_prefix_map(prefixes.code_actions.keys, default_opts)

-------------------------------------
-- UI
-------------------------------------

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

map_ui('n', 'r', function()
  if vim.wo.relativenumber then
    vim.wo.relativenumber = false
  else
    vim.wo.relativenumber = true
  end
end, 'Rel Line Num')

map_ui('n', 'l', function()
  if vim.wo.number then
    vim.wo.number = false
  else
    vim.wo.number = true
  end
end, 'Line Num')

map_ui('n', 'R', '<Cmd>nohlsearch<Bar>diffupdate<Bar>normal! <C-L><CR>', 'Redraw / Clear hlsearch / Diff Update')

map_ui('n', 'c', function()
  if vim.o.conceallevel == 2 then
    vim.o.conceallevel = 1
  else
    vim.o.conceallevel = 2
  end
  vim.notify('conceallevel=' .. vim.o.conceallevel, vim.log.levels.INFO)
end, 'Conceal')

map_ui('n', 'C', function()
  if vim.wo.conceallevel == 2 then
    vim.wo.conceallevel = 1
  else
    vim.wo.conceallevel = 2
  end
  vim.notify('conceallevel=' .. vim.wo.conceallevel, vim.log.levels.INFO)
end, 'Local Conceal')

-------------------------------------
-- Windows
-------------------------------------

-- Splits
map_l('n', '-', '<C-W>s', 'Split Hori')
map_l('n', '\\', '<C-W>v', 'Split Vert')

-- Resize window using <ctrl> arrow keys
map('n', '<C-Up>', '<cmd>resize +2<cr>', 'Increase Window Height')
map('n', '<C-Down>', '<cmd>resize -2<cr>', 'Decrease Window Height')
map('n', '<C-Left>', '<cmd>vertical resize -2<cr>', 'Decrease Window Width')
map('n', '<C-Right>', '<cmd>vertical resize +2<cr>', 'Increase Window Width')

-------------------------------------
-- Buffers
-------------------------------------

-- map('n', '<S-h>', vim.cmd.bprevious, 'Prev Buffer')
-- map('n', '<S-l>', vim.cmd.bnext, 'Next Buffer')
map_l('n', 'bb', '<cmd>e #<cr>', 'Switch to Other Buffer')
map_l('n', '`', '<cmd>e #<cr>', 'Switch to Other Buffer')
map_l('n', 'bd', vim.cmd.bdelete, 'Delete Buffer')
-- map('n', '<leader>bo', function()
--   Snacks.bufdelete.other()
-- end, 'Delete Other Buffers')
map_l('n', 'bD', '<cmd>:bd<cr>', 'Delete Buffer and Window')

-------------------------------------
-- Tabs
-------------------------------------

map_l('n', '<tab>l', '<cmd>tablast<cr>', 'Last Tab')
map_l('n', '<tab>o', '<cmd>tabonly<cr>', 'Close Other Tabs')
map_l('n', '<tab>f', '<cmd>tabfirst<cr>', 'First Tab')
map_l('n', '<tab><tab>', '<cmd>tabnew<cr>', 'New Tab')
map_l('n', '<tab>]', '<cmd>tabnext<cr>', 'Next Tab')
map_l('n', '<tab>d', '<cmd>tabclose<cr>', 'Close Tab')
map_l('n', '<tab>[', '<cmd>tabprevious<cr>', 'Previous Tab')

-------------------------------------
-- QuickFix
-------------------------------------

-- map('n', '<C-p>', vim.cmd.cprev, 'Previous Quickfix')
-- map('n', '<C-n>', vim.cmd.cnext, 'Next Quickfix')
-- map('n', '<C-q>', vim.cmd.copen, 'Open diagnostic Quickfix list')

-- Diagnostic keymaps

local diagnostic_goto = function(next, severity)
  local go = next and vim.diagnostic.goto_next or vim.diagnostic.goto_prev
  severity = severity and vim.diagnostic.severity[severity] or nil
  return function()
    go { severity = severity }
  end
end
map_code('n', 'd', vim.diagnostic.open_float, 'Line Diagnostics')
map('n', ']d', diagnostic_goto(true), 'Next Diagnostic')
map('n', '[d', diagnostic_goto(false), 'Prev Diagnostic')
map('n', ']e', diagnostic_goto(true, 'ERROR'), 'Next Error')
map('n', '[e', diagnostic_goto(false, 'ERROR'), 'Prev Error')
map('n', ']w', diagnostic_goto(true, 'WARN'), 'Next Warning')
map('n', '[w', diagnostic_goto(false, 'WARN'), 'Prev Warning')

-------------------------------------
-- Terminal
-------------------------------------

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', 'Exit terminal mode')

-------------------------------------
-- QOL
-------------------------------------
-- Lazy

map('n', '<leader>ll', '<cmd>Lazy<cr>', 'Lazy')
map('n', '<leader>ltp', function()
  vim.ui.input({ prompt = 'Plugin Name: ' }, utils.toggle_plugin)
end, 'Toggle Plugin')
map('n', '<leader>ltb', function()
  utils.toggle_plugin 'bufferline.nvim'
end, 'Toggle Plugin')

-- Persist visual select for indenting
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Highlight when yanking (copying) text
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- better up/down
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", 'Down', { expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", 'Down', { expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", 'Up', { expr = true, silent = true })
map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", 'Up', { expr = true, silent = true })

-- Move Lines
map('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", 'Move Down')
map('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", 'Move Up')
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', 'Move Down')
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', 'Move Up')
map('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", 'Move Down')
map('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", 'Move Up')

-- commenting above/below
map('n', 'gco', 'o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', 'Add Comment Below')
map('n', 'gcO', 'O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>', 'Add Comment Above')

-- native snippets. only needed on < 0.11, as 0.11 creates these by default
if vim.fn.has 'nvim-0.11' == 0 then
  map('s', '<Tab>', function()
    return vim.snippet.active { direction = 1 } and '<cmd>lua vim.snippet.jump(1)<cr>' or '<Tab>'
  end, 'Jump Next', { expr = true })
  map({ 'i', 's' }, '<S-Tab>', function()
    return vim.snippet.active { direction = -1 } and '<cmd>lua vim.snippet.jump(-1)<cr>' or '<S-Tab>'
  end, 'Jump Previous', { expr = true })
end
