"Remap leader to comma 
let mapleader = ","

"Plugins
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/syntastic'
Plug 'vim-scripts/taglist.vim'
Plug 'fholgado/minibufexpl.vim'
Plug 'gregsexton/MatchTag'
Plug 'altercation/vim-colors-solarized'
Plug 'hynek/vim-python-pep8-indent'
Plug 'tpope/vim-surround'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'kien/ctrlp.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'shawncplus/phpcomplete.vim'
Plug 'bling/vim-airline'
Plug 'sjl/gundo.vim'
Plug 'axiaoxin/vim-json-line-format'
Plug 'godlygeek/tabular'
Plug 'xolox/vim-session' | Plug 'xolox/vim-misc'
Plug 'sickill/vim-pasta'
Plug '~/.vim/plugin/'
Plug 'jmcantrell/vim-virtualenv'
Plug 'morhetz/gruvbox'

function! BuildYCM(info)
  " info is a dictionary with 3 fields
  " - name:   name of the plugin
  " - status: 'installed', 'updated', or 'unchanged'
  " - force:  set on PlugInstall! or PlugUpdate!
  if a:info.status == 'installed' || a:info.force
    !./install.sh
  endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM') }
call plug#end()

""""""""""""""""""""""""""""""""""
" Vim Settings                   "
""""""""""""""""""""""""""""""""""
set relativenumber
set ignorecase
set smartcase
set t_Co=256
set background=light
set laststatus=2
"4 space for tab"
set smartindent
set tabstop=4
set shiftwidth=4
set expandtab
set wildignore=*.swp,*.bak,*.pyc,*.jar,*.gif,*.png,*.jpg
set number
set wrap
set foldmethod=manual
filetype plugin on
filetype indent on
syntax enable
let html_no_rendering=1
"map sort function to a key
vnoremap <leader>s :sort<CR>
"Set colorcolumn to 80
set colorcolumn=80
highlight ColorColumn ctermbg=lightgrey
set incsearch
set showmatch
" highlight search text - get rid of highlight :noh
set hlsearch
colorscheme gruvbox
"In xterm, set the name of the current file as title 
set title
set tags=.tags,$VIRTUAL_ENV/.tags;/
set backup
"completion popup doesn’t select first item and typing new letters updates the completion list.
set completeopt=menuone,longest,preview
set undofile
set history=100
set undolevels=100
set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"

"""""""""""""""""""""""""""""""""""
" Key bindings                    "
"""""""""""""""""""""""""""""""""""
"Don't lose selected lines
vnoremap < <gv
vnoremap > >gv
noremap <silent><Leader>/ :nohls<CR>
"find and replace selected text
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
vnoremap <C-f> "hy:vimgrep "<C-r>h" **/*.* \| copen<left><left><left><left><left><left><left><left><left>
" Auto indent after pasting 
nnoremap <leader>p p
nnoremap <leader>P P
nnoremap p p'[v']=
nnoremap P P'[v']=
"The Smash Escape 
inoremap jj <Esc>
"Insert blank lines without going into insert mode 
nmap t o<ESC>k
nmap T O<ESC>j
"Improve up/down movement on wrapped lines 
nnoremap j gj
nnoremap k gk
nmap <F12> :!ctags -f $VIRTUAL_ENV/.tags -R $VIRTUAL_ENV/lib/python2.7/site-packages /home/rojan/.virtualenvs/mysite &> /dev/null & disown<CR>

""""""""""""""""""""""""""""""""""""
" Other settings                   "
""""""""""""""""""""""""""""""""""""

"if you prefer the Omni-Completion tip window to close when a selection is
" made, these lines close it on movement in insert mode or when leaving
" " insert mode
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

let g:jedi#popup_on_dot = 1
let g:EclimCompletionMethod = 'omnifunc'
autocmd FileType php map <buffer> <C-]> :PhpSearch<cr>
"python import pysmell
"autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
"autocmd FileType php set omnifunc=phpcomplete#CompletePHP
"set complete-=i
"omni auto complete {
set ofu=syntaxcomplete#Complete
"}

"Tag list (Tlist) show tags of current buffer
let Tlist_Show_One_File = 1
"Tag list (Tlist) open list in right window
let Tlist_Use_Right_Window = 1
let g:SuperTabDefaultCompletionType = "context"

" to toggle the file browser
noremap <silent><leader>] :NERDTreeToggle<cr>
"Ignore .pyc file
let NERDTreeIgnore = ['\.pyc$']

"""""""""""""""""""""""""""""""""""
"Tabular settings                  "
"""""""""""""""""""""""""""""""""""
if exists(":Tabularize")
  nmap <Leader>a= :Tabularize /=<CR>
  vmap <Leader>a= :Tabularize /=<CR>
  nmap <Leader>a: :Tabularize /:\zs<CR>
  vmap <Leader>a: :Tabularize /:\zs<CR>
endif

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

"Escape from command-t list
"let g:CommandTCancelMap=['<ESC>','<C-c>']

"Load Django autocompletion.
" arg1 - name of project 
function! LoadDjango(arg1)
py << EOF
import os.path
import sys
import vim

DJANGO_SETTINGS_MODULE=vim.eval("a:arg1") + '.settings'
print DJANGO_SETTINGS_MODULE
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
    os.environ['DJANGO_SETTINGS_MODULE'] = DJANGO_SETTINGS_MODULE
EOF
endfunction
"End of LoadDjango function

"Ultisnips settings
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["../dotfiles/ultisnips/","plugged/vim-snippets/UltiSnips/"]

" airline settings
let g:airline_powerline_fonts = 1
if !exists("g:airline_symbols")
  let g:airline_symbols = {}
endif
let g:airline_theme="powerlineish"
let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message  =  "no .git"
let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter

""""""""""""""""""""""""""""
" Vim Session Settings     "
""""""""""""""""""""""""""""
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession 
nnoremap <leader>ss :SaveSession 
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>
