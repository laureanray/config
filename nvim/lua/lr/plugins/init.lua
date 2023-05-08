return require("packer").startup(function()
	-- Package manager
	--use '~/Projects/neochtsh.nvim'
	use("wbthomason/packer.nvim")
	use("nyoom-engineering/oxocarbon.nvim")
	use("rose-pine/neovim")
	use("bluz71/vim-moonfly-colors")
	-- use("neg-serg/neg.nvim")
	-- use("EdenEast/nightfox.nvim")
	use("sbdchd/neoformat")
	-- use("luisiacc/gruvbox-baby")
	-- use("morhetz/gruvbox")

	use("rebelot/kanagawa.nvim")
	--
	-- use({ "ellisonleao/gruvbox.nvim" })
	use({ "sainnhe/gruvbox-material" })
	use({ "mhartington/oceanic-next" })
	-- use("Shatur/neovim-ayu")
	-- use("rockerBOO/boo-colorscheme-nvim")
	-- use("fxn/vim-monochrome")
	use("rktjmp/lush.nvim")
	use("nvim-lua/plenary.nvim")
	use({ "ckipp01/nvim-jenkinsfile-linter", requires = { "nvim-lua/plenary.nvim" } })
	use({ "bluz71/vim-nightfly-colors", as = "nightfly" })
	-- use("nvim-lua/plenary.nvim")
	-- use("wadackel/vim-dogrun")
	use("ramojus/mellifluous.nvim")
	use("arzg/vim-colors-xcode")
	-- use({
	-- 	"projekt0n/github-nvim-theme",
	-- 	tag = "v0.0.7",
	-- 	-- or                            branch = '0.0.x'
	-- 	config = function()
	-- 		require("github-theme").setup({
	-- 			-- ...
	-- 		})
	-- 	end,
	-- })
	-- packer
	-- use({
	-- 	"askfiy/visual_studio_code",
	-- 	config = function()
	-- 		require("visual_studio_code").setup({
	-- 			mode = "dark",
	-- 		})
	-- 	end,
	-- })
	-- use("cormacrelf/vim-colors-github")
	-- use("nyoom-engineering/nyoom.nvim")
	use({
		"laureanray/poimandres.nvim",
		config = function()
			require("poimandres").setup({
				-- leave this setup function empty for default config
				-- or refer to the configuration section
				-- for configuration options
			})
		end,
	})
	-- use("arcticicestudio/nord-vim")
	-- use("folke/tokyonight.nvim")
	-- use("rmehri01/onenord.nvim")
	-- use("jaredgorski/spacecamp")
	-- use("romainl/Apprentice")
	-- use("AlessandroYorba/Sierra")
	-- use 'cormacrelf/dark-notify'
	-- use({ "kaicataldo/material.vim", branch = "main" })
	--  use 'github/copilot.vim'
	-- use("xiyaowong/nvim-transparent")
	use({
		"neovim/nvim-lspconfig",
		requires = "onsails/lspkind-nvim",
	})
	-- use("fenetikm/falcon")
	use({
		"kkharji/lspsaga.nvim",
		branch = "main",
	})
	-- Undo
	-- use("mbbill/undotree")

	-- PERFORMANCE!
	-- use("lewis6991/impatient.nvim")

	use("towolf/vim-helm")

	--  use 'f-person/git-blame.nvim'
	-- use("APZelos/blamer.nvim")
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
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	use("RishabhRD/popfix")
	-- use 'RishabhRD/nvim-lsputils'
	-- Development (zen mode ish)

	-- use("wakatime/vim-wakatime")

	use({
		"romgrk/barbar.nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
	})
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
	-- use 'rcarriga/nvim-notify'
	-- Key bindings
	use("folke/which-key.nvim")
	-- use("voldikss/vim-floaterm")
	-- Git
	use("tpope/vim-fugitive")
	use("lewis6991/gitsigns.nvim")
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

	--  use 'kdheepak/lazygit.nvim'
	use({
		"tanvirtin/vgit.nvim",
		requires = {
			"nvim-lua/plenary.nvim",
		},
	})
	-- writng
	use("junegunn/goyo.vim")
end)
