syntax on
set showmatch           " Show matching brackets.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set expandtab           " Insert spaces when TAB is pressed.
set tabstop=2           " Render TABs using this many spaces.
set shiftwidth=2        " Indentation amount for < and > commands.
set clipboard+=unnamedplus "Use system clipboard.

set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

if !&scrolloff
    set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
    set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set nostartofline       " Do not jump to first character with page commands.

" Pane navigation
map <C-> <C-W>j
map <C-> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Natural exiting for terminal mode
:tnoremap <Esc> <C-\><C-n>

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

" Pathogen Plugin Manager
execute pathogen#infect()

filetype plugin indent on

" Set mouse
set mouse=a

" START NERDTree configuration
" Execute NERDTree pane on startup
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
" END of NERDTree configuration

" Find files using Telescope command-line sugar.
nnoremap ff <cmd>:Telescope find_files<cr>
nnoremap fg <cmd>:Telescope live_grep<cr>
nnoremap fb <cmd>:Telescope buffers<cr>
nnoremap fh <cmd>:Telescope help_tags<cr>

" START YouCompleteMe config
let g:ycm_global_ycm_extra_conf = '~/.config/nvim/.ycm_extra_conf.py'

" END of YouCompleteMe config

" lua require 'nvim-treesitter.configs'.setup{highlight={enable=true}}  " At the bottom of your init.vim, keep all configs on one line
lua require'nvim-treesitter.configs'.setup {highlight = { enable = true }, }
