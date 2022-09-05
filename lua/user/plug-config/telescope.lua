vim.api.nvim_set_keymap('n', '<leader>ff', 
"<cmd>lua require('telescope.builtin').find_files()<cr>",
{noremap = true}
)

vim.api.nvim_set_keymap('n', '<leader>fh', 
"<cmd>lua require('telescope.builtin').help_tags()<cr>",
{noremap = true}
)

vim.api.nvim_set_keymap('n', '<leader>fg', 
"<cmd>lua require('telescope.builtin').live_grep()<cr>",
{noremap = true}
)

vim.api.nvim_set_keymap('n', '<leader>fb', 
"<cmd>lua require('telescope.builtin').buffers()<cr>",
{noremap = true}
)


vim.api.nvim_set_keymap('n', '<leader>s', 
"<cmd>lua require('telescope.builtin').lsp_document_symbols()<cr>",
{noremap = true}
)
