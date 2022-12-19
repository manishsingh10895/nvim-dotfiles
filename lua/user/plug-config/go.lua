vim.cmd([[autocmd BufWritePre *.go lua vim.lsp.buf.formatting()]])
vim.cmd([[autocmd BufWritePre *.go lua goimports(1000)]])

function on_attach(client, buffer)
     local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
     local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

     buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

     local opts = { noremap = true, silent = true }

     buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
     buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
end
