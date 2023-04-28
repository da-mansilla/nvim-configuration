syntax on

set relativenumber
set noerrorbells
set tabstop=4 
set softtabstop=4
set shiftwidth=4
set expandtab
set smartindent
set nu
set nowrap
set smartcase
set noswapfile
set nobackup
set undodir=~/.config/nvim/undo
set undofile
set incsearch
set hlsearch!
set nocompatible

"set colorcolumn=80
"highlight ColorColumn ctermbg = 0 guibg=lightgrey

source  /home/agustin/.config/nvim/plug-config/coc.vim
let g:coc_node_path = '/usr/bin/node'

call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'jremmen/vim-ripgrep'
Plug 'tpope/vim-fugitive'
Plug 'leafgarland/typescript-vim'
Plug 'vim-utils/vim-man'
"Plug 'lyuts/vim-rtags'
Plug 'kien/ctrlp.vim' 
"Plug 'Valloric/YouCompleteMe'
Plug 'mbbill/undotree'
Plug 'rstacruz/vim-closer'
Plug 'tpope/vim-endwise'
Plug 'preservim/nerdtree'

Plug 'alvan/vim-closetag'

"Highlight Vim Polyglot
Plug 'sheerun/vim-polyglot'

"" Use release branch (recommend)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Keeping up to date with master
Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}

call plug#end()

" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif



filetype plugin indent on

" Close Tag
" filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
"let g:closetag_close_shortcut = '<leader>>'

" Close Tag
colorscheme gruvbox
"set background=dark

if executable('rg')
    let g:rg_derive_root='true'
endif

let mapleader =  " "
let g:netrw_browse_split = 2
let g:netrw_banner = 0
let g:netrw_winsize = 25

let g:ctrlp_use_caching = 0






autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd w<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>u :UndotreeShow<CR>
nnoremap <leader>pv :wincmd v<bar> :Ex <bar> :vertical resize 30<CR>
nnoremap <leader>ps :Rg<SPACE>
nnoremap <silent> <leader>+ :vertical resize +5<CR>
nnoremap <silent> <leader>- :vertical resize -5<CR>

"nnoremap <silent> <leader>gd :YcmCompleter GoTo<CR>
"nnoremap <silent> <leader>gf :YcmCompleter FixIt<CR>

nnoremap <F3> :set hlsearch!<CR>
nnoremap <leader>nd :NERDTreeToggle<CR>

map <leader>gs mawv/ <CR>"ty/ <CR>wvwh"ny/getters<CR>$a<CR><CR><Esc>xxapublic<Esc>"tpa<Esc>"npbiget<Esc>l~ea()<CR>{<CR><Tab>return<Esc>"npa;<CR>}<Esc>=<CR><Esc>/setters<CR>$a<CR><CR><Esc>xxapublic void<Esc>"npbiset<Esc>l~ea(<Esc>"tpa <Esc>"npa)<CR>{<CR><Tab>this.<Esc>"npa=<Esc>"npa;<CR>}<Esc>=<CR>`ak


