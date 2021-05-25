"Remap leader to comma 
let mapleader = ","

call plug#begin('~/.nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
Plug 'arcticicestudio/nord-vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'nvim-lua/lsp-status.nvim'
Plug 'adelarsq/neoline.vim'
"Plug 'ryanoasis/vim-devicons'
Plug 'adelarsq/neovcs.vim'
"Plug 'kyazdani42/nvim-web-devicons'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" If you want to display icons, then use one of these plugins:
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'preservim/tagbar'
Plug 'vim-php/tagbar-phpctags.vim'
Plug 'kabouzeid/nvim-lspinstall'
call plug#end()

"----- Color scheme ----"
let ayucolor="light"
colorscheme nord

"--------------FZF--------------------
"let g:fzf_files_options = {'source': 'rg --files'}
nmap <C-l> :Buffer <cr>
nnoremap <expr> <C-p> (len(system('git rev-parse')) ? ':Files' : ':GFiles --exclude-standard --others --cached')."\<cr>"

"--------------Behaviour modification----------
set hidden
set encoding=UTF-8
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
set undofile
set history=100
set undolevels=100
set undodir=~/.nvim/tmp/undo//
set backupdir=~/.nvim/tmp/backup//
set directory=~/.nvim/tmp/swap//
set backupskip=/tmp/*,/private/tmp/*"
"set colorcolumn=100
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%101v.\+/
"--------------Behaviour modification end----------

"Ultisnips settings
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:tagbar_phpctags_bin='~/.local/bin/phpctags'

"change auto suggestion background color
highlight Pmenu guibg=grey gui=bold

"------Keybindings-----
"Fugutive
noremap <leader>gs :Git<CR>
noremap <leader>gc :Git commit<CR>
"Don't lose selected lines
vnoremap < <gv
vnoremap > >gv
"Improve up/down movement on wrapped lines 
nnoremap j gj
nnoremap k gk
"Replace selected word
vnoremap <C-r> "hy:%s/<C-r>h//gc<left><left><left>
noremap <leader><space> :noh<CR>
nmap <leader>t :TagbarToggle<CR>
"------Keybindings end--------

"Lua plugins
luafile ~/.config/nvim/lua/plugins/compe-config.lua
luafile ~/.config/nvim/lua/plugins/python-ls.lua
luafile ~/.config/nvim/lua/plugins/php-ls.lua
luafile ~/.config/nvim/lua/plugins/status-lsp.lua
luafile ~/.config/nvim/lua/plugins/galaxy.lua
luafile ~/.config/nvim/lua/plugins/icons.lua
luafile ~/.config/nvim/lua/plugins/treesitter.lua
luafile ~/.config/nvim/lua/plugins/rust-ls.lua

" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction
