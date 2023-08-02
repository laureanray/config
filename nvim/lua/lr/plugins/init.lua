return require("packer").startup(function()
  -- use({ "windwp/nvim-ts-autotag" })
  use({ "zbirenbaum/copilot.lua" })
  use("github/copilot.vim")
  use("wbthomason/packer.nvim")
  use({
    "kkharji/lspsaga.nvim",
    branch = "main",
  })
  use({
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
    "onsails/lspkind-nvim",
  })
  use({
    "folke/trouble.nvim",
    requires = "nvim-tree/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        -- your configuration comes here
        --  or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })

  use("folke/neodev.nvim")
  use({ 'rose-pine/neovim', as = 'rose-pine' })
  use("nvim-lua/plenary.nvim")
  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  })
  use 'nvim-treesitter/nvim-treesitter-context'
  use("nvim-treesitter/nvim-treesitter-textobjects")
  use("nvim-treesitter/playground")
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })
  use("hrsh7th/cmp-nvim-lsp")
  use("hrsh7th/cmp-buffer")
  use("hrsh7th/cmp-path")
  use("hrsh7th/cmp-cmdline")
  use("hrsh7th/nvim-cmp")
  use("hrsh7th/cmp-vsnip")
  use("hrsh7th/vim-vsnip")

  -- use("lukas-reineke/indent-blankline.nvim")
  use("lukas-reineke/lsp-format.nvim")

  -- TODO: Learn this?
  -- use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
  use("mfussenegger/nvim-jdtls")
  --use("RRethy/vim-illuminate")
  use("kyazdani42/nvim-web-devicons")

  use({
    "nvim-lualine/lualine.nvim",
    requires = {
      "kyazdani42/nvim-web-devicons",
      opt = true,
    },
  })

  use("theprimeagen/harpoon")
  use("lewis6991/gitsigns.nvim")

  use({
    "nvim-telescope/telescope.nvim",
    requires = {
      { "nvim-lua/popup.nvim" },
      { "nvim-lua/plenary.nvim" },
      { "nvim-telescope/telescope-fzy-native.nvim", run = "make" },
      { "nvim-telescope/telescope-symbols.nvim" },
    },
  })

  use {
    "nvim-telescope/telescope-file-browser.nvim",
    requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  use("tpope/vim-fugitive")
  use({ "kevinhwang91/nvim-bqf", ft = "qf" })

  use({
    "junegunn/fzf",
    run = function()
      vim.fn["fzf#install"]()
    end,
  })

  -- Utils
  use("terrortylor/nvim-comment")
  use "xiyaowong/transparent.nvim"
  -- Wakatime
  use 'wakatime/vim-wakatime'
end)
