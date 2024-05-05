return require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
  	use 'mfussenegger/nvim-dap'
  	use 'mfussenegger/nvim-jdtls'
  	use 'nvim-lua/plenary.nvim'
	use 'nvim-tree/nvim-tree.lua'
	use 'nvim-tree/nvim-web-devicons'
    use 'nvim-treesitter/nvim-treesitter'
	use {
	    'nvim-telescope/telescope.nvim', tag = '0.1.6',
  	    requires = { {'nvim-lua/plenary.nvim'} }
	}
    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        run = 'make'
    }
    use 'williamboman/mason.nvim'
    use 'williamboman/mason-lspconfig.nvim'
    use 'lewis6991/gitsigns.nvim'
    use 'romgrk/barbar.nvim'
    --  nvim-cmp
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    -- Snippet engine
    use({
	"L3MON4D3/LuaSnip",
	tag = "v2.3.0",
	run = "make install_jsregexp"
    })
    use 'saadparwaiz1/cmp_luasnip'
    use 'mfussenegger/nvim-fzy'
    use {
        'tzachar/fuzzy.nvim',
        requires = {'nvim-telescope/telescope-fzf-native.nvim'}
    }
    use {
        'tzachar/cmp-fuzzy-buffer',
        requires = {
            'hrsh7th/nvim-cmp',
            'tzachar/fuzzy.nvim'
        }
    }
    -- theme
    use {
      "folke/tokyonight.nvim",
      lazy = false,
      priority = 1000,
      opts = {},
    }
end)

