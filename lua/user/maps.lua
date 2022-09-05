-- KEYBINDINGS
local function map(m, k, v)
  vim.keymap.set(m, k, v, { silent = true })
end

local keymap = vim.keymap


-- Mimic shell movements
map('i', '<C-E>', '<ESC>A')
map('i', '<C-A>', '<ESC>I')


vim.api.nvim_set_keymap('n', '<c-P>',
  "<cmd>lua require('fzf-lua').files()<CR>",
  { noremap = true, silent = true }
)

map('n', '<C-a>', 'gg<S-v>G')

vim.g.python3_host_prog= 'C:\\Users\\manis\\AppData\\Local\\Microsoft\\WindowsApps\\python3.exe'

keymap.set('n', '+', '<C-a>')
keymap.set('n', '-', '<C-x>')
