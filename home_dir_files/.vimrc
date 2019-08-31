set encoding=utf-8
scriptencoding utf-8
filetype plugin indent on

" NOTE: commented out because this is slow on Windows
" let s:uname = system("uname")
" if s:uname == "Darwin\n"
"   if has('python3')
"       command! -nargs=1 Py py3 <args>
"       set pythonthreedll=/usr/local/Frameworks/Python.framework/Versions/3.6/Python
"       set pythonthreehome=/usr/local/Frameworks/Python.framework/Versions/3.6
"   else
"       command! -nargs=1 Py py <args>
"       set pythondll=/usr/local/Frameworks/Python.framework/Versions/2.7/Python
"       set pythonhome=/usr/local/Frameworks/Python.framework/Versions/2.7
"   endif
" else
"   set clipboard=unnamedplus         " yank and paste with the system clipboard
" endif


" Leader key
let g:mapleader = "\<space>"
noremap \ ,

set shell=/bin/bash
" runtime macros/matchit.vim


" Ag
let g:ackprg = 'ag --vimgrep --smart-case'
cnoreabbrev ag Ack
cnoreabbrev Ag Ack
cnoreabbrev AG Ack
nnoremap <leader>w :Ack! "\b<cword>\b" <CR>
nnoremap \\ :cclose<CR>


" ALE
" autocmd bufwritepost *.js silent !standard --fix %
" autocmd bufwritepost *.md silent !prettier --write %

" NOTE: cannot use standard as a linter here
"       because it cannot handle Flow files correctly
" let g:ale_linters = {
" \   'javascript': ['flow', 'standard'],
" \   'cucumber': []
" \}
" let g:ale_fixers = {
" \   'javascript': ['prettier_standard'],
" \   'markdown': []
" \}
" let g:ale_fix_on_save = 1
" let g:ale_javascript_prettier_use_local_config = 1
" let g:ale_lint_on_insert_leave = 1
" let g:ale_lint_on_text_changed = 'never'       " before was 'normal'
" let g:ale_lint_delay = 0                       " default is 200
" let g:ale_lint_on_enter = 1                    " lint when loading files


" Appearance
if has('gui_running')
  set guioptions-=T        " remove toolbar
  set guioptions-=m        " remove menu bar
  set guioptions-=L        " remove left-hand scrollbar
  " set guifont=Menlo:h12
endif


" Autocomplete
" let g:ycm_min_num_of_chars_for_completion = 3
" let g:ycm_min_num_identifier_candidate_chars = 6
" let g:ycm_complete_in_comments = 1
" let g:ycm_complete_in_strings = 1
" let g:ycm_key_list_select_completion = ['<TAB>', '<Down>']
" let g:ycm_collect_identifiers_from_tags_files = 1
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_autoclose_preview_window_after_completion = 1
" let g:ycm_enable_diagnostic_signs = 0
" let g:ycm_enable_diagnostic_highlighting = 0
" let g:ycm_echo_current_diagnostic = 0
" set completeopt=menu


" Behavior
set number                        " show line numbers
set autoread                      " reload files when changed on disk, i.e. via `git checkout`
set autowrite
set nobackup                      " don't create backup files
set nowritebackup                 " don't create backup files
set noswapfile                    " don't create .swp files
set ignorecase smartcase          " ignore case in searched
" set nocompatible                  " disable VI compatibility mode
set noautoindent
set nosmartindent
" set omnifunc=syntaxcomplete#Complete   " enable syntax completion
" set spell
" set spelllang=en_us             " set spell check language
set nowrap                        " disable word wrap.
set history=200
set hidden
set scrolloff=45                  " show context above/below cursorline
set cursorline
" set cursorcolumn
set title                         " display filename in title bar
set ttyfast                       " faster scrolling
set backspace=indent,eol,start    " allow backspacing over everything in insert mode
set showmatch

" Keep the VIM content displayed when exiting VIM
" set t_ti= t_te=


" Cursor blink
set guicursor+=a:blinkon0

" CTags:nnoremap <leader>bi :!ctags -R .<CR>
" ctrl-\ opens method under cursor in a new tab
" Automatically update CTags index on file save.
" au BufWritePost *.rb,*.js silent! !ctags -a -R --exclude=node_modules %
" au BufWritePost *.rb,*.js,*.coffee silent! !ctags -a % 2> /dev/null &


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
if has('gui_macvim')
	augroup vimrc
		autocmd GUIEnter * set vb t_vb=
	augroup END
endif


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


" Mouse and scrolling support.
set mouse=a


" Navigation
" nnoremap { :call JumpToPreviousFunction()<CR>
" nnoremap } :call JumpToNextFunction()<CR>


" " NERDTree
map <silent> <leader>t :NERDTreeMirrorToggle<CR>
let g:NERDTreeIgnore=['.vim$', '\~$']
let g:nerdtree_tabs_open_on_new_tab=0
let g:nerdtree_tabs_synchronize_focus=0
let g:NERDTreeMapOpenSplit='s'
let g:NERDTreeMapOpenVSplit='v'
let g:NERDTreeDirArrowExpandable = '+'
let g:NERDTreeDirArrowCollapsible = '-'

function! IsNERDTreeOpen()
  return exists('t:NERDTreeBufName') && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind if NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
" augroup vimrc
" 	autocmd BufEnter * call SyncTree()
" augroup END


" Inserting empty lines using [enter] when in normal mode.
map <S-Enter> O<Esc>
map <CR> o<Esc>k


" Insert spaces using space bar when in normal mode.
nnoremap <leader>n :noh<CR>
nnoremap <silent> <leader><space> i <ESC>


" Previm
" let g:previm_open_cmd='open -a Safari'


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

" if !exists('g:escape_mapped')  " Only need to set the mapping up once.
"   augroup escape_mapping
"     autocmd!
"     " Create the autocommand, to fire when Insert mode is entered
"     autocmd InsertEnter * call s:setupEscapeMap()
"   augroup END
" endif
"
" function! s:setupEscapeMap()
"   " Actually create the mapping
"   nnoremap <C-[> :cprevious<CR>
"
"   " Now the map exists, so we won't ever need the autocommand again.
"   let g:escape_mapped = 1
"
"   " Tidy up the autocommand and group
"   " autocmd! escape_mapping InsertEnter *
"   " augroup! escape_mapping
" endfunction


" Quick open files.
" nmap <leader>d :FZF<CR>


" Saving
" Stripping Whitespace on save.
augroup vimrc
	autocmd BufWritePre * :%s/\s\+$//e
augroup END
set autowriteall

" Saving in GVim
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

" UltiSnips
" let g:UltiSnipsSnippetsDir='~/.config/ultisnips'
" let g:UltiSnipsExpandTrigger='<C-h>'
" let g:UltiSnipsJumpForwardTrigger='<C-h>'
" let g:UltiSnipsJumpBackwardTrigger='<C-k>'


" Vundle
call plug#begin('~/.vim/plugged')
Plug 'gmarik/vundle'

" Plug 'FuzzyFinder'
" for FuzzyFinder
" Plug 'L9'
" Plug 'SirVer/ultisnips'
" Plug 'Valloric/YouCompleteMe'
" Plug 'alexdavid/vim-min-git-status'
" Plug 'bruno-/vim-husk'
" Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
" Plug 'gkz/vim-ls'
Plug 'jistr/vim-nerdtree-tabs'
" Plug 'kevgo/jumbo'
Plug 'kevgo/tertestrial-vim'
" Plug 'michaeljsmith/vim-indent-object'
" Plug 'mileszs/ack.vim'
Plug 'pangloss/vim-javascript'
Plug 'mileszs/ack.vim'
Plug 'scrooloose/nerdtree'
" Plug 'w0rp/ale'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-cucumber'
" Plug 'tpope/vim-endwise'
" Plug 'tpope/vim-fugitive'
" " Plug 'tpope/vim-markdown'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'leafgarland/typescript-vim'
" Plug 'fatih/vim-go'
" Plug 'Raimondi/delimitMate'
" Plug 'junegunn/goyo.vim'
" Plug 'junegunn/limelight.vim'
" Plug 'itchyny/vim-cursorword'
" Plug 'kannokanno/previm'
" Plug '/usr/local/opt/fzf'
" Plug 'junegunn/fzf.vim'
" Plug 'tpope/vim-sleuth'
" Plug 'nathanaelkane/vim-indent-guides' is too slow when scrolling
" Plug 'HerringtonDarkholme/yats'

" Colors
" Plug 'altercation/vim-colors-solarized'
"
" map gs :Gministatus<CR>

" This must come after Vundle
call plug#end()


" Colorscheme
" hi ColorColumn ctermbg=0 guibg=#000000
" hi CursorColumn ctermbg=255 guibg=#f4f4f4

" make sure you also change .gvimrc when changing this color!
" hi ColorColumn ctermbg=255 guibg=#f4f4f4

" set background=light
" let g:solarized_termcolors=256
" let g:solarized_visibility = 'low'
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
" let g:neocomplete#enable_at_startup = 1
" let g:neocomplete#enable_smart_case = 1
" let g:neocomplete#min_keyword_length = 5
" let g:neocomplete#sources#syntax#min_keyword_length = 5


" Enter normal mode on file save.
if has('gui_running')
  iunmenu File.Save
  imenu <silent> File.Save <Esc>:w<CR>
endif

augroup vimrc
	autocmd BufWritePost * :call TertestrialFileSaved()
augroup END
