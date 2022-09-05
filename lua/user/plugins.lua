-- PLUGINS
-- Only required if you have packer configured as `opt`
 vim.cmd [[packadd packer.nvim]]
return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

use {"akinsho/toggleterm.nvim", tag = '*', config = function()
  require("toggleterm").setup()
end}
  
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'ryanoasis/vim-devicons' }
  }

use 'onsails/lspkind-nvim' -- Vscode like pictograms

  -- File management --
  use 'vifm/vifm.vim'
  use 'scrooloose/nerdtree'
  use 'tiagofumo/vim-nerdtree-syntax-highlight'
  use 'ryanoasis/vim-devicons'
  use 'ctrlpvim/ctrlp.vim'

  -- RUST --
  use 'simrat39/rust-tools.nvim'

  -- Productivity --
  use 'vimwiki/vimwiki'
  use 'jreybert/vimagit'

  -- Tim Pope Plugins --
  use 'tpope/vim-surround'

  -- Auto Complettion --
  -- use 'leafOfTree/vim-svelte-plugin'
  use 'evanleck/vim-svelte'
  use { 'neoclide/coc.nvim', branch = 'master' }

  -- Syntax Highlighting and Colors --
  use 'PotatoesMaster/i3-vim-syntax'
  use 'kovetskiy/sxhkd-vim'
  use 'vim-python/python-syntax'
  use 'ap/vim-css-color'
  use 'sheerun/vim-polyglot'
  use 'HerringtonDarkholme/yats.vim'
  use 'Shougo/context_filetype.vim'

  -- Junegunn Choi Plugins --
  use 'junegunn/goyo.vim'
  use 'junegunn/limelight.vim'
  use 'junegunn/vim-emoji'

  -- Snippets
  use 'honza/vim-snippets'

  -- Highlighting
  --use 'RRethy/vim-illuminate'

  -- GIT
  use { "kdheepak/lazygit.nvim" }

  -- Findings
  use {
    'nvim-telescope/telescope.nvim', tag = '0.1.0',
    -- or                            , branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' }, config = function()
      require('telescope').setup({
        defaults = {
          file_ignore_patterns = {"node_modules", "target"}
        }
      })

      require("telescope").load_extension("lazygit")
    end
    }

    -- Color 
  use "EdenEast/nightfox.nvim" -- Packer
  -- Other stuff
  use 'frazrepo/vim-rainbow'


  -- LSP Config
use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        local saga = require("lspsaga")

        saga.init_lsp_saga({
            -- your configuration
        })
    end,
})
  use { "williamboman/mason.nvim" }
  use {
    "williamboman/nvim-lsp-installer",
    "neovim/nvim-lspconfig",
  }

end)
