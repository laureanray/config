return require("packer").startup(function()
	use({ "windwp/nvim-ts-autotag" })
	use({ "zbirenbaum/copilot.lua" })
	use("github/copilot.vim")
	use("wbthomason/packer.nvim")
	use({
		"kkharji/lspsaga.nvim",
		branch = "main",
	})
	use("ChristianChiarulli/onedark.nvim")
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
				-- or leave it empty to use the default settings
				-- refer to the configuration section below
			})
		end,
	})

	use("folke/neodev.nvim")
	use("nyoom-engineering/oxocarbon.nvim")
	use("rose-pine/neovim")
	use("bluz71/vim-moonfly-colors")
  use("catppuccin/nvim")
  use("Shatur/neovim-ayu")
	use("sbdchd/neoformat")
	use("rebelot/kanagawa.nvim")
	use({ "sainnhe/gruvbox-material" })
	use({ "mhartington/oceanic-next" })
	use("rktjmp/lush.nvim")
	use("nvim-lua/plenary.nvim")
	use({ "ckipp01/nvim-jenkinsfile-linter", requires = { "nvim-lua/plenary.nvim" } })
	use({ "bluz71/vim-nightfly-colors", as = "nightfly" })
	use("ramojus/mellifluous.nvim")
	use("arzg/vim-colors-xcode")
	use({
		"laureanray/poimandres.nvim",
		config = function()
			require("poimandres").setup({})
		end,
	})

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
	use("lukas-reineke/indent-blankline.nvim")
	use("lukas-reineke/lsp-format.nvim")

	use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
	use("mfussenegger/nvim-jdtls")
	use("RRethy/vim-illuminate")
	use("RishabhRD/popfix")
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
	use("tpope/vim-rhubarb")
	use("junegunn/gv.vim")
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })

	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})

	use({
		"tanvirtin/vgit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

  use("terrortylor/nvim-comment")
  use "xiyaowong/transparent.nvim"

  -- This messes up my mac setup
  -- use "airblade/vim-rooter"
end)
