--  disable language provider support (lua and vimscript plugins only)
vim.g.loaded_perl_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_node_provider = 0
vim.g.loaded_python_provider = 0
vim.g.loaded_python3_provider = 0

-- A TAB character looks like 4 spaces.
vim.o.tabstop = 4 
-- Pressing the TAB key will insert spaces instead of TAB.
vim.o.expandtab = true
-- Number of spaces inserted instead of a TAB character
vim.o.softtabstop = 4
-- Number of spaces inserted when indenting
vim.o.shiftwidth = 4

-- Set system clipboard
vim.opt.clipboard= 'unnamedplus'

require('plugins')

-- disable netrw at the very start of your init.lua
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

-- optionally enable 24-bit colour
vim.opt.termguicolors = true

-- set the Leader Key
vim.g.mapleader = ' '

-- set keymap for nvim-tree
vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>')

-- set keymap for telescope
local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, {})
vim.keymap.set('n', '<leader>fg', telescope.live_grep, {})
vim.keymap.set('n', '<leader>fb', telescope.buffers, {})
vim.keymap.set('n', '<leader>fh', telescope.help_tags, {})

local function my_on_attach(bufnr)
    -- configure nvim-tree
    local api = require "nvim-tree.api"
    
    local function opts(desc)
      return { desc = "nvim-tree: " .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
    end
    
    api.filters = {
          dotfiles = false,
          git_clean = false,
          no_buffer = false,
          custom = {}
      }
    
    -- default mappings
    api.config.mappings.default_on_attach(bufnr)
    
    -- custom mappings
    vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        opts('Up'))
    vim.keymap.set('n', '?',     api.tree.toggle_help,                  opts('Help'))
end


-- empty setup using defaults
require("nvim-tree").setup({
	on_attach = my_on_attach
})

require('mason').setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

-- local cmp = require'cmp'
--   cmp.setup({
--     snippet = {
--       expand = function(args)
--           vim.snippet.expand(args.body)
--  --       require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
--       end,
--     },
--     window = {
--       completion = cmp.config.window.bordered(),
--       documentation = cmp.config.window.bordered(),
--     },
--     mapping = cmp.mapping.preset.insert({
--       ['<C-b>'] = cmp.mapping.scroll_docs(-4),
--       ['<C-f>'] = cmp.mapping.scroll_docs(4),
--       ['<C-Space>'] = cmp.mapping.complete(),
--       ['<C-e>'] = cmp.mapping.abort(),
--       -- Accept currently selected item.
--       -- Set `select` to `false` to only confirm explicitly selected items.
--       ['<CR>'] = cmp.mapping.confirm({ select = true }), 
--     }),
--     sources = cmp.config.sources({
--       { name = 'nvim_lsp' },
--       -- For luasnip users.
-- --      { name = 'luasnip' }, 
--     }, {
--       { name = 'buffer' },
--     })
--   })
-- 
--   -- Set configuration for specific filetype.
--   cmp.setup.filetype('gitcommit', {
--     sources = cmp.config.sources({
--       { name = 'git' }, 
--     }, {
--       { name = 'buffer' },
--     })
--   })
-- 
--   -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
--   cmp.setup.cmdline({ '/', '?' }, {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = {
--       { name = 'buffer' }
--     }
--   })
-- 
--   -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
--   cmp.setup.cmdline(':', {
--     mapping = cmp.mapping.preset.cmdline(),
--     sources = cmp.config.sources({
--       { name = 'path' }
--     }, {
--       { name = 'cmdline' }
--     }),
--     matching = { disallow_symbol_nonprefix_matching = false }
--   })

