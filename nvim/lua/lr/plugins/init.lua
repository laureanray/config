return require("packer").startup(function()
    use({ "zbirenbaum/copilot.lua" })
    use("github/copilot.vim")
    use("wbthomason/packer.nvim")
    use({ 'kepano/flexoki-neovim', as = 'flexoki' })
    -- use({
    --     "kkharji/lspsaga.nvim",
    --     branch = "main",
    -- })
    -- use { "catppuccin/nvim", as = "catppuccin" }
    -- use({ "rose-pine/neovim", as = "rose-pine" })
    --
    use "nvimdev/lspsaga.nvim"
    use({
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    })
    -- use("kartikp10/noctis.nvim")
    use { "nyoom-engineering/oxocarbon.nvim" }



    -- Debugging
    -- use "mfussenegger/nvim-dap"
    -- use "leoluz/nvim-dap-go"
    -- use "rcarriga/nvim-dap-ui"
    -- use "theHamsta/nvim-dap-virtual-text"
    -- use "nvim-telescope/telescope-dap.nvim"
    --
    use({
        "folke/trouble.nvim",
        requires = "nvim-tree/nvim-web-devicons",
    })

    -- use("rktjmp/lush.nvim")
    -- use("bluz71/vim-moonfly-colors")
    use("folke/neodev.nvim")
    use("nvim-lua/plenary.nvim")
    use({
        "nvim-treesitter/nvim-treesitter",
        run = ":TSUpdate",
    })
    use "nvim-treesitter/nvim-treesitter-context"
    use("nvim-treesitter/nvim-treesitter-textobjects")
    use("nvim-treesitter/playground")
    use({
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    })
    use({ 'neovim/nvim-lspconfig' })
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use("hrsh7th/nvim-cmp")
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/vim-vsnip")
    use("L3MON4D3/LuaSnip")

    use { "catppuccin/nvim", as = "catppuccin" }
    use("lukas-reineke/indent-blankline.nvim")
    -- use("lukas-reineke/lsp-format.nvim")

    -- TODO: Learn this?
    use({ "kevinhwang91/nvim-ufo", requires = "kevinhwang91/promise-async" })
    use("mfussenegger/nvim-jdtls")
    --use("RRethy/vim-illuminate")
    -- use("kyazdani42/nvim-web-devicons")
    use 'nvim-tree/nvim-web-devicons'
    use "olimorris/onedarkpro.nvim"

    use({
        "nvim-lualine/lualine.nvim",
    })

    -- use {
    --     'linrongbin16/lsp-progress.nvim',
    --     requires = { 'nvim-tree/nvim-web-devicons' },
    --     config = function()
    --         require('lsp-progress').setup()
    --     end
    -- }

    use("theprimeagen/harpoon")
    use("lewis6991/gitsigns.nvim")

    use({
        "nvim-telescope/telescope.nvim",
        requires = {
            { "nvim-lua/popup.nvim" },
            { "nvim-lua/plenary.nvim" },
            { "nvim-telescope/telescope-fzy-native.nvim", run = "make" }, { "nvim-telescope/telescope-symbols.nvim" },
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

    -- Focus
    use("junegunn/goyo.vim")
    -- Utils
    use("terrortylor/nvim-comment")
    -- Wakatime
    use "wakatime/vim-wakatime"
    -- use "~/Projects/tree-setter"
    -- use "filNaj/tree-setter"
    use({
        'mvllow/modes.nvim',
        tag = 'v0.2.0',
        config = function()
            require('modes').setup()
        end
    })
    use "folke/todo-comments.nvim"

    -- use "olivercederborg/poimandres.nvim"
    -- use "tjdevries/cyclist.vim"
    -- use "rcarriga/nvim-notify"
    -- use "bluz71/vim-nightfly-colors"
    -- use 'andweeb/presence.nvim'
    -- use 'Mofiqul/dracula.nvim'
    use "rose-pine/neovim"
    use "projekt0n/github-nvim-theme"
    use "trusktr/seti.vim"
    use "sainnhe/gruvbox-material"
    -- Lua
    -- use {
    --     "folke/which-key.nvim",
    --     config = function()
    --         vim.o.timeout = true
    --         vim.o.timeoutlen = 300
    --         require("which-key").setup {
    --             -- your configuration comes here
    --             -- or leave it empty to use the default settings
    --             -- refer to the configuration section below
    --         }
    --     end
    -- }
    -- use "shaunsingh/nord.nvim"
    -- use {
    --     'VonHeikemen/lsp-zero.nvim',
    --     branch = 'v3.x',
    --     requires = {
    --         --- Uncomment these if you want to manage LSP servers from neovim
    --         -- {'williamboman/mason.nvim'},
    --         -- {'williamboman/mason-lspconfig.nvim'},

    --         -- LSP Support
    --         { 'neovim/nvim-lspconfig' },
    --         -- Autocompletion
    --         { 'hrsh7th/nvim-cmp' },
    --         { 'hrsh7th/cmp-nvim-lsp' },
    --         { 'L3MON4D3/LuaSnip' },
    --     }
    -- }

    use "onsails/lspkind.nvim"
    use {
        'j-hui/fidget.nvim',
        tag = 'legacy',
        config = function()
            require("fidget").setup {
                -- options
            }
        end,
    }
    use "ThePrimeagen/vim-be-good"
    use "xiyaowong/transparent.nvim"
end)
