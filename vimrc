"Use Vim settings, rather then Vi settings (much better!).
"This must be first, because it changes other options as a side effect.
set nocompatible
"
" --------------------------------------------------------------------
" VIM Settings
" --------------------------------------------------------------------
"
"Clipboard setting for OSX
set clipboard=unnamed
"Clipboard setting for Ubuntu
"set clipboard=unnamedplus

let mapleader = "," "change the mapleader from \ to ,
set ruler           "Show the cursor position all the time

" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp

set ignorecase
set smartcase " Make searches case-sensitive only if they contain upper-case characters

set backspace=indent,eol,start "allow backspacing over everything in insert mode
set history=1000 "store lots of :cmdline history

set showcmd      "show incomplete cmds down the bottom
set showmode     "show current mode down the bottom

set incsearch    "find the next match as we type the search
set hlsearch     "hilight searches by default
set number       "add line numbers

set virtualedit=block "This will let you move around the screen freely while in visual

set showbreak=...
set wrap linebreak nolist
set formatoptions=qrn1
set colorcolumn=81
set linespace=4         "add some line space for easy reading

set visualbell t_vb=    "disable visual bell

"indent settings
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent

"hide buffers when not displayed
set hidden

"load ftplugins and indent files
filetype plugin on
filetype indent on

" --------------------------------------------------------------------
" Vundle
" --------------------------------------------------------------------
"
" required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

Plugin 'gmarik/vundle'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-git'
Plugin 'vim-scripts/grep.vim'
Plugin 'tpope/vim-haml'
Plugin 'othree/html5.vim'
Plugin 'digitaltoad/vim-jade'
Plugin 'kana/vim-fakeclip'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'othree/yajs.vim'
"Plugin 'jelera/vim-javascript-syntax'
Plugin 'vim-scripts/JavaScript-Indent'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-surround'
Plugin 'Shutnik/jshint2.vim'
Plugin 'jiangmiao/auto-pairs'
Plugin 'jlanzarotta/bufexplorer'
Plugin 'XadillaX/json-formatter.vim'
Plugin 'alvan/vim-closetag'
Plugin 'scrooloose/syntastic'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" --------------------------------------------------------------------
" Statusline
" --------------------------------------------------------------------

set statusline=%f       "tail of the filename
set statusline+=%{fugitive#statusline()} "Git
set statusline+=%=      "left/right separator
set statusline+=%c,     "cursor column
set statusline+=%l/%L   "cursor line/total lines
set statusline+=\ %P    "percent through file
set statusline+=%#warningmsg# "syntastic
set statusline+=%{SyntasticStatuslineFlag()} "syntastic
set statusline+=%* "syntastic
set laststatus=2

" --------------------------------------------------------------------
" GUI
" --------------------------------------------------------------------

set guioptions-=T "turn off needless toolbar on gvim/mvim
set guioptions-=L "turn off scrollbars

"vertical/horizontal scroll off settings
set scrolloff=3
set sidescrolloff=7
set sidescroll=1

"some stuff to get the mouse going in term
set mouse=a
set ttymouse=xterm2

syntax on "turn on syntax highlighting

"Syntastic
"mark syntax errors with :signs
let g:syntastic_enable_signs=1
let g:syntastic_javascript_checkers=['eslint']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

"avoiding annoying CSApprox warning message
let g:CSApprox_verbose_level = 0

if has("gui_running")
    set t_Co=256
    colorscheme solarized
    set background=dark
    set guitablabel=%M%t
    set lines=40
    set columns=115
else
    "dont load csapprox if there is no gui support - silences an annoying warning
    let g:CSApprox_loaded = 1
    autocmd InsertEnter,InsertLeave * set cul!
    set t_Co=256
    let g:solarized_termcolors=256
    let base16colorspace=256
    set background=dark
    colorscheme railscasts
endif

" --------------------------------------------------------------------
" Key Mappings
" --------------------------------------------------------------------

" Open last buffer
noremap <Leader><Leader> <C-^>

"make <c-l> clear the highlight as well as redraw
nnoremap <leader>n :nohls<CR><C-L>
inoremap <C-L> <C-O>:nohls<CR>

"make Y consistent with C and D
nnoremap Y y$

"key mapping for window navigation
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

"key mapping for saving file
nmap <C-s> :w<CR>

nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>

"try to make possible to navigate within lines of wrapped lines
"nmap <j> gj
"nmap <k> gk
nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k

"ESC is too far
inoremap jj <Esc>

"Get rid of help key
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"Select last paste
nnoremap <leader>v V`]

"Paste last yanked text
map <c-p> "0p

" Command-/ to toggle comments
map <leader>/ <plug>NERDCommenterToggle<CR>
imap <leader>/ <Esc><plug>NERDCommenterToggle<CR>i

" Highlight word at cursor without changing position
nnoremap <leader>h *<C-O>
" Highlight word at cursor and then Ack it.
nnoremap <leader>H *<C-O>:AckFromSearch!<CR>

let NERDSpaceDelims=1

" --------------------------------------------------------------------
" NERDTree
" --------------------------------------------------------------------

if exists("loaded_nerd_tree")
  autocmd VimEnter * call s:CdIfDirectory(expand("<amatch>"))
  autocmd FocusGained * call s:UpdateNERDTree()
  autocmd WinEnter * call s:CloseIfOnlyNerdTreeLeft()
endif

" Close all open buffers on entering a window if the only
" buffer that's left is the NERDTree buffer
function s:CloseIfOnlyNerdTreeLeft()
  if exists("t:NERDTreeBufName")
    if bufwinnr(t:NERDTreeBufName) != -1
      if winnr("$") == 1
        q
      endif
    endif
  endif
endfunction

" If the parameter is a directory, cd into it
function s:CdIfDirectory(directory)
  let explicitDirectory = isdirectory(a:directory)
  let directory = explicitDirectory || empty(a:directory)

  if explicitDirectory
    exe "cd " . fnameescape(a:directory)
  endif

  " Allows reading from stdin
  " ex: git diff | mvim -R -
  if strlen(a:directory) == 0
    return
  endif

  if directory
    NERDTree
    wincmd p
    bd
  endif

  if explicitDirectory
    wincmd p
  endif
endfunction

silent! nmap <silent> <Leader>p :NERDTreeToggle<CR>
nmap <C-f> :NERDTreeFind<CR>

let NERDTreeIgnore=['\.swp$']

" --------------------------------------------------------------------
" CtrlP
" --------------------------------------------------------------------

set runtimepath^=~/.vim/bundle/ctrlp.vim
let g:ctrlp_map = '<leader>t'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](source_maps)$',
  \ 'file': '\v\.(map)$',
  \ }

" --------------------------------------------------------------------
" White space
" --------------------------------------------------------------------

" Strip trailing whitespace
function! <SID>StripTrailingWhitespaces()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " Do the business:
    %s/\s\+$//e
    " Clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunction
autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" --------------------------------------------------------------------
" Run Tests
" --------------------------------------------------------------------
" Stolen from Gary Bernhardt

function! RunTests(filename)
    " Write the file and run tests for the given filename
    :w
    :silent !echo;echo;echo;echo;echo;echo;echo;echo;echo;echo
    if match(a:filename, '\.feature$') != -1
        exec ":!bundle exec cucumber " . a:filename
    else
        if filereadable("script/test")
            exec ":!script/test " . a:filename
        else
            exec ":!bundle exec rspec --no-color " . a:filename
        end
    end
endfunction

function! SetTestFile()
    " Set the spec file that tests will be run for.
    let t:grb_test_file=@%
endfunction

function! RunTestFile(...)
    if a:0
        let command_suffix = a:1
    else
        let command_suffix = ""
    endif

    " Run the tests for the previously-marked file.
    let in_test_file = match(expand("%"), '\(.feature\|_spec.rb\)$') != -1
    if in_test_file
        call SetTestFile()
    elseif !exists("t:grb_test_file")
        return
    end
    call RunTests(t:grb_test_file . command_suffix)
endfunction

function! RunNearestTest()
    let spec_line_number = line('.')
    call RunTestFile(":" . spec_line_number)
endfunction

"run test key bindings
map <leader>r :call RunTestFile()<cr>
map <leader>R :call RunNearestTest()<cr>
map <leader>a :call RunTests('')<cr>

"use :A to jump to matching jasmine spec
autocmd User Rails/app/assets/javascripts/* let b:rails_alternate = 'spec/javascripts/' . rails#buffer().name()[23:-11] . '_spec.js.coffee'
autocmd User Rails/spec/javascripts/* let b:rails_alternate = 'app/assets/javascripts/' . rails#buffer().name()[17:-16] . '.js.coffee'

" --------------------------------------------------------------------
" EasyMotion - https://github.com/easymotion/vim-easymotion
" --------------------------------------------------------------------

"change easymotion start key
let g:EasyMotion_leader_key = '<space>'
hi link EasyMotionTarget ErrorMsg
hi EasyMotionShade  ctermfg=grey

" --------------------------------------------------------------------
" JSHint2
" --------------------------------------------------------------------

let jshint2_toggle = 0

" --------------------------------------------------------------------
" Ack.vim
" --------------------------------------------------------------------

"use Silver Searcher if it's available
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" --------------------------------------------------------------------
" Ack.vim
" --------------------------------------------------------------------

let g:closetag_filenames = "*.erb,*.html,*.xhtml,*.phtml"
