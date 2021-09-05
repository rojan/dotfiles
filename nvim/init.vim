"Remap leader to comma
"let mapleader = ","

call plug#begin('~/.nvim/plugged')
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neovim/nvim-lspconfig'
Plug 'glepnir/lspsaga.nvim'
Plug 'hrsh7th/nvim-compe'
Plug 'arcticicestudio/nord-vim'
Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'nvim-lua/lsp-status.nvim'
"Plug 'ryanoasis/vim-devicons'
Plug 'adelarsq/neovcs.vim'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
" If you want to display icons, then use one of these plugins:
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
Plug 'preservim/nerdcommenter'
Plug 'jiangmiao/auto-pairs'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'preservim/tagbar'
Plug 'vim-php/tagbar-phpctags.vim'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'dense-analysis/ale'
Plug 'folke/zen-mode.nvim'
Plug 'TimUntersberger/neogit'
"Neogit depends on this plugn
Plug 'nvim-lua/plenary.nvim'
Plug 'Yggdroot/indentLine'
call plug#end()

"----- Color scheme ----"
let ayucolor="light"
colorscheme tokyonight

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
set expandtab       " Expand TABs to spaces
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
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%101v.\+/
"--------------Behaviour modification end----------

"Ultisnips settings
let g:UltiSnipsExpandTrigger="<c-j>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

let g:tagbar_phpctags_bin='~/.local/bin/phpctags'

"change auto suggestion background color
highlight Pmenu guibg=grey gui=bold

"Lua plugins
luafile ~/.config/nvim/lua/plugins/compe-config.lua
luafile ~/.config/nvim/lua/plugins/python-ls.lua
luafile ~/.config/nvim/lua/plugins/php-ls.lua
luafile ~/.config/nvim/lua/plugins/status-lsp.lua
luafile ~/.config/nvim/lua/plugins/galaxy.lua
luafile ~/.config/nvim/lua/plugins/icons.lua
luafile ~/.config/nvim/lua/plugins/treesitter.lua
luafile ~/.config/nvim/lua/plugins/rust-ls.lua
luafile ~/.config/nvim/lua/plugins/javascript-ls.lua
luafile ~/.config/nvim/lua/plugins/lspsaga.lua
luafile ~/.config/nvim/lua/plugins/zen-mod.lua

" Statusline
function! LspStatus() abort
  if luaeval('#vim.lsp.buf_get_clients() > 0')
    return luaeval("require('lsp-status').status()")
  endif

  return ''
endfunction


" disable linting while typing
"let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_open_list = 1
let g:ale_keep_list_window_open=0
let g:ale_set_quickfix=0
let g:ale_list_window_size = 10
let g:ale_php_phpcbf_standard='PSR12'
let g:ale_php_phpcs_standard="~/dotfiles/phpcs.xml"
let g:ale_php_cs_fixer_options = '--config="$HOME/dotfiles/php-cs-fixer.dist.php"'
let g:ale_fixers = {
			\ '*': ['remove_trailing_lines', 'trim_whitespace'],
			\ 'php': ['php_cs_fixer'],
			\ 'python': ['black', 'isort'],
            \ 'javascript': ['standard']
			\}
let g:ale_fix_on_save = 1
let g:ale_linters = {
			\ 'python': ['flake8'],
			\ 'php': ['phpcs'],
            \ 'javascript': ['standard']
			\}

filetype plugin indent on

command! JsonFormat :%!python -m json.tool

filetype plugin indent on
autocmd Filetype javascript setlocal tabstop=2
autocmd Filetype javascript setlocal shiftwidth=2
autocmd Filetype javascript setlocal softtabstop=2

luafile ~/.config/nvim/lua/keybinding.lua

"inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
