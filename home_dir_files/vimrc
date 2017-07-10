set shell=/bin/bash
" runtime macros/matchit.vim


" Appearance
if has("gui_running")
  set guioptions=egmrt        "Disable menu bar for gvim/macvim
  set guifont=Menlo:h12
endif


" Autocomplete
let g:ycm_min_num_of_chars_for_completion = 3
let g:ycm_min_num_identifier_candidate_chars = 6
let g:ycm_complete_in_comments = 1
let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
let g:ycm_collect_identifiers_from_tags_files = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_strings = 1


" Behavior
set number                        " Show line numbers
set autoread                      " reload files when changed on disk, i.e. via `git checkout`
set nobackup                      " don't create backup files
set nowritebackup                 " don't create backup files
set noswapfile                    " don't create .swp files
" set clipboard=unnamed           " yank and paste with the system clipboard
set ignorecase smartcase          " ignore case in searched
set nocompatible                  " disable VI compatibility mode
set noai                            " autoindent
set nosi                            " smart indent
set ofu=syntaxcomplete#Complete   " Enable syntax completion
set encoding=utf-8
" set spell
" set spelllang=en_us               " Set spell check language
set nowrap                        " Disable word wrap.
set history=200
set hidden
set scrolloff=45                  " show context above/below cursorline
set cursorline
set cursorcolumn
set title                         " Display filename in title bar
set ttyfast                       " Faster scrolling
set backspace=indent,eol,start    " allow backspacing over everything in insert mode

" Keep the VIM content displayed when exiting VIM
" set t_ti= t_te=


" CoffeeScript
let coffee_compile_vert = 1
au BufRead,BufNewFile *.cson set ft=coffee


" CTags:nnoremap <leader>bi :!ctags -R .<CR>
" ctrl-\ opens method under cursor in a new tab
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
" Automatically update CTags index on file save.
" au BufWritePost *.rb,*.js silent! !ctags -a -R --exclude=node_modules %
" au BufWritePost *.rb,*.js,*.coffee silent! !ctags -a % 2> /dev/null &


" Cucumber Tables
inoremap <silent> <Bar>   <Bar><Esc>:call <SID>align()<CR>a
function! s:align()
  let p = '^\s*|\s.*\s|\s*$'
  if exists(':Tabularize') && getline('.') =~# '^\s*|' && (getline(line('.')-1) =~# p || getline(line('.')+1) =~# p)
    let column = strlen(substitute(getline('.')[0:col('.')],'[^|]','','g'))
    let position = strlen(matchstr(getline('.')[0:col('.')],'.*|\s*\zs.*'))
    Tabularize/|/l1
    normal! 0
    call search(repeat('[^|]*|',column).'\s\{-\}'.repeat('.',position),'ce',line('.'))
  endif
endfunction


" Delete key
" nnoremap <BS> <Left><Del>


" Folding
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use
set visualbell          "no beeps on errors
" set tildeop


" Golang
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_fields = 1
let g:go_highlight_types = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_fmt_command = "goimports"
let g:syntastic_go_checkers = ['golint', 'go vet']
" let g:syntastic_mode_map = { 'mode': 'active', 'passive_filetypes': ['go'] }
let g:go_list_type = "quickfix"


" Indicator line at 80 col, greyed out area after 100 col.
let &colorcolumn="80,".join(range(101,299),",")


" Invisible characters.
set listchars=tab:»\ ,eol:¬,trail:⍽


" Leader key
let mapleader = "\<space>"
noremap \ ,


" Mouse and scrolling support.
set mouse=a


" Navigation
" nnoremap { :call JumpToPreviousFunction()<CR>
" nnoremap } :call JumpToNextFunction()<CR>



" " NERDTree
map <silent> <leader>t :NERDTreeMirrorToggle<CR>
let NERDTreeIgnore=['.vim$', '\~$']
let g:nerdtree_tabs_open_on_new_tab=0
let g:nerdtree_tabs_synchronize_focus=0
let g:NERDTreeMapOpenSplit="s"
let g:NERDTreeMapOpenVSplit="v"


" When pressing uu in insert mode
" :imap uu <Esc>


" Inserting empty lines using [enter] when in normal mode.
map <S-Enter> O<Esc>
map <CR> o<Esc>k


" Insert spaces using space bar when in normal mode.
nnoremap <leader>n :noh<CR>
nnoremap <silent> <leader><space> i <ESC>


" Previm
let g:previm_open_cmd="open -a Safari"


" Quick fix window, for example for Ack
nnoremap <D-]> :cnext<CR>
nnoremap <D-[> :cprevious<CR>
" nnoremap <C-D-]> :cnfile<CR>
" nnoremap <A-[> :cpfile<CR>
function! ReplaceAndGoToNext()
  :normal! .
  :cnext
endfunction
nnoremap <silent> <D-0> :call ReplaceAndGoToNext()<CR>



" Quick open files.
nmap <leader>d :FufFile**/<CR>
" nmap <leader>o :CommandT<CR>


" Saving
" Stripping Whitespace on save.
autocmd BufWritePre * :%s/\s\+$//e
set autowriteall


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
let g:syntastic_cucumber_checkers = []
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


" Vundle
filetype off   " important
set rtp+=~/Dropbox/vim/bundle/vundle/
call vundle#rc()
Bundle 'gmarik/vundle'

" OLD AUTOCOMPLETE
" Bundle 'AutoComplPop'
" Bundle 'Shougo/neocomplete'
" Bundle 'tsaleh/vim-supertab'

Bundle 'FuzzyFinder'
" for FuzzyFinder
Bundle 'L9'
Bundle 'Valloric/YouCompleteMe'
" Bundle 'alexdavid/vim-min-git-status'
" Bundle 'bruno-/vim-husk'
Bundle 'dag/vim-fish'
Bundle 'digitaltoad/vim-jade'
Plugin 'elixir-lang/vim-elixir'
Bundle 'godlygeek/tabular'
Bundle 'gkz/vim-ls'
Bundle 'jistr/vim-nerdtree-tabs'
Bundle 'kchmck/vim-coffee-script'
" Bundle 'kevgo/jumbo'
Bundle 'kevgo/tertestrial-vim'
Bundle 'michaeljsmith/vim-indent-object'
" Bundle 'mileszs/ack.vim'
Bundle 'pangloss/vim-javascript'
Bundle 'rking/ag.vim'
Bundle 'scrooloose/nerdtree'
Bundle 'scrooloose/syntastic'
Bundle 'slim-template/vim-slim'
Bundle 'tomtom/tcomment_vim'
" Bundle 'tpope/vim-bundler'
Bundle 'tpope/vim-cucumber'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-fugitive'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-markdown'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-repeat'
Bundle 'tpope/vim-surround'
Bundle 'vim-ruby/vim-ruby'
Bundle 'kien/rainbow_parentheses.vim'
Bundle 'lukaszkorecki/CoffeeTags'
Bundle 'fatih/vim-go'
" Bundle 'Raimondi/delimitMate'
Bundle 'junegunn/goyo.vim'
Bundle 'junegunn/limelight.vim'
" Bundle 'itchyny/vim-cursorword'
Bundle 'kannokanno/previm'



" Colors
" Bundle 'altercation/vim-colors-solarized'
"
" map gs :Gministatus<CR>

" This must come after Vundle
filetype plugin indent on


" Colorscheme
" highlight ColorColumn ctermbg=235 guibg=#2c2d27
set background=light
let g:solarized_termcolors=256
let g:solarized_visibility = 'low'
" colorscheme solarized
" call togglebg#map("<F5>")


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
nmap <silent> <leader>s :exe "setlocal nocursorline"<CR>:exe "setlocal nocursorcolumn"<CR><C-W>l:exe "setlocal cursorline"<CR>:exe "setlocal cursorcolumn"<CR>
nmap <silent> <leader>h :exe "setlocal nocursorline"<CR>:exe "setlocal nocursorcolumn"<CR><C-W>h:exe "setlocal cursorline"<CR>:exe "setlocal cursorcolumn"<CR>
nmap <silent> <leader>k :exe "setlocal nocursorline"<CR>:exe "setlocal nocursorcolumn"<CR><C-W>k:exe "setlocal cursorline"<CR>:exe "setlocal cursorcolumn"<CR>
nmap <silent> <leader>j :exe "setlocal nocursorline"<CR>:exe "setlocal nocursorcolumn"<CR><C-W>j:exe "setlocal cursorline"<CR>:exe "setlocal cursorcolumn"<CR>
" Moving panes using [leader]-[shift]-[dvorak movement keys]
nmap <silent> <leader><S-S> <C-W>L
nmap <silent> <leader><S-H> <C-W>H
nmap <silent> <leader><S-K> <C-W>K
nmap <silent> <leader><S-J> <C-W>J


" Duplicating lines.
nnoremap <silent> <D-d> yyp
imap <silent> <D-d> <esc>yypi


" Moving lines up/down using [apple]-[shift]-[up]/[down].
nmap <silent> <D-S-down> ddp==
nmap <silent> <D-S-up> ddkP==
imap <silent> <D-S-down> <esc>ddp==i
imap <silent> <D-S-up> <esc>ddkP==i


" Autocomplete
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#min_keyword_length = 5
let g:neocomplete#sources#syntax#min_keyword_length = 5


" Enter normal mode on file save.
if has("gui_running")
  iunmenu File.Save
  imenu <silent> File.Save <Esc>:w<CR>
endif

autocmd BufWritePost * :call TertestrialFileSaved()
