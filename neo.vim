"Remap leader to comma 
let mapleader = ","

"---------Vim-Plug--------------------
call plug#begin('~/.nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'machakann/vim-highlightedyank'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'

"color schemes
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ayu-theme/ayu-vim'
Plug 'arcticicestudio/nord-vim'

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
"set termguicolors
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
" ------------------- coc.nvim configuration --------------------
" if hidden is not set, TextEdit might fail.
set hidden

" Some servers have issues with backup files, see #649
set nobackup
set nowritebackup

" Better display for messages
set cmdheight=2

" Smaller updatetime for CursorHold & CursorHoldI
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[c` and `]c` to navigate diagnostics
nmap <silent> [c <Plug>(coc-diagnostic-prev)
nmap <silent> ]c <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" Remap for format selected region
vmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
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
			\'php', 'json', 'csv']


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

colorscheme nord
