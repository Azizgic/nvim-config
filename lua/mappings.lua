local map = vim.keymap.set

map('i', '<C-b>', '<ESC>^i', { desc = 'move beginning of line' })
map('i', '<C-e>', '<End>', { desc = 'move end of line' })
map('i', '<C-h>', '<Left>', { desc = 'move left' })
map('i', '<C-l>', '<Right>', { desc = 'move right' })
map('i', '<C-j>', '<Down>', { desc = 'move down' })
map('i', '<C-k>', '<Up>', { desc = 'move up' })

map('n', '<C-h>', '<C-w>h', { desc = 'switch window left' })
map('n', '<C-l>', '<C-w>l', { desc = 'switch window right' })
map('n', '<C-j>', '<C-w>j', { desc = 'switch window down' })
map('n', '<C-k>', '<C-w>k', { desc = 'switch window up' })

map('n', '<Esc>', '<cmd>noh<CR>', { desc = 'general clear highlights' })

map('n', '<leader>s', '<cmd>w<CR>', { desc = 'general save file', remap = true })
map('n', '<C-c>', '<cmd>%y+<CR>', { desc = 'general copy whole file' })

map({ 'n', 'x' }, '<leader>cf', function()
  require('conform').format({ lsp_fallback = true })
end, { desc = 'general format file' })

-- global lsp mappings
map('n', '<leader>ds', vim.diagnostic.setloclist, { desc = 'LSP diagnostic loclist' })

-- Comment
map('n', '<leader>/', 'gcc', { desc = 'toggle comment', remap = true })
map('v', '<leader>/', 'gc', { desc = 'toggle comment', remap = true })

-- Oil
map('n', '<leader>e', '<cmd>Oil<CR>', { desc = 'Explorer' })

-- telescope
map('n', '<leader>fs', '<cmd>Telescope live_grep<CR>', { desc = 'telescope live grep' })
map('n', '<leader>fb', '<cmd>Telescope buffers<CR>', { desc = 'telescope find buffers' })
map('n', '<leader>fh', '<cmd>Telescope help_tags<CR>', { desc = 'telescope help page' })
map('n', '<leader>ma', '<cmd>Telescope marks<CR>', { desc = 'telescope find marks' })
map('n', '<leader>fo', '<cmd>Telescope oldfiles<CR>', { desc = 'telescope find oldfiles' })
map(
  'n',
  '<leader>fz',
  '<cmd>Telescope current_buffer_fuzzy_find<CR>',
  { desc = 'telescope find in current buffer' }
)
map('n', '<leader>cm', '<cmd>Telescope git_commits<CR>', { desc = 'telescope git commits' })
map('n', '<leader>gt', '<cmd>Telescope git_status<CR>', { desc = 'telescope git status' })
map('n', '<leader>pt', '<cmd>Telescope terms<CR>', { desc = 'telescope pick hidden term' })

map('n', '<leader>ff', '<cmd>Telescope find_files<cr>', { desc = 'telescope find files' })
map(
  'n',
  '<leader>fa',
  '<cmd>Telescope find_files follow=true no_ignore=true hidden=true<CR>',
  { desc = 'telescope find all files' }
)

-- Terminal
local Terminal = require('toggleterm.terminal').Terminal

-- Horizontal

vim.keymap.set({ 'n', 't' }, '<A-h>', function()
  Terminal:new({ direction = 'horizontal' }):toggle()
end)

-- Vertical
vim.keymap.set({ 'n', 't' }, '<A-v>', function()
  Terminal:new({ direction = 'vertical' }):toggle()
end)

-- Floating
vim.keymap.set({ 'n', 't' }, '<A-i>', function()
  Terminal:new({ direction = 'float' }):toggle()
end)

-- terminal buffer
vim.keymap.set('n', '<leader>tt', function()
  vim.cmd('enew | terminal')
end)

-- Escape terminal mode
vim.keymap.set('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })
vim.keymap.set('t', '<C-q>', '<C-\\><C-n>:q<CR>', { noremap = true, silent = true })

map('n', '<leader>q', '<cmd>q<CR>')

map('i', 'jk', '<Esc>', { silent = true })

-- whichkey
map('n', '<leader>wK', '<cmd>WhichKey <CR>', { desc = 'whichkey all keymaps' })

map('n', '<leader>wk', function()
  vim.cmd('WhichKey ' .. vim.fn.input('WhichKey: '))
end, { desc = 'whichkey query lookup' })
