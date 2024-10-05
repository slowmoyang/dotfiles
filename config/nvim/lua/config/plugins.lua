require('lazy').setup({
  ------------------------------------------------------------------------------
  -- https://github.com/VonHeikemen/lsp-zero.nvim/blob/v3.x/doc/md/tutorial.md#complete-code
  ------------------------------------------------------------------------------
  -- lsp
  {'williamboman/mason.nvim'},
  {'williamboman/mason-lspconfig.nvim'},
  {
    'VonHeikemen/lsp-zero.nvim',
    branch = 'v3.x',
    lazy = true,
    config = false,
  },
  -- LSP Support
  {'neovim/nvim-lspconfig'},

  ------------------------------------------------------------------------------
  -- Autocompletion
  ------------------------------------------------------------------------------
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/cmp-buffer'},
  {'hrsh7th/cmp-path'},
  {'hrsh7th/cmp-cmdline'},
  {'hrsh7th/nvim-cmp'},

  ------------------------------------------------------------------------------
  -- snippets
  ------------------------------------------------------------------------------
  {'L3MON4D3/LuaSnip'},
  {'rafamadriz/friendly-snippets'},
  {'saadparwaiz1/cmp_luasnip'},

  ------------------------------------------------------------------------------
  -- treesitter
  ------------------------------------------------------------------------------
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate'
  },

  ------------------------------------------------------------------------------
  -- syntax highlighting
  ------------------------------------------------------------------------------
  {'NoahTheDuke/vim-just'}, -- tree-sitter-just -> error
  {'rbberger/vim-singularity-syntax'},
  {'Gullumluvl/vim-Condor'},

  ------------------------------------------------------------------------------
  -- colorscheme & statusline
  ------------------------------------------------------------------------------
  -- see https://github.com/nvim-treesitter/nvim-treesitter/wiki/Colorschemes
  {'sainnhe/sonokai'},
  {'catppuccin/nvim', name = 'catppuccin', priority = 1000 },
  {'vim-airline/vim-airline'},
  {'vim-airline/vim-airline-themes'},

  ------------------------------------------------------------------------------
  -- misc
  ------------------------------------------------------------------------------
  {'junegunn/goyo.vim'},
  {'psliwka/vim-smoothie'},
  {'mbbill/undotree'},
  {'terrortylor/nvim-comment'},
  {'terryma/vim-multiple-cursors'},


  {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
})
