-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Plugin stuff
return require('packer').startup(function()
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Fass a fuqboi
	use 'lewis6991/impatient.nvim'

	-- Colors
	use({
		"catppuccin/nvim",
		as = "catppuccin",
	})
	use "rebelot/kanagawa.nvim"


	-- Bar
	-- use {'glepnir/galaxyline.nvim', branch='main', requires = { 'kyazdani42/nvim-web-devicons', opt = true }}

	-- Auto completion
	use "hrsh7th/nvim-cmp" -- The completion plugin
	use "hrsh7th/cmp-buffer" -- buffer completions
	use "hrsh7th/cmp-path" -- path completions
	use "saadparwaiz1/cmp_luasnip" -- snippet completions
	use "hrsh7th/cmp-nvim-lsp" -- TODO
	use "hrsh7th/cmp-nvim-lua" -- TODO
	use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
	use "windwp/nvim-ts-autotag" -- html auto complete stuff

    -- Buffers and buffer line
    use "akinsho/bufferline.nvim" -- ugly gui type buffer line for displaying windows(buffers)
    use "moll/vim-bbye" -- Don't close window when buffer is closed


	-- snippet completions
	use "L3MON4D3/LuaSnip" --snippet engine
	use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

	-- Terimnal
	use {"akinsho/toggleterm.nvim", as = "toggleterm", tag = '*', config = function()
		require("toggleterm").setup()
	end}

	-- Smexy notifications
	use {'rcarriga/nvim-notify', as="notify"}
	use {'nvim-lualine/lualine.nvim'}


    -- LSP Stuff
	-- use "williamboman/nvim-lsp-installer" -- Insatlls lsps
	use {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"neovim/nvim-lspconfig",
	}
	use {
		"jose-elias-alvarez/null-ls.nvim",
		"jay-babu/mason-null-ls.nvim",
	}

	-- Rust
	use "nvim-lua/plenary.nvim" -- TODO

	-- Specifically for rust (support single fils)
	use { "simrat39/rust-tools.nvim", 
		ft = {'rust'},
	}

	-- Flutter lsp
	-- use {'akinsho/flutter-tools.nvim', requires = 'nvim-lua/plenary.nvim', ft = {'dart'}}
	use {
    'akinsho/flutter-tools.nvim',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        'stevearc/dressing.nvim', -- optional for vim.ui.select
    },
    config = true,
	ft = dart
};


	-- Go lsp
	use {'ray-x/go.nvim', ft = { 'go' }}
	use {'ray-x/guihua.lua', ft = {'go'}} -- recommanded if need floating window support


	-- Fuzzy finder
	use 'nvim-lua/popup.nvim' -- TODO
	use {
		"nvim-telescope/telescope.nvim", -- The BEST fuzzy searcher
		---@see https://github.com/nvim-telescope/telescope.nvim/issues/2596
		commit = "057ee0f8783872635bc9bc9249a4448da9f99123",
	}
	use 'nvim-telescope/telescope-media-files.nvim' -- can see media files? (not working)

	-- Tree shitters
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	} -- THE REAL SHIT
	use "p00f/nvim-ts-rainbow" -- My little poni Te he ;)
	use { 
		"nvim-treesitter/playground",
		opt = true,
		cmd = { "TSPlaygroundToggle", "TSHighlightCaptureUnderCursor" },
	} -- Wanna play with cuite putie ugly syntax shell shock
	-- Lazy loading 'playground' as I don't require it much

	use {
	  'nvim-tree/nvim-tree.lua',
	  requires = {
	    'nvim-tree/nvim-web-devicons', -- optional
	  },
	}

	-- Commenting
	use 'numToStr/Comment.nvim'
	use 'JoosepAlviste/nvim-ts-context-commentstring'


	-- GIT
	use "lewis6991/gitsigns.nvim"

	-- Indent guides
	use 'lukas-reineke/indent-blankline.nvim'

	-- Shows which key that can be used next
	use { "folke/which-key.nvim" }

	-- lsp highlight color fix
	use 'folke/lsp-colors.nvim'


	-- Better ui sellection for vim (uses telescope)
	use {'nvim-telescope/telescope-ui-select.nvim' }


	-- Session manager
	use {
		'rmagatti/auto-session',
	}
	-- gui interface for loading sessions
	use {
		'rmagatti/session-lens',
		requires = {'rmagatti/auto-session', 'nvim-telescope/telescope.nvim'},
	}

	-- markdown preview
	use({ "iamcco/markdown-preview.nvim", run = "cd app && npm install", setup = function() vim.g.mkdp_filetypes = { "markdown" } end, ft = { "markdown" }, })


	-- Debuggin
	use "mfussenegger/nvim-dap" -- TODO
	use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }


	-- Copilot!!!
	use {
		"zbirenbaum/copilot.lua",
		-- cmd = "Copilot",
		-- event = "InsertEnter",
	}
	-- use {
	-- 	"zbirenbaum/copilot-cmp",
	-- 	after = { "copilot.lua" },
	-- 	config = function ()
	-- 		require("copilot_cmp").setup()
	-- 	end
	-- }
	

	-- Auto-Tabbin' and shit
	use {
		'tpope/vim-sleuth'
	}
end)
