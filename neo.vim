"Remap leader to comma 
let mapleader = ","

"---------Vim-Plug--------------------
call plug#begin('~/.nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'yuki-ycino/fzf-preview.vim'
"Plug 'Shougo/deoplete.nvim'
"Plug 'padawan-php/deoplete-padawan', { 'do': 'composer install' }
"Plug 'deoplete-plugins/deoplete-jedi'
Plug 'machakann/vim-highlightedyank'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
"Plug 'dense-analysis/ale'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"color schemes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'rakr/vim-two-firewatch'
Plug 'suan/vim-instant-markdown', {'for': 'markdown'}
Plug 'sbdchd/neoformat'
Plug 'whatyouhide/vim-lengthmatters'
call plug#end()

let g:deoplete#enable_at_startup = 1

"--------------FZF--------------------
nmap <C-l> :Buffer <cr>
nmap <C-p> :Files <cr>


"--------------Behaviour modification----------
set hidden
set encoding=utf-8
set mouse=a
set termguicolors
set number
set tabstop=4
set smartindent
set relativenumber
set shiftwidth=4
set softtabstop=4
set inccommand=split
set syntax=on
let g:SuperTabDefaultCompletionType = "context"


"change auto suggestion background color
highlight Pmenu guibg=grey gui=bold

set undofile
set history=100
set undolevels=100
set undodir=~/.nvim/tmp/undo//
set backupdir=~/.nvim/tmp/backup//
set directory=~/.nvim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"

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

"Ultisnips settings
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"
let g:UltiSnipsSnippetDirectories=["/home/rojan/dotfiles/ultisnips/","/home/rojan/.vim/plugged/vim-snippets/UltiSnips/"]

"coc config
let g:coc_global_extensions = [
			\'coc-pairs',
			\'coc-python',
			\'coc-phpls'
			\]
inoremap <silent><expr> <c-space> coc#refresh()
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)
"coc -- END--
"
"-------------Vim Key binding------------------
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
noremap <silent><Leader>/ :nohls<CR>
"tab completion setting
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>\<cr>" : "\<cr>"
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
let g:lengthmatters_excluded=['unite', 'tagbar', 'startify', 'gundo',
			\'vimshell', 'w3m', 'nerdtree', 'help', 'qf', 'dirvish', 'vim',
			\'php']


"Don't lose selected lines
vnoremap < <gv
vnoremap > >gv

"Improve up/down movement on wrapped lines 
nnoremap j gj
nnoremap k gk

"Replace selected word
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>

"Find selected word
vnoremap <C-f> "hy:vimgrep "<C-r>h" **/*.* \| copen<left><left><left><left><left><left><left><left><left>