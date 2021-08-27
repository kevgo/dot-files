" Leader key
let g:mapleader = "\<space>"
noremap \ ,


" Behavior
set number                        " show line numbers
set autowriteall
set nowritebackup                 " don't create backup files
set noswapfile                    " don't create .swp files
set ignorecase smartcase          " ignore case in searched
set noautoindent
set nowrap                        " disable word wrap.
set history=200
set scrolloff=45                  " show context above/below cursorline
" set cursorline
" set cursorcolumn
set timeoutlen=500
set title titlestring=%f          " display filename in title bar
set shell=/bin/bash


" File explorer
let g:netrw_banner = 0


" Fuzzy finder
nnoremap <C-F> :FuzzyOpen "."<CR>
nnoremap <leader>d :FuzzyOpen "."<CR>


" NVimTree
map <silent> <leader>t :NvimTreeToggle<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
let g:nvim_tree_follow = 1
let g:nvim_tree_show_icons = {
    \ 'git': 0,
    \ 'folders': 0,
    \ 'files': 0,
    \ 'folder_arrows': 0,
    \ }


" Inserting empty lines using [enter] when in normal mode.
map <S-Enter> O<Esc>
map <CR> o<Esc>k


" Insert spaces using space bar when in normal mode.
nnoremap <silent> <leader><space> i <ESC>


" Saving
" CTRL-S
:noremap <c-s> <esc>:w<CR>
" format on save
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.md,*.ts FormatWrite
augroup END


" Search
map <silent> <leader>/ :noh<CR>


" Split window resizing
nnoremap <silent> <Leader>= :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>- :exe "vertical resize -5"<CR>


" Tabbing
set softtabstop=2
set shiftwidth=2
set expandtab
nnoremap <C-T> <esc>:tabnext<CR>


" Plug
call plug#begin(stdpath('data') . '/plugged')

Plug 'dag/vim-fish'
Plug 'mhartington/formatter.nvim'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'cloudhead/neovim-fuzzy'
Plug 'kyazdani42/nvim-tree.lua'

" This must come after Plug
call plug#end()


" Formatter
lua << EOF
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
EOF


" Yanking
nmap Y y$


" DVORAK CUSTOMIZATIONS
" This has to be last for some reason.
" Cursor movement
:nnoremap <silent> s l
:nnoremap <silent> l s
:vnoremap <silent> s l
:vnoremap <silent> l s
" cursor movement through panes using [leader]-[dvorak movement keys]
nmap <silent> <leader>s <C-W>l
nmap <silent> <leader>h <C-W>h
nmap <silent> <leader>k <C-W>k
nmap <silent> <leader>j <C-W>j
" Moving panes using [leader]-[shift]-[dvorak movement keys]
nmap <silent> <leader><S-S> <C-W>L
nmap <silent> <leader><S-H> <C-W>H
nmap <silent> <leader><S-K> <C-W>K
nmap <silent> <leader><S-J> <C-W>J
