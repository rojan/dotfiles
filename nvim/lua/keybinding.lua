local map = vim.api.nvim_set_keymap
-- map the leader key
map('n', ',', '', {})
vim.g.mapleader = ','  -- 'vim.g' sets global variables


options = { noremap = true }

--- LSPSaga Keybindings
map('n', '[e', ':Lspsaga diagnostic_jump_next<cr>', options)
map('n', ']e', ':Lspsaga diagnostic_jump_prev<cr>', options)
---- only show diagnostic if cursor is over the line
map('n', 'cd', ':Lspsaga show_line_diagnostics<cr>', options)
---- only show diagnostic if cursor is over the area
map('n', 'cc', ':Lspsaga show_cursor_diagnostics<cr>', options)
-- lsp provider to find the cursor word definition and reference
map('n', 'gh', ':Lspsaga lsp_finder<cr>', options)
-- lsp provide code action
map('n', 'ca', ':Lspsaga code_action', options)
map('n', 'ca', ':<C-U>Lspsaga range_code_action<cr>', options)
-- lsp documentation
map('n', 'K', ':Lspsaga hover_doc<cr>', options)
map('n', '<C-f>', ':Lspsaga smart_scroll_with_saga(1)<cr>', options)
-- scroll up hover doc
map('n', '<C-b>', ':Lspsaga smart_scroll_with_saga(-1)<cr>', options)
-- rename variables
map('n', 'gr', ':Lspsaga rename<cr>', options)
map('n', 'gd', ':Lspsaga preview_definition<cr>', options)
-- Terminal
map('n', '<A-d>', ':Lspsaga open_floaterm<cr>', options)
map('t', '<A-d>', '<C-\\><C-n>:Lspsaga close_floaterm<CR>', options)

-- Fugutive
map('n', '<leader>gs', ':Neogit<cr>', options)
--map('n', '<leader>gc', ':Git commit<CR>', options)

-- Don't lose selected lines
map('v', '<', '<gv', options)
map('v', '>', '>gv', options)
-- Improve up/down movement on wrapped lines
map('v', 'j', 'gj', options)
map('v', 'k', 'gk', options)
-- Replace selected word
map('n', '<C-r>','"hy:%s/<C-r>h//gc<left><left><left>', options)
map('n', '<leader><space>', ':noh<cr>', {noremap=true, silent=true})
map('n', '<leader>t', ':TagbarToggle<cr>', options)

--inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
map('i', '<TAB>', 'pumvisible() ? "\\<C-n>" : "\\<TAB>"', {expr=true, noremap=false, silent=true})
