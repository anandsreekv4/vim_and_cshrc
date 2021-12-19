""""""""""""""""""""""""""""""""""""""""
" Basic vim settings
""""""""""""""""""""""""""""""""""""""""
set nocompatible            " disable compatibility to old-time vi
set showmatch               " show matching brackets.
set ignorecase              " case insensitive matching
set hlsearch                " highlight search results
set tabstop=4               " number of columns occupied by a tab character
set softtabstop=4           " see multiple spaces as tabstops so <BS> does the right thing
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              " indent a new line the same amount as the line just typed
set number                  " add line numbers
set wildmode=longest,list   " get bash-like tab completions
set cc=80                   " set an 80 column border for good coding style
set wildmenu                " visual autocomplete for completions menu
set mouse=a                 " mouse functionality for all modes
set wrap                    " quick wraps
filetype plugin indent on   " allows auto-indenting depending on file type
syntax on                   " syntax highlighting
if has("patch-7.4.354")
    set breakindent         " Indents word-wrapped lines as much as the 'parent' line
    set formatoptions=l     " Ensures word-wrap does not split words
    set lbr
endif

""""""""""""""""""""""""""""""""""""""""
" Leader
""""""""""""""""""""""""""""""""""""""""
let mapleader= " "

""""""""""""""""""""""""""""""""""""""""
" Key bindings
""""""""""""""""""""""""""""""""""""""""
noremap  <leader>w :wall!<CR>|                    " go-to method for saving in vim
inoremap jk <Esc>|                                " best way to come back to normal mode
nnoremap <leader><leader>i :set ic!<cr>|          " toggle ignorecase
nnoremap <leader><leader>r :windo set wrap!<CR>|  " toggle wrap for the whole window
nnoremap <Leader>c :let @*=expand('%:p')<CR>|     " copy full filepath of curr buff
nnoremap <Leader>d :let @*=expand('%:t:r')<CR>|   " only basename is copied
nnoremap <leader>h :cd %:p:h<CR>|                 " forcefully 'cd' into this files dir
nnoremap tk :tabnext<cr>|                         " tab settings
nnoremap tj :tabprev<cr>
nnoremap th :tabfirst<cr>
nnoremap tl :tablast<cr>|                         " FYI, the '|' at the end is ';' for the cmds that need termination
inoremap (( ()<esc>i|                             " keep track of bracket pairs
inoremap [[ []<esc>i

""""""""""""""""""""""""""""""""""""""""
" :command(s)
""""""""""""""""""""""""""""""""""""""""
command! S  :so ~/.config/nvim/init.vim
command! Q  :q
command! TN :tabe
if exists(':terminal')
    " Invoke terminal - vim8.1 and above
    command! T  :terminal
endif

""""""""""""""""""""""""""""""""""""""""
" Plugin
""""""""""""""""""""""""""""""""""""""""
call plug#begin()
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'neovim/nvim-lspconfig'
Plug 'neomake/neomake'
Plug 'jiangxincode/vim-kite'
call plug#end()

""""""""""""""""""""""""""""""""""""""""
" vhdl-tool
""""""""""""""""""""""""""""""""""""""""
if executable('vhdl-tool')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'vhdl-tool',
        \ 'cmd': {server_info->['vhdl-tool', 'lsp']},
        \ 'whitelist': ['vhdl'],
        \ 'root_uri':{server_info->lsp#utils#path_to_uri(lsp#utils#find_nearest_parent_file_directory(lsp#utils#get_buffer_path(), 'vhdltool-config.yaml'))},
        \ })
endif

autocmd FileType vhdl setlocal omnifunc=lsp#complete
