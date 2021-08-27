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


" Prettier-vim
" autocmd BufWritePre *.md,*.js,*.json,*.css,*.graphql,*.ts,*.yml FormatWrite


" Quick fix window, for example for Ack
nnoremap <A-]> :cnext<CR>
nnoremap <D-]> :cnext<CR>
nnoremap <A-[> :cprevious<CR>
nnoremap <D-[> :cprevious<CR>
" nnoremap <C-D-]> :cnfile<CR>
" nnoremap <A-[> :cpfile<CR>
function! ReplaceAndGoToNext()
  :normal! .
  :cnext
endfunction
nnoremap <silent> <A-0> :call ReplaceAndGoToNext()<CR>
nnoremap <silent> <D-0> :call ReplaceAndGoToNext()<CR>


" Saving
" CTRL-S
:noremap <c-s> <esc>:w<CR>
augroup FormatAutogroup
  autocmd!
  autocmd BufWritePost *.md,*.ts FormatWrite
augroup END


" Searching
map <silent> <leader>/ :noh<CR>


" Split window resizing
nnoremap <silent> <Leader>= :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>- :exe "vertical resize -5"<CR>


" Tabbing
set softtabstop=2
set shiftwidth=2
set expandtab
nnoremap <C-T> <esc>:tabnext<CR>

" TESTING
" - start "run-tests" in the terminal.
"   If you run this script in the background, the terminal remains usable
" - hit <leader>-F in a test file to run the whole test
" - hit <leader>-L in a test file to run the test file at the given line
" - hit <leader>-T to repeat the last test
" nnoremap <leader>e :call TertestrialAll()<cr>
" nnoremap <leader>f :call TertestrialFile()<cr>
" nnoremap <leader>l :call TertestrialLine()<cr>
" nnoremap <leader>o :call TertestrialRepeat()<cr>
" nnoremap <leader>a :call TertestrialToggle()<cr>
" nnoremap <leader>1 :call TertestrialSet(1)<cr>
" nnoremap <leader>2 :call TertestrialSet(2)<cr>
" nnoremap <leader>3 :call TertestrialSet(3)<cr>
" nnoremap <leader>4 :call TertestrialSet(4)<cr>
" nnoremap <leader>5 :call TertestrialSet(5)<cr>
" nnoremap <leader>6 :call TertestrialSet(6)<cr>
" nnoremap <leader>7 :call TertestrialSet(7)<cr>
" nnoremap <leader>8 :call TertestrialSet(8)<cr>
" nnoremap <leader>9 :call TertestrialSet(9)<cr>


" Plug
call plug#begin(stdpath('data') . '/plugged')

" Plug 'Valloric/YouCompleteMe'
Plug 'dag/vim-fish'
" Plug 'godlygeek/tabular'
" Plug 'jistr/vim-nerdtree-tabs'
" Plug 'kevgo/tertestrial-vim'
" Plug 'pangloss/vim-javascript'
" Plug 'scrooloose/nerdtree'
Plug 'mhartington/formatter.nvim'
Plug 'tomtom/tcomment_vim'
" Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
" Plug 'leafgarland/typescript-vim'
" Plug 'fatih/vim-go'
" Plug 'prettier/vim-prettier'
" Plug 'dense-analysis/ale'
Plug 'cloudhead/neovim-fuzzy'
" Plug 'kyazdani42/nvim-web-devicons' " for file icons
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


" augroup vimrc
" 	autocmd BufWritePost * :call TertestrialFileSaved()
" augroup END
