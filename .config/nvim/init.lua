local g = vim.g
local o = vim.opt
local map = vim.api.nvim_set_keymap
local cmd = vim.api.nvim_command


-- Leader key
g.mapleader = ' '


-- Behavior
o.number = true                   -- show line numbers
o.autowriteall = true
o.writebackup = false             -- don't create backup files
o.swapfile = false                -- don't create .swp files
o.ignorecase = true
o.smartcase = true                -- ignore case in searched
o.autoindent = false
o.wrap = false                    -- disable word wrap.
o.history=200
o.scrolloff=45                    -- show context above/below cursorline
-- set cursorline
-- set cursorcolumn
o.timeoutlen=500
o.title = true
o.titlestring='%f'                -- display filename in title bar
o.shell='/bin/bash'


-- DVORAK CUSTOMIZATIONS
-- This has to be last for some reason.
-- Cursor movement
map('n', 's', 'l', {silent = true, noremap = true})
map('n', 'l', 's', {silent = true, noremap = true})
map('v', 's', 'l', {silent = true, noremap = true})
map('v', 'l', 's', {silent = true, noremap = true})
-- cursor movement through panes using [leader]-[dvorak movement keys]
map('n', '<leader>s', '<C-W>l', {silent = true, noremap = true})
map('n', '<leader>h', '<C-W>h', {silent = true, noremap = true})
map('n', '<leader>k', '<C-W>k', {silent = true, noremap = true})
map('n', '<leader>j', '<C-W>j', {silent = true, noremap = true})
-- Moving panes using [leader]-[shift]-[dvorak movement keys]
map('n', '<leader><S-S>', '<C-W>L', {silent = true, noremap = true})
map('n', '<leader><S-H>', '<C-W>H', {silent = true, noremap = true})
map('n', '<leader><S-K>', '<C-W>K', {silent = true, noremap = true})
map('n', '<leader><S-J>', '<C-W>J', {silent = true, noremap = true})


-- File explorer
g.netrw_banner = 0


-- Fuzzy finder
map('n', '<C-F>', ':FuzzyOpen "."<CR>', {silent = true, noremap = true})
map('n', '<leader>d', ':FuzzyOpen "."<CR>', {silent = true, noremap = true})


-- NVimTree
map('n', '<leader>t', ':NvimTreeToggle<CR>', {silent = true, noremap = true})
map('n', '<leader>n', ':NvimTreeFindFile<CR>', {silent = true, noremap = true})
g.nvim_tree_follow = 1
g.nvim_tree_auto_close = 1
g.nvim_tree_show_icons = { git = 0, folders = 0, files = 0, folder_arrows = 0 }


-- Inserting empty lines using [enter] when in normal mode.
map('n', '<S-Enter>', 'O<Esc>', {silent = true, noremap = true})
map('n', '<CR>', 'o<Esc>k', {silent = true, noremap = true})


-- Insert spaces using space bar when in normal mode.
map('n', '<leader><space>', 'i <ESC>', {silent = true, noremap = true})


-- Saving
-- CTRL-S
map('n', '<c-s>', '<esc>:w<CR>', {silent = true, noremap = true})
-- format on save
-- TODO: use the native bindings once https://github.com/neovim/neovim/pull/14661 ships
cmd('augroup FormatAutogroup')
cmd('autocmd!')
cmd('autocmd BufWritePost *.md,*.ts FormatWrite')
cmd('augroup END')


-- Search
map('n', '<leader>/', ':noh<CR>', {silent = true, noremap = true})


-- Split window resizing
map('n', '<Leader>=', ':exe "vertical resize +5"<CR>', {silent = true, noremap = true})
map('n', '<Leader>-', ':exe "vertical resize -5"<CR>', {silent = true, noremap = true})


-- Tabbing
o.softtabstop=2
o.shiftwidth=2
o.expandtab = true
map('n', '<C-T>', '<esc>:tabnext<CR>', {noremap = true})


-- Yanking
map('n', 'Y', 'y$', {noremap = true})


-- Paq
require 'paq' {
  'savq/paq-nvim';
  'dag/vim-fish';
  'mhartington/formatter.nvim';
  'tomtom/tcomment_vim';
  'tpope/vim-markdown';
  'tpope/vim-repeat';
  'tpope/vim-surround';
  'cloudhead/neovim-fuzzy';
  'kyazdani42/nvim-tree.lua';
}


-- Formatter
require('formatter').setup({
  filetype = {
    markdown = {
      function()
        return {
          exe = 'dprint',
          args = {'fmt', '--stdin', vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    },
  }
})
