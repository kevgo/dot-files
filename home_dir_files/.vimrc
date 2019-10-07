set encoding=utf-8
scriptencoding utf-8
filetype plugin indent on


" Leader key
let g:mapleader = "\<space>"
noremap \ ,

set shell=/bin/bash


" Ag
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
nnoremap <leader>w :Ack! "\b<cword>\b" <CR>
nnoremap \\ :cclose<CR>


" Behavior
set number                        " show line numbers
set autoread                      " reload files when changed on disk, i.e. via `git checkout`
set autowrite
set nobackup                      " don't create backup files
set nowritebackup                 " don't create backup files
set noswapfile                    " don't create .swp files
set ignorecase smartcase          " ignore case in searched
set nocompatible                  " disable VI compatibility mode
set noautoindent
set nosmartindent
" set omnifunc=syntaxcomplete#Complete   " enable syntax completion
" set spell
" set spelllang=en_us             " set spell check language
set nowrap                        " disable word wrap.
set history=200
set hidden
set scrolloff=45                  " show context above/below cursorline
" set cursorline
" set cursorcolumn
set title                         " display filename in title bar
set ttyfast                       " faster scrolling
set backspace=indent,eol,start    " allow backspacing over everything in insert mode
set showmatch
set guicursor+=a:blinkon0         " Cursor blink


" Cucumber Tables
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let l:p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# l:p || getline(line('.')+1) =~# l:p)
    let l:column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let l:position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',l:column).'\s\{-\}'.repeat('.',l:position),'ce',line('.'))
  endif
endfunction


" Errors
set noerrorbells
set novisualbell
set t_vb=
set timeoutlen=500


" Golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = 'goimports'
let g:go_auto_sameids = 1
" let g:syntastic_go_checkers = ['golint', 'go vet']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = 'quickfix'
augroup vimrc
  autocmd FileType go nmap <leader>b  <Plug>(go-build)
  autocmd FileType go nmap <leader>r  <Plug>(go-run)
  autocmd FileType go set noexpandtab
  autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
  autocmd Filetype go command! -bang AV call go#alternate#Switch(<bang>0, 'vsplit')
  autocmd FileType go nmap <Leader>i <Plug>(go-info)
  autocmd FileType go nmap <C-\> :GoDef()<CR>
augroup END


" Indicator line at 80 col, greyed out area after 100 col.
" let &colorcolumn='80,'.join(range(101,299),',')


" Invisible characters.
set listchars=tab:»\ ,eol:¬,trail:⍽


" " NERDTree
map <silent> <leader>t :NERDTreeMirrorToggle<CR>
let g:NERDTreeIgnore=['.vim$', '\~$']
" let g:nerdtree_tabs_open_on_new_tab=0
" let g:nerdtree_tabs_synchronize_focus=0
let g:NERDTreeMapOpenSplit='s'
let g:NERDTreeMapOpenVSplit='v'
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'


" Inserting empty lines using [enter] when in normal mode.
map <S-Enter> O<Esc>
map <CR> o<Esc>k


" Insert spaces using space bar when in normal mode.
nnoremap <leader>n :noh<CR>
nnoremap <silent> <leader><space> i <ESC>


" Prettier
autocmd BufWritePre *.md,*.js,*.json,*.css,*.graphql Prettier


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


" Quick open files.
" nmap <leader>d :FZF<CR>


" Saving 
" CTRL-S
:noremap <c-s> <esc>:w<CR>
" ALT-S
:nnoremap <M-s> <esc>:w<CR>

" Searching
set hlsearch          "Highlight found searches
set incsearch
set smartcase
map <silent> <leader>/ :noh<CR>


" Split window resizing
nnoremap <silent> <Leader>= :exe "vertical resize +5"<CR>
nnoremap <silent> <Leader>- :exe "vertical resize -5"<CR>


" Syntax highlighting
syntax enable                     " enable syntax highlighting
" let g:syntastic_cucumber_checkers = []
" let g:ruby_operators = 1 " Enable highlighting of ruby operators


" Tabbing
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set smarttab


" TESTING
" - start "run-tests" in the terminal.
"   If you run this script in the background, the terminal remains usable
" - hit <leader>-F in a test file to run the whole test
" - hit <leader>-L in a test file to run the test file at the given line
" - hit <leader>-T to repeat the last test
nnoremap <leader>e :call TertestrialAll()<cr>
nnoremap <leader>f :call TertestrialFile()<cr>
nnoremap <leader>l :call TertestrialLine()<cr>
nnoremap <leader>o :call TertestrialRepeat()<cr>
nnoremap <leader>a :call TertestrialToggle()<cr>
nnoremap <leader>1 :call TertestrialSet(1)<cr>
nnoremap <leader>2 :call TertestrialSet(2)<cr>
nnoremap <leader>3 :call TertestrialSet(3)<cr>
nnoremap <leader>4 :call TertestrialSet(4)<cr>
nnoremap <leader>5 :call TertestrialSet(5)<cr>
nnoremap <leader>6 :call TertestrialSet(6)<cr>
nnoremap <leader>7 :call TertestrialSet(7)<cr>
nnoremap <leader>8 :call TertestrialSet(8)<cr>
nnoremap <leader>9 :call TertestrialSet(9)<cr>

" TypeScript
" if !exists("g:ycm_semantic_triggers")
"  let g:ycm_semantic_triggers = {}
" endif
" let g:ycm_semantic_triggers['typescript'] = ['.']


" Vundle
call plug#begin('~/.vim/plugged')
Plug 'gmarik/vundle'

" Plug 'FuzzyFinder'
" for FuzzyFinder
" Plug 'L9'
" Plug 'Valloric/YouCompleteMe'
" Plug 'alexdavid/vim-min-git-status'
Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'kevgo/tertestrial-vim'
Plug 'pangloss/vim-javascript'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-cucumber'
" " Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'
Plug 'fatih/vim-go'
Plug 'prettier/vim-prettier'

" This must come after Vundle
call plug#end()


" Colorscheme
" hi ColorColumn ctermbg=0 guibg=#000000
" hi CursorColumn ctermbg=255 guibg=#f4f4f4

" make sure you also change .gvimrc when changing this color!
" hi ColorColumn ctermbg=255 guibg=#f4f4f4


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


augroup vimrc
	autocmd BufWritePost * :call TertestrialFileSaved()
augroup END
