""""""""""""""""""""""""""""""""""""""""
" Basic settings
""""""""""""""""""""""""""""""""""""""""
  syntax on
  set nocompatible
  set hlsearch " hlsearch	highlight all matches for the last used search pattern
  set number " show line numbers
  set showcmd " show command in bottom bar
  set incsearch " search as characters are entered
  set wildmenu " visual autocomplete for command menu
  set showmatch
  set backspace=indent,eol,start
  set autoread " Reload files changed outside vim
  set ic
  set ch=2
  set smd
  set ru
  let &t_Co=256 " 256 bit color terminal
  set title
  set titlelen=100
  set mouse=a " Providing mouse functionality in vim
  set rnu " Relative line numbering
  set colorcolumn=85
  set cmdheight=1
  " Indendation related :
    set cindent
    set tabstop=2 
    set sw=2
    set expandtab
    set guioptions+=c

""""""""""""""""""""""""""""""""""""""""
" File type related
""""""""""""""""""""""""""""""""""""""""
  " This is for the typical file-types : 
  " Trick is not to use 'setfiletype'
  augroup filetypedetect
    autocmd BufRead,BufNewFile 
    \ *.v,*.vh,*.sv,*.svh,*.w,*.wh,*.sw,*.svpp,*.swh set filetype=verilog_systemverilog
    autocmd BufRead,BufNewFile *.vhd,*.whd set filetype=vhdl
    autocmd BufRead,BufNewFile cds.lib,hdl.var,*.txt set filetype=text
    autocmd BufRead,BufNewFile .bashrc set filetype=sh
    autocmd BufRead,BufNewFile *.scr,*.tcl set filetype=tcl
    autocmd BufRead,BufNewFile *.sgdc set filetype=sdc
    autocmd BufRead,BufNewFile *.pl,*.pm setfiletype perl
    autocmd BufRead,BufNewFile Makefile*,*.mk set filetype=make
  augroup END
  autocmd FileType conf setlocal noexpandtab
  autocmd FileType vim setlocal foldmethod=indent
  autocmd FileType sh setlocal foldmethod=syntax
  autocmd FileType perl nmap K :!perldoc -f <cword><CR>
  augroup Systemverilog
    autocmd!
    autocmd FileType verilog_systemverilog setlocal omnifunc=syntaxcomplete#Complete
  augroup END

""""""""""""""""""""""""""""""""""""""""
" Mappings
""""""""""""""""""""""""""""""""""""""""
  let mapleader = " "
  noremap  <C-S>          :update<CR>
  vnoremap  <C-S>         <C-C>:update<CR>
  inoremap  <C-S>         <C-O>:update<CR>
  inoremap jj <Esc>
  inoremap <C-j> <Backspace> " Insert mode backspace mapping
  nmap <leader>w :w!<cr> " Fast saving
  nmap <leader>i :set ic!<cr>
  " because they are too far to reach
    map B ^ 
    map E $
  " to copy full filepath of current buffer
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
    nnoremap :S<cr> :so ~/.vimrc<cr>
  " yankstack - leader p/P to cycle through kills
    nmap <leader>p <Plug>yankstack_substitute_older_paste
    nmap <leader>P <Plug>yankstack_substitute_newer_paste
  "NerdTree settings:
    nmap nr : NERDTree<cr>
    nmap nc : CtrlP<cr>
  " Insert mode keybindings
    " provide hjkl movements in Insert mode via the <Alt> modifier key
    inoremap <C-b> <left>
    inoremap <C-f> <right>
  " For C-Tags
    nnoremap <F9> :se tags=./tags;/<CR>
  " Put word under cursor into search register and highlight
    nnoremap <silent> <Leader>* 
    \ :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
    vnoremap <silent> <Leader>* :<C-U>
      \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
      \gvy:let @/=substitute(
      \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR>
      \gV:call setreg('"', old_reg, old_regtype)<CR>:set hls<CR>
  " To show module name -- sometimes works
    map <F6> ma?^\s*\<module\><CR>Wyiw'a:echo "module -->" @0<CR>
  "To enter full screen mode always --> Not working
    if has("gui_running")
      "    set fuoptions=maxvert,maxhorz
      "    au GUIEnter * set fullscreen
      set lines=999 columns=999
    endif
  " For vim version > 8.0
    command! T :terminal
  " Useful insert-mode mappings
    :inoremap ( ()<Esc>i
    :inoremap [ []<Esc>i
    :inoremap {{ {}<ESC>i
    :inoremap {<CR> {<CR>}<Esc>ko
  " Navigating through files quickly
    nnoremap gs <C-W><C-F>
    nnoremap gb <C-^>

""""""""""""""""""""""""""""""""""""""""  
" VUNDLE
""""""""""""""""""""""""""""""""""""""""  
  so ~/.vim/plugins.vim 
  filetype off
  set rtp+=~/.vim/bundle/Vundle.vim
  call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'vim-airline/vim-airline'
    Plugin 'vim-airline/vim-airline-themes'
    Plugin 'mattn/emmet-vim'
    Plugin 'scrooloose/nerdtree'
    Plugin 'tpope/vim-eunuch'
    Plugin 'tpope/vim-surround'
    Plugin 'fugitive.vim'
    Plugin 'tpope/vim-sensible'
    Plugin 'kevingoodsell/vim-csexact'
    Plugin 'tomasr/molokai'
    Plugin 'morhetz/gruvbox'
    Plugin 'godlygeek/tabular'
    Plugin 'altercation/vim-colors-solarized'
    Plugin 'easymotion/vim-easymotion'
    Plugin 'junegunn/fzf'
    Plugin 'yggdroot/indentline'
    Plugin 'maxbrunsfeld/vim-yankstack'
    Plugin 'tpope/vim-commentary'
    Plugin 'jmcneal/verilog-support'
    Plugin 'zhuzhzh/verilog_emacsauto.vim' 
    Plugin 'vhda/verilog_systemverilog.vim' 
    Plugin 'w0rp/ale' 
    Plugin 'msanders/snipmate.vim'
    Plugin 'juneedahamed/svnj.vim'
    Plugin 'lifepillar/vim-solarized8'
    Plugin 'chrisbra/csv.vim'
  call vundle#end()

    "Plugin 'kien/rainbow_parentheses.vim'
    "Plugin 'editorconfig/editorconfig-vim'
    "Plugin 'copypath.vim'
    "Plugin 'terryma/vim-multiple-cursors'
    "Plugin 'ctrlp.vim'
    "Plugin 'xemacs-colorscheme'
    "Plugin 'scrooloose/syntastic'
    "Plugin 'jimmysitu/vtags'
    "Plugin 'nathanaelkane/vim-indent-guides'
    
  filetype plugin indent on

""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""
  " airline theme
    let g:airline_theme='term_light'
    " let g:airline#extensions#tabline#enabled=1

  " ale setting
    " au FileType systemverilog
      let g:ale_verilog_verilator_options = '-sv -I$PWD --default-language "1800-2012"'
      inoremap  <C-]> <C-[>:ALEComplete<CR>
      let g:ale_linters = {'verilog_systemverilog' : ['verilator'],}
      let g:ale_linter_aliases = {'verilog_systemverilog': 'verilog' }
    " completionabled = 1
  " NerdTree
    "nmap nr :NERDTreeToggle %:p<CR>
    let NERDTreeDirArrows=0
    let g:NERDTreeGlyphReadOnly = "RO"
    let g:NERDTreeNodeDelimiter = '$'
  " Syntastic related changes
    "  set statusline+=%#warningmsg#
    "  set statusline+=%{SyntasticStatuslineFlag()}
    "  set statusline+=%*
    "  let g:syntastic_always_populate_loc_list = 1
    "  let g:syntastic_auto_loc_list = 1
    "  let g:syntastic_check_on_open = 1
    "  let g:syntastic_check_on_wq = 0
  " Matchit: Experiment for SV
    runtime macros/matchit.vim
    " No need for below lines if verilog ft has definitions
    " if exists('loaded_matchit')
    "   let b:match_ignorecase=0
    "   let b:match_words=
    "     \ '\<begin\>:\<end\>,' .
    "     \ '\<if\>:\<else\>,' .
    "     \ '\<module\>:\<endmodule\>,' .
    "     \ '\<class\>:\<endclass\>,' .
    "     \ '\<program\>:\<endprogram\>,' .
    "     \ '\<clocking\>:\<endclocking\>,' .
    "     \ '\<property\>:\<endproperty\>,' .
    "     \ '\<sequence\>:\<endsequence\>,' .
    "     \ '\<package\>:\<endpackage\>,' .
    "     \ '\<covergroup\>:\<endgroup\>,' .
    "     \ '\<primitive\>:\<endprimitive\>,' .
    "     \ '\<specify\>:\<endspecify\>,' .
    "     \ '\<generate\>:\<endgenerate\>,' .
    "     \ '\<interface\>:\<endinterface\>,' .
    "     \ '\<function\>:\<endfunction\>,' .
    "     \ '\<task\>:\<endtask\>,' .
    "     \ '\<case\>\|\<casex\>\|\<casez\>:\<endcase\>,' .
    "     \ '\<fork\>:\<join\>\|\<join_any\>\|\<join_none\>,' .
    "     \ '`ifdef\>:`else\>:`endif\>,'
    "     \ '`ifndef\>:`define\>:`endif\>,'
    " endif
  " Gruvbox
  " rainbow_parenthesis
    " au VimEnter * RainbowParenthesesToggle
    " au Syntax * RainbowParenthesesLoadRound
    " au Syntax * RainbowParenthesesLoadSquare
    " au Syntax * RainbowParenthesesLoadBraces

""""""""""""""""""""""""""""""""""""""""
" Misc
""""""""""""""""""""""""""""""""""""""""
  "24 Mar:
  "set clipboard=unnamedplus
  "Another expt:
  map <F7> :w !xclip<CR><CR>
  vmap <F7> "*y
  map <S-F7> :r!xclip -o<CR>
  "Trying out for getting atleast vim8.1

  "set helpfile+=$VIMRUNTIME/doc/help.txt
  "set rtp+=~/.local/usr/local/share/vim/vim81/
  "hi

  " --> FUNCTION KEY MAPPINGS
  """map <F12> :set wrap!<CR>
  """" Persistent folds bw vim sessions
  """set foldmethod=manual
  """augroup AutoSaveFolds
  """  autocmd!
  """  autocmd BufWinLeave * mkview
  """  autocmd BufWinEnter * silent loadview
  """augroup END

  "let $VIM = $HOME . "/vim82/usr/local/"
  "let $VIMRUNTIME = $HOME . "/vim81/usr/local/share/vim/vim81"
  "set runtimepath^=$VIMRUNTIME
  "set helpfile=$VIMRUNTIME/doc/help.txt
  "set rtp+=~/.local/usr/local/share/vim/vim81/
  "if &t_Co > 2 || has("gui_running")
  "endif 
  
  " Trying a fix for variation of color in vimux
    " use 256 colors in terminal
      if !has("gui_running")
        " set &t_Co=256
        " set &term=xterm-256color
        " set term=screen-256color
        " set term=xterm-256color
      endif

  " Enable true color -- ABSOLUTELY CRUCIAL
  " if exists('+termguicolors')
       let &t_8f =  "\<Esc>[38;2;%lu;%lu;%lum"
       let &t_8b =  "\<Esc>[48;2;%lu;%lu;%lum"
    "   set t_Co=256
        set term=xterm-16color
        set notermguicolors " I give up!
        colorscheme gruvbox " color scheme
        se bg=dark
    " endif
