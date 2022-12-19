-- Config was built using the following config:
-- https://github.com/numToStr/dotfiles/tree/master/neovim/.config/nvim/

local g   = vim.g
local o   = vim.o
local opt = vim.opt
local A   = vim.api

local fn = vim.fn

-- To change default shell to Powershell
vim.cmd([[
    set shell=C:\Windows\System32\WindowsPowerShell\v1.0\powershell.exe
    set shellcmdflag=-command
    set shellquote = shellxquote= 

    set guifont=FiraCode\ Nerd\ Font:h20
]])
--


local fn = vim.fn

-- Automatically install packer
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]

vim.g.python3_host_prog= 'C:/Python27/python2.exe'

vim.cmd([[
    inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1):
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-w> coc#refresh()
endif
]])


-- Protected call to make sure that packer is installed
local status_ok, packer = pcall(require, "packer")

if not status_ok then
  print("not ok")
  return
end

print(status_ok)

-- cmd('syntax on')
-- vim.api.nvim_command('filetype plugin indent on')

o.termguicolors = true
-- o.background = 'dark'

-- Do not save when switching buffers
-- o.hidden = true

-- Decrease update time
o.timeoutlen = 500
o.updatetime = 200

-- Number of screen lines to keep above and below the cursor
o.scrolloff = 8

-- Better editor UI
o.number = true
o.numberwidth = 2
o.relativenumber = true
o.signcolumn = 'yes'
o.cursorline = true
-- Powershell for shell

-- Better editing experience
o.expandtab = true
o.smarttab = true
o.cindent = true
o.autoindent = true
o.wrap = true
o.textwidth = 300
o.tabstop = 4
o.shiftwidth = 4
o.softtabstop = -1 -- If negative, shiftwidth value is used
o.list = true
o.listchars = 'trail:·,nbsp:◇,tab:→ ,extends:▸,precedes:◂'
-- o.listchars = 'eol:¬,space:·,lead: ,trail:·,nbsp:◇,tab:→-,extends:▸,precedes:◂,multispace:···⬝,leadmultispace:│   ,'
-- o.formatoptions = 'qrn1'

-- Makes neovim and host OS clipboard play nicely with each other
o.clipboard = 'unnamedplus'

-- Case insensitive searching UNLESS /C or capital in search
o.ignorecase = true
o.smartcase = true

-- Undo and backup options
o.backup = false
o.writebackup = false
o.undofile = true
o.swapfile = false
-- o.backupdir = '/tmp/'
-- o.directory = '/tmp/'
-- o.undodir = '/tmp/'

-- Remember 50 items in commandline history
o.history = 50

-- Better buffer splitting
o.splitright = true
o.splitbelow = true

-- Preserve view while jumping
-- BUG This option causes an error!
-- o.jumpoptions = 'view'

-- BUG: this won't update the search count after pressing `n` or `N`
-- When running macros and regexes on a large file, lazy redraw tells neovim/vim not to draw the screen
-- o.lazyredraw = true

-- Better folds (don't fold by default)
o.foldmethod = 'indent'
--o.foldlevelstart = 99
--o.foldnestmax = 3
--o.foldminlines = 1

opt.mouse = "a"

-- Map <leader> to space
g.mapleader = ' '
g.maplocalleader = ' '

g.ctrlp_map = '<c-p>'
g.ctrlp_cmd = 'CtrlP'
g.ctrlp_user_command = { '.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard' }
-- ctrl p will look for 'r' the nearest ancestor with .git and 'a' directory of the current file
g.ctrlp_working_path_mode = 'ra'
g.ctrlp_custom_ignore = 'node_modules\\|DS_Store\\|.git'


g.svelte_preprocessors = { 'typescript' }

local ok, _ = pcall(vim.cmd, 'colorscheme nightfox')

-- Highlight the region on yank
A.nvim_create_autocmd('TextYankPost', {
  group = num_au,
  callback = function()
    vim.highlight.on_yank({ higroup = 'Visual', timeout = 120 })
  end,
})

local modules = {
"user/maps",
"user/packer",
"user/plug-config/vim-terraform",
"user/plug-config/diagnostics",
"user/plug-config/telescope",
"user/plug-config/luasnip",
'user/plug-config/toggleterm',
"user/plugins",
"user/plug-config/coc",
"user/plug-config/lsp",
"user/plug-config/go",
}

for k, v in pairs(modules) do 
  package.loaded[v] = nil
  require(v)
end

require("nvim-lsp-installer").setup {}
require('lualine').setup()

print("Setting up rust tools")

local lsp = require('lspconfig')

local rt = require("rust-tools")

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      print("On Attach")
      -- Hover actions
      vim.keymap.set("n", "<Leader>r", rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
    end,
  },
})
