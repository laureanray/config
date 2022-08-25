return require('packer').startup(function()
  -- Package manager
  --use '~/Projects/neochtsh.nvim'
  use 'wbthomason/packer.nvim'
  use 'rose-pine/neovim'
  use 'bluz71/vim-moonfly-colors'
  use "EdenEast/nightfox.nvim"
  use("sbdchd/neoformat")
  use 'luisiacc/gruvbox-baby'
  use 'Shatur/neovim-ayu'
  use 'rockerBOO/boo-colorscheme-nvim'
  use 'fxn/vim-monochrome'
  use 'rktjmp/lush.nvim'
  use 'nvim-lua/plenary.nvim'
  use { 
    'laureanray/poimandres.nvim',
    config = function()
      require('poimandres').setup {
        -- leave this setup function empty for default config
        -- or refer to the configuration section
        -- for configuration options
      }
    end
  }
  use 'arcticicestudio/nord-vim'
  use 'ThePrimeagen/harpoon'
  use 'folke/tokyonight.nvim'
  use 'rmehri01/onenord.nvim'
  use 'jaredgorski/spacecamp'
  use 'romainl/Apprentice'
  use 'AlessandroYorba/Sierra'
--  use 'cormacrelf/dark-notify'
  use({ 'kaicataldo/material.vim', branch = "main" })
--  use 'github/copilot.vim'
  use 'xiyaowong/nvim-transparent'
  use {
    'neovim/nvim-lspconfig',
    requires = 'onsails/lspkind-nvim'
  }
  use 'fenetikm/falcon' 
  use({
      "kkharji/lspsaga.nvim",
      branch = "main"
  })

  -- PERFORMANCE!
  use 'lewis6991/impatient.nvim'

  use 'towolf/vim-helm'
--  use 'f-person/git-blame.nvim'
  use 'APZelos/blamer.nvim'
  use {
  'rmagatti/goto-preview',
  config = function()
    require('goto-preview').setup {}
  end
}
  --use {
  --  'tpope/vim-surround'
  --}
  use {
    'nvim-treesitter/nvim-treesitter',
    commit = '8ada8faf2fd5a74cc73090ec856fa88f34cd364b',
    run = ":TSUpdate"
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-treesitter/playground'
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

  use {'kevinhwang91/nvim-ufo', requires = 'kevinhwang91/promise-async'}
  -- use 'jose-elias-alvarez/null-ls.nvim'
  use "mfussenegger/nvim-jdtls"
  use "RRethy/vim-illuminate"
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use 'RishabhRD/popfix'
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
 -- use 'rcarriga/nvim-notify'
  -- Key bindings
  use 'folke/which-key.nvim'
  use 'voldikss/vim-floaterm'
  -- Git
  use 'tpope/vim-fugitive'
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-rhubarb'
  use 'junegunn/gv.vim'
--  use 'kdheepak/lazygit.nvim'
  use {
    'tanvirtin/vgit.nvim',
    requires = {
      'nvim-lua/plenary.nvim'
    }
  }
end)
