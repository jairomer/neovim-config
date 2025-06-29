GITHUB=https://www.github.com/
CLONE=git clone --recurse-submodules -j8

clone:
	    # Lua dependencies
	    ${CLONE} ${GITHUB}'nvim-lua/plenary.nvim'
	    
	    # A Lua file explorer
	    ${CLONE} ${GITHUB}'nvim-tree/nvim-tree.lua'
	    
	    # Nerd Font icons
	    ${CLONE} ${GITHUB}'nvim-tree/nvim-web-devicons'
	    
	    # Simple and easy way for accessing the tree-sitter interface.
	    ${CLONE} ${GITHUB}'nvim-treesitter/nvim-treesitter'
	    
	    # A highly extendable fuzzy finder for any project. 
	    ${CLONE} ${GITHUB}'nvim-telescope/telescope.nvim'
	    
	    # Deep buffer integration for Git
	    ${CLONE} ${GITHUB}'lewis6991/gitsigns.nvim'
	    
	    # A completion engine for neovim in Lua
	    ${CLONE} ${GITHUB}'hrsh7th/nvim-cmp'
	    #    ${CLONE} ${GITHUB}'hrsh7th/cmp-nvim-lsp'
	    #    ${CLONE} ${GITHUB}'hrsh7th/cmp-buffer'
	    #    ${CLONE} ${GITHUB}'hrsh7th/cmp-path'
	    #    ${CLONE} ${GITHUB}'hrsh7th/cmp-cmdline'
	    
	    # Tockyo Night theme
	    ${CLONE} ${GITHUB}'folke/tokyonight.nvim'
	    
	    # PlantUML support
	    ${CLONE} ${GITHUB}'javiorfo/nvim-soil'
	    # Optional for puml syntax highlighting:
	    ${CLONE} ${GITHUB}'javiorfo/nvim-nyctophilia'

clean:
	    rm -Rf plenary.nvim
	    rm -Rf nvim-tree
	    rm -Rf nvim-web-devicons
	    rm -Rf nvim-treesitter
	    rm -Rf nvim-telescope
	    rm -Rf lewis6991 
	    rm -Rf nvim-cmp
		rm -Rf nvim-lua
	    #    ${CLONE} ${GITHUB}'hrsh7th/cmp-nvim-lsp'
	    #    ${CLONE} ${GITHUB}'hrsh7th/cmp-buffer'
	    #    ${CLONE} ${GITHUB}'hrsh7th/cmp-path'
	    #    ${CLONE} ${GITHUB}'hrsh7th/cmp-cmdline'
	    rm -Rf tokyonight.nvim
	    rm -Rf nvim-soil
	    rm -Rf nvim-nyctophilia
