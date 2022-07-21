return require('packer').startup(function()
  -- Package manager
  use 'wbthomason/packer.nvim'
  use 'rose-pine/neovim'
  use 'bluz71/vim-moonfly-colors'
  use "EdenEast/nightfox.nvim"
  use("sbdchd/neoformat")
  use 'luisiacc/gruvbox-baby'
  use 'Shatur/neovim-ayu'
  use 'rockerBOO/boo-colorscheme-nvim'
  use 'rktjmp/lush.nvim'
  use 'cormacrelf/dark-notify'
  use({ 'kaicataldo/material.vim', branch = "main" })
  use 'github/copilot.vim'
  use {
    'neovim/nvim-lspconfig',
    requires = 'onsails/lspkind-nvim'
  }
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

  use {
  'rmagatti/goto-preview',
  config = function()
    require('goto-preview').setup {}
  end
}
  --use {
  --  'tpope/vim-surround'
  --}
  --use 'maxmellon/vim-jsx-pretty'
--  use 'lewis6991/spellsitter.nvim'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ":TSUpdate"
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'
  --use 'windwp/nvim-ts-autotag'
  use {
  	"windwp/nvim-autopairs",
     config = function() require("nvim-autopairs").setup {} end
  }
--  use 'p00f/nvim-ts-rainbow'
  --use 'MunifTanjim/eslint.nvim'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-vsnip'
  use 'hrsh7th/vim-vsnip'
  use 'jbgutierrez/vim-better-comments'
  use 'lukas-reineke/indent-blankline.nvim'
  use 'lukas-reineke/lsp-format.nvim'
  -- use 'jose-elias-alvarez/null-ls.nvim'
  use "mfussenegger/nvim-jdtls"
  use "RRethy/vim-illuminate"
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use 'RishabhRD/popfix'
  --use({
  --  'ray-x/navigator.lua',
  --   requires = {
  --      { 'ray-x/guihua.lua', run = 'cd lua/fzy && make' },
  --      { 'neovim/nvim-lspconfig' },
  --  },
  --})
  -- use 'RishabhRD/nvim-lsputils' 
  -- Development (zen mode ish)
  use {
    'folke/twilight.nvim'
  }
  use 'wakatime/vim-wakatime'

use {
  'romgrk/barbar.nvim',
  requires = {'kyazdani42/nvim-web-devicons'}
}
  -- Statusline
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }
  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = 'kyazdani42/nvim-web-devicons'
  }

  -- Searching stuffs
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      {'nvim-lua/popup.nvim'},                                 
      {'nvim-lua/plenary.nvim'},                               
      {'nvim-telescope/telescope-fzy-native.nvim', run="make"},
      {'nvim-telescope/telescope-symbols.nvim'}
    }
  }
  use 'rcarriga/nvim-notify'
  -- Key bindings
  use 'folke/which-key.nvim'
  use 'voldikss/vim-floaterm'
  -- Git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-rhubarb'
  use 'junegunn/gv.vim'
  use 'kdheepak/lazygit.nvim'

end)
