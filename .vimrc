"let $VIM = $HOME . "/vim82/usr/local/"
au! BufRead,BufNewFile *.v,*.vh,*.sv,*.svh,*.w,*.wh,*.sw,*.svpp setfiletype systemverilog
au! BufRead,BufNewFile *.vhd,*.whd setfiletype vhdl
au! BufRead,BufNewFile cds.lib setfiletype text
"let $VIMRUNTIME = $HOME . "/vim81/usr/local/share/vim/vim81"
"set runtimepath^=$VIMRUNTIME
"set helpfile=$VIMRUNTIME/doc/help.txt
"set rtp+=~/.local/usr/local/share/vim/vim81/
set nocompatible
"if &t_Co > 2 || has("gui_running")
"endif

"basic settings
syntax on
set hlsearch
set number " show line numbers
set showcmd " show command in bottom bar
set incsearch " serch as characters are entered
"filetype indent on " loadfiletype -specific indent file
set wildmenu " visual autocomplete for command menu
set showmatch
set backspace=indent,eol,start
set autoread      " Reload files changed outside vim

"Mappings
noremap  <C-S>          :update<CR>
vnoremap  <C-S>         <C-C>:update<CR>
inoremap  <C-S>         <C-O>:update<CR>
map B ^
map E $
inoremap jj <Esc>
inoremap <C-j> <Backspace>
"nnoremap $ <nop>
"nnoremap ^ <nop>

"set lsp=2
set ic
set ch=2
set smd
set ru
let &t_Co=256
set title
set titlelen=100
au BufRead,BufNewFile *.scr set syntax=tcl
"autocmd BufEnter * if &modifiable | NERDTreeFind | wincmd p | endif
"autocmd BufEnter * lcd %:p:h
"set autochdir
"set guifont=-b&h-lucidatypewriter-medium-r-normal-sans-12-120-75-75-m-70-iso8859-1
"set guifont=-dec-terminal-medium-r-normal--14-140-75-75-c-80-iso8859-1
map <F12> :echo 'Time is::' . strftime('%c')<CR>

"NerdTree settings:
nmap nr : NERDTree<cr>
nmap nc : CtrlP<cr>
"nmap nr :NERDTreeToggle %:p<CR>
let NERDTreeDirArrows=0
let g:NERDTreeGlyphReadOnly = "RO"
let g:NERDTreeNodeDelimiter = '$'
" VUNDLE
so ~/.vim/plugins.vim 
filetype off
set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'editorconfig/editorconfig-vim'
Plugin 'itchyny/lightline.vim'
Plugin 'mattn/emmet-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'tpope/vim-eunuch'
Plugin 'tpope/vim-surround'
Plugin 'ctrlp.vim'
Plugin 'xemacs-colorscheme'
Plugin 'fugitive.vim'
Plugin 'copypath.vim'
Plugin 'tpope/vim-sensible'
Plugin 'kevingoodsell/vim-csexact'
"Plugin 'scrooloose/syntastic'
Plugin 'tomasr/molokai'
Plugin 'morhetz/gruvbox'
Plugin 'godlygeek/tabular'
Plugin 'altercation/vim-colors-solarized'
Plugin 'nathanaelkane/vim-indent-guides'                 " NOTE: <leader>ig used for using indent-guide
Plugin 'w0rp/ale'
Plugin 'zhuzhzh/verilog_emacsauto.vim'
"Plugin 'jimmysitu/vtags'
Plugin 'kien/rainbow_parentheses.vim'
Plugin 'easymotion/vim-easymotion'
call vundle#end()
filetype plugin indent on

" Indendation related basic settings:
set cindent
set tabstop=2 
set sw=2
set expandtab
"set cino=e2,p0,t0

" File type related:
au BufRead,BufNewFile *.scr set filetype=tcl
au BufRead,BufNewFile *.tcl set filetype=tcl
au! BufRead,BufNewFile *.pl,*.pm setfiletype perl
au! BufRead,BufNewFile Makefile*,*.mk setfiletype make
"au BufRead,BufNewFile *.sv, *.svh ,*.vh ,*.v set syntax=verilog_systemverilog
"au BufNewFile,BufRead *.sv,*.svh,*.vh,*.v so ~/.vim/syntax/verilog_systemverilog.vim
"au BufRead,BufNewFile *.sv set filetype=verilog_systemverilog
"au BufRead,BufNewFile *.svh set filetype=verilog_systemverilog
"au BufRead,BufNewFile *.vh set filetype=verilog_systemverilog
"au BufRead,BufNewFile *.v set filetype=verilog_systemverilog

au! BufRead,BufNewFile *.v,*.vh,*.sv,*.svh,*.w,*.wh,*.sw,*.svpp setfiletype systemverilog
au! BufRead,BufNewFile *.vhd,*.whd setfiletype vhdl
au! BufRead,BufNewFile cds.lib setfiletype text
autocmd FileType conf setlocal noexpandtab
filetype plugin indent on


set guioptions+=c

""Other configs 7Mar2019
" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = " "
" Fast saving
nmap <leader>w :w!<cr>
nmap <leader>i :set ic!<cr>
"to copy full filepath of current buffer
nnoremap <Leader>c :let @*=expand('%:p')<CR>
nnoremap <Leader>d :let @*=expand('%:t:r')<CR>
nnoremap <leader>h :cd %:p:h<CR>
" Related to tabs
nnoremap tk :tabnext<cr>
nnoremap tj :tabprev<cr>
nnoremap th :tabfirst<cr>
nnoremap tl :tablast<cr>
command! Q  :q
command! TN :tabnew
cabbr W! w!
nnoremap :W<cr> :w<cr>



" Experiment for SV
if exists('loaded_matchit')
let b:match_ignorecase=0
let b:match_words=
\ '\<begin\>:\<end\>,' .
\ '\<if\>:\<else\>,' .
\ '\<module\>:\<endmodule\>,' .
\ '\<class\>:\<endclass\>,' .
\ '\<program\>:\<endprogram\>,' .
\ '\<clocking\>:\<endclocking\>,' .
\ '\<property\>:\<endproperty\>,' .
\ '\<sequence\>:\<endsequence\>,' .
\ '\<package\>:\<endpackage\>,' .
\ '\<covergroup\>:\<endgroup\>,' .
\ '\<primitive\>:\<endprimitive\>,' .
\ '\<specify\>:\<endspecify\>,' .
\ '\<generate\>:\<endgenerate\>,' .
\ '\<interface\>:\<endinterface\>,' .
\ '\<function\>:\<endfunction\>,' .
\ '\<task\>:\<endtask\>,' .
\ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
\ '\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,' .
\ '`ifdef\>:`else\>:`endif\>,'
\ '`ifndef\>:`define\>:`endif\>,'
endif

" Providing mouse functionality in vim
set mouse=a

" Syntastic related changes

  "  set statusline+=%#warningmsg#
  "  set statusline+=%{SyntasticStatuslineFlag()}
  "  set statusline+=%*

  "  let g:syntastic_always_populate_loc_list = 1
  "  let g:syntastic_auto_loc_list = 1
  "  let g:syntastic_check_on_open = 1
  "  let g:syntastic_check_on_wq = 0

"24 Mar:
"set clipboard=unnamedplus
colorscheme gruvbox " color scheme
"
"TO enter full screen mode always --> Not working
if has("gui_running")
 "    set fuoptions=maxvert,maxhorz
 "    au GUIEnter * set fullscreen
     set lines=999 columns=999
 endif

"Another expt:
map <F7> :w !xclip<CR><CR>
vmap <F7> "*y
map <S-F7> :r!xclip -o<CR>
"Trying out for getting atleast vim8.1

"set helpfile+=$VIMRUNTIME/doc/help.txt
"set rtp+=~/.local/usr/local/share/vim/vim81/
"hi
set bg=light
" Put word under cursor into search register and highlight
 nnoremap <silent> <Leader>* :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
 vnoremap <silent> <Leader>* :<C-U>
   \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
     \gvy:let @/=substitute(
       \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR>
         \gV:call setreg('"', old_reg, old_regtype)<CR>:set hls<CR>


map <F6> ma?^\s*\<module\><CR>Wyiw'a:echo "module -->" @0<CR>

"NEW MAPPINGS PERTAINING TO VIM8.1 updatea
command! T :terminal

" --> FUNCTION KEY MAPPINGS
"""map <F12> :set wrap!<CR>
"""" Persistent folds bw vim sessions
"""set foldmethod=manual
"""augroup AutoSaveFolds
"""  autocmd!
"""  autocmd BufWinLeave * mkview
"""  autocmd BufWinEnter * silent loadview
"""augroup END

" Insert mode keybindings
" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <C-d> <left>
inoremap <C-f> <right>
"""inoremap <A-k> <C-o>k
"""inoremap <A-l> <C-o>l
"For C-Tags
nnoremap <F9> :se tags=./tags;/<CR>

" This is for the typical file-types : 
" Trick is not to use setfiletype

augroup filetypedetect
  autocmd BufRead,BufNewFile *.v,*.vh,*.sv,*.svh,*.w,*.wh,*.sw,*.svpp :set filetype=systemverilog
  autocmd BufRead,BufNewFile *.vhd,*.whd :set filetype=vhdl
  autocmd BufRead,BufNewFile cds.lib,hdl.var,*.txt :set filetype=text
augroup END
