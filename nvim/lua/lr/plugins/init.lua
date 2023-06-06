return require("packer").startup(function()
	-- use({
	-- 	"zbirenbaum/copilot.lua",
	-- 	cmd = "Copilot",
	-- 	event = "InsertEnter",
	-- 	config = function()
	-- 		require("copilot").setup({})
	-- 	end,
	-- })
	--
	use({ "windwp/nvim-ts-autotag" })
	use({ "zbirenbaum/copilot.lua" })
	-- use({
	-- 	"zbirenbaum/copilot-cmp",
	-- 	after = { "copilot.lua" },
	-- 	config = function()
	--     require("copilot_cmp").setup()
	-- 	end,
	-- })
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
	-- use({
	-- 	"neovim/nvim-lspconfig",
	-- 	requires = "onsails/lspkind-nvim",
	-- })
	use({
		"rmagatti/goto-preview",
		config = function()
			require("goto-preview").setup({})
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
	--  use 'p00f/nvim-ts-rainbow'
	--use 'MunifTanjim/eslint.nvim'
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
	-- use 'jose-elias-alvarez/null-ls.nvim'
	use("mfussenegger/nvim-jdtls")
	use("RRethy/vim-illuminate")
	--	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("RishabhRD/popfix")
	-- use 'RishabhRD/nvim-lsputils'
	-- Development (zen mode ish)

	use("kyazdani42/nvim-web-devicons")
	-- use("wakatime/vim-wakatime")
	-- Statusline
	use({
		"nvim-lualine/lualine.nvim",
		requires = {
			"kyazdani42/nvim-web-devicons",
			opt = true,
		},
	})
	-- File explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = "kyazdani42/nvim-web-devicons",
	})

	use("theprimeagen/harpoon")

	use("lewis6991/gitsigns.nvim")

	use({
		"romgrk/barbar.nvim",
		requires = {
			"lewis6991/gitsigns.nvim", -- OPTIONAL: for git status
			"nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
		},
	})

	-- Searching stuffs
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
	-- use 'rcarriga/nvim-notify'
	-- Key bindings
	use("folke/which-key.nvim")
	-- use("voldikss/vim-floaterm")
	-- Git
	use("tpope/vim-fugitive")
	use("tpope/vim-rhubarb")
	use("junegunn/gv.vim")
	use({ "kevinhwang91/nvim-bqf", ft = "qf" })

	-- optional
	use({
		"junegunn/fzf",
		run = function()
			vim.fn["fzf#install"]()
		end,
	})

	-- use { "zbirenbaum/copilot.lua" }

	use({
		"tanvirtin/vgit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})

  use "xiyaowong/transparent.nvim"
end)
