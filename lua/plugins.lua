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
    use 'williamboman/mason.nvim'
    use 'hrsh7th/nvim-cmp'
    use 'ms-jpq/coq_nvim'
    use 'lewis6991/gitsigns.nvim' 
    use 'romgrk/barbar.nvim'
end)

