-- Leader key
vim.g.mapleader = " "
--noremap \ ,


-- Behavior
vim.opt.number = true                        -- show line numbers
vim.opt.autowriteall = true
vim.opt.writebackup = false                -- don't create backup files
vim.opt.swapfile = false                    -- don't create .swp files
vim.opt.ignorecase = true
vim.opt.smartcase = true          -- ignore case in searched
vim.opt.autoindent = false
vim.opt.wrap = false                      -- disable word wrap.
vim.opt.history=200
vim.opt.scrolloff=45                  -- show context above/below cursorline
-- set cursorline
-- set cursorcolumn
vim.opt.timeoutlen=500
vim.opt.title = true
vim.opt.titlestring='%f'          -- display filename in title bar
vim.opt.shell='/bin/bash'


-- File explorer
vim.g.netrw_banner = 0


-- Fuzzy finder
vim.api.nvim_set_keymap('n', '<C-F>', ':FuzzyOpen "."<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>d', ':FuzzyOpen "."<CR>', {noremap = true})


-- NVimTree
vim.api.nvim_set_keymap('n', '<leader>t', ':NvimTreeToggle<CR>', {noremap = true})
vim.api.nvim_set_keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', {noremap = true})
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_auto_close = 1
vim.g.nvim_tree_show_icons = { git = 0, folders = 0, files = 0, folder_arrows = 0 }


-- Inserting empty lines using [enter] when in normal mode.
vim.api.nvim_set_keymap('n', '<S-Enter>', 'O<Esc>', {noremap = true})
vim.api.nvim_set_keymap('n', '<CR>', 'o<Esc>k', {noremap = true})


-- Insert spaces using space bar when in normal mode.
vim.api.nvim_set_keymap('n', '<leader><space>', 'i <ESC>', {noremap = true})


-- Saving
-- CTRL-S
vim.api.nvim_set_keymap('n', '<c-s>', '<esc>:w<CR>', {noremap = true})
-- format on save
-- augroup FormatAutogroup
--   autocmd!
--   autocmd BufWritePost *.md,*.ts FormatWrite
-- augroup END


-- Search
vim.api.nvim_set_keymap('n', '<leader>/', ':noh<CR>', {silent = true, noremap = true})


-- Split window resizing
vim.api.nvim_set_keymap('n', '<Leader>=', ':exe "vertical resize +5"<CR>', {silent = true, noremap = true})
vim.api.nvim_set_keymap('n', '<Leader>-', ':exe "vertical resize -5"<CR>', {silent = true, noremap = true})


-- Tabbing
vim.opt.softtabstop=2
vim.opt.shiftwidth=2
vim.opt.expandtab = true
vim.api.nvim_set_keymap('n', '<C-T>', '<esc>:tabnext<CR>', {noremap = true})


-- Paq
require "paq" {
  "savq/paq-nvim";
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
          exe = "dprint",
          args = {"fmt", "--stdin", vim.fn.fnameescape(vim.api.nvim_buf_get_name(0))},
          stdin = true
        }
      end
    },
  }
})


-- Yanking
vim.api.nvim_set_keymap('n', 'Y', 'y$', {noremap = true})


-- DVORAK CUSTOMIZATIONS
-- This has to be last for some reason.
-- Cursor movement
-- :nnoremap <silent> s l
-- :nnoremap <silent> l s
-- :vnoremap <silent> s l
-- :vnoremap <silent> l s
-- -- cursor movement through panes using [leader]-[dvorak movement keys]
-- nmap <silent> <leader>s <C-W>l
-- nmap <silent> <leader>h <C-W>h
-- nmap <silent> <leader>k <C-W>k
-- nmap <silent> <leader>j <C-W>j
-- -- Moving panes using [leader]-[shift]-[dvorak movement keys]
-- nmap <silent> <leader><S-S> <C-W>L
-- nmap <silent> <leader><S-H> <C-W>H
-- nmap <silent> <leader><S-K> <C-W>K
-- nmap <silent> <leader><S-J> <C-W>J
