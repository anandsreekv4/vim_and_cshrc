#source /tools/bin/common.cshrc
source /tools/stabflow/iot/cshrc.iot

limit coredumpsize 0

################################################################################
# General Env
################################################################################
setenv TERM screen-256color
setenv SHELL /bin/tcsh
setenv HOME2 /projects/work/ansn
setenv EDITOR vi
setenv PAGER less
setenv LPDEST lp
setenv CDSVER INCISIVE15.20.042
########################################
# path
########################################
  setenv PATH $HOME2/.local/bin:$PATH
  setenv PATH $HOME/.local/bin:$PATH
  setenv PATH /tools/apps/local/vim/latest/bin:$PATH
  setenv PATH /projects/CYW55560/work/scripts:$PATH
  setenv PATH /projects/CYW55560/work/scripts/keep_copy_script:$PATH
  setenv PATH $HOME/scripts:$PATH
  #setenv PATH $HOME2/python/Python-2.7.11/:$PATH
  #setenv PYTHONPATH $HOME2/python/Python-2.7.11
  #setenv PATH $HOME2/python3/Python-3.8.0a1/:$PATH
  #setenv PATH $HOME/.local/usr/local/bin/:$PATH
  #setenv PATH $HOME/.local/usr/local/share/vim/vim81:$PATH

  # File Path vars
    setenv h2 "/projects/CYW55560/users/ansn"
    setenv h2b "/projects/CYW55560/"

  # Misc
    setenv PREFIX $HOME2/usr
    setenv PKG_CONFIG_PATH $PREFIX/lib/pkgconfig
    setenv PKG_CONFIG_PATH /usr/share/pkgconfig/:$PKG_CONFIG_PATH

#######################################
#PERSONAL CUSTOMIZATION BELOW THIS LINE
#######################################
#alias lg ".local/usr/local/bin/gvim"
alias vi '\vim'
alias vim "gvim -v"
#alias python "/projects/work/ansn/python/Python-2.7.11/python"
alias tm  "~/.local/bin/tmux"
alias l  	"ls -altrh"
alias g   "gvim -geometry 1336x744 "
alias h   "history | tail"
alias h20 "history | tail -20"
alias h40 "history | tail -40"
alias c clear
alias rm "rm -i"
#alias cp "cp -i"
alias mv "mv -i"
alias b5 "bsub -I -R 'rusage[memswap=10000,mem=5000]'"
alias b10 "bsub -I -R 'rusage[memswap=10000,mem=10000]'"
alias b20 "bsub -I -R 'rusage[memswap=10000,mem=20000]'"
alias b30 "bsub -I -R 'rusage[memswap=10000,mem=30000]'"
alias b60 "bsub -I -R 'rusage[mem=60000]'"
alias b64 "bsub -I -R 'rusage[mem=64000]'"
alias b128 "bsub -I -R 'rusage[mem=128000]'"
alias cnc "b128 gmake compile RTL_TOOL=ncsim |& tee comp.ncsim"
alias cverdi "b128 gmake compile RTL_TOOL=novas |& tee comp.verdi"
alias lkonsole "b30 konsole &"
alias lterminal "b30 gnome-terminal &"
alias lxterm   "b30 xterm &"
alias sf 'find `pwd` -type f -iname "\!:1" -print'
alias sd 'find `pwd` -type d -iname "\!:1" -print'
unalias cd
alias cdl "cd \!*;ls"
alias b32i 'bsub -q normal -Ip -R "rusage[mem=32000]"'
alias b48i 'bsub -q normal -Ip -R "rusage[mem=48000]"'
alias b72i 'bsub -q normal -Ip -R "rusage[mem=72000]"'
alias b144i 'bsub -q normal -Ip -R "rusage[mem=144000]"'
alias ww  'cd /projects/BCM4350/work/anand '
alias gw 'cd /projects/CYW55909/users/ansn/workspace '
alias pw 'cd /gpfs7/fs1/CYW55909/users/ansn/phoenix_tcpwm'
alias pw8/1 'cd /gpfs7/fs1/CYW55909/users/ansn/phx_tcpwm8th_Jan/CYW55909/'
#alias status 'cd /gpfs7/fs1/CYW55909/users/ansn/weekly_status'
alias status 'cd /projects/BCM4350_ext/work/ansn/status'
alias svvv 'cd /gpfs/iot/projects/BCM4350/work/anand/SystemVerilog_prac/labs/128641/svv_labs'
alias svv 'cd /gpfs/iot/projects/BCM4350/work/anand/Mentor_sv_training/'
alias wv 'bsub -q normal gmake RTL_TOOL=novas configsim.debussy COMP64=1 &'
alias clob 'gmake clobber'
alias full_std_nc_comp_elab 'b128 gmake compile RTL_TOOL=ncsim COMP64=1 | & tee comp_log && b128 gmake force-elaborate RTL_TOOL=ncsim COMP64=1 | & tee elab_log &'
alias full_clob_std_nc_compile 'gmake clobber && b128 gmake compile RTL_TOOL=ncsim COMP64=1 | & tee comp_log && b128 gmake force-elaborate RTL_TOOL=ncsim COMP64=1 | & tee elab_log   &&  echo "Compile done @ `pwd` " | mailx -S "Compile done" ansn@cypress.com '
alias full_clob_std_nc_compile_bt 'gmake clobber && b128 gmake compile RTL_TOOL=ncsim STUB_BTFM=1 | & tee comp_log && b128 gmake force-elaborate RTL_TOOL=ncsim STUB_BTFM=1 | & tee elab_log   &&  echo "Compile done @ `pwd` " | mailx -S "Compile done" ansn@cypress.com '
alias full_clob_std_nc_compile_verdi 'gmake clobber && b128 gmake compile RTL_TOOL=ncsim COMP64=1 | & tee comp_log && b128 gmake force-elaborate RTL_TOOL=ncsim COMP64=1 | & tee elab_log && b128 gmake compile RTL_TOOL=novas COMP64=1 | & tee novas_log  && echo "Compile done " | mailx -S "Compile done" ansn@cypress.com '
alias full_clob_std_nc_compile_verdi_bt 'gmake clobber && b128 gmake compile RTL_TOOL=ncsim STUB_BTFM=1 | & tee comp_log && b128 gmake force-elaborate RTL_TOOL=ncsim STUB_BTFM=1 | & tee elab_log && b128 gmake compile RTL_TOOL=novas STUB_BTFM=1 | & tee novas_log  && echo "Compile done " | mailx -S "Compile done" ansn@cypress.com '
alias verdi_compile 'b128 gmake compile RTL_TOOL=novas COMP64=1 | & tee novas_log  &'
alias open_verdi 'b128 -q normal_35 gmake configsim.debussy RTL_TOOL=novas COMP64=1 &'
alias open_verdi_play 'b128 -q normal_35 gmake configsim.debussy RTL_TOOL=novas COMP64=1 '
alias open_simv 'b128 -q normal_35 gmake configsim.gui RTL_TOOL=ncsim COMP64=1 &'
alias gmti "b128 gmake compile RTL_TOOL=mti MTI_USE_LATEST=1 COMP64=1 |& tee complog_mti_1.log "
alias pansn 'cd /projects/CYW55909/users/ansn'
alias h2ansn 'cd /projects/CYW55560/users/ansn'
alias pgall 'cd /projects/CYW55909/\!:1'
alias 69gall 'cd /projects/BCM4369/\!:1'
alias 69gall 'cd /projects/BCM4369/gallery_frontend_B0_CY_4/'
alias pgall2111 'cd /projects/CYW55909/gallery_frontend_2111/sim/chipsim' 
alias h2gall5Mar 'cd /projects/CYW55560/gallery_frontend_5thMarch2019/sim/chipsim' 
###############TEMPORARY COMPILE FLOW ##################
alias px2111_comp 'gmake clobber && b128 gmake compile RTL_TOOL=ncsim COMP64=1 STUB_BTFM=1 | & tee comp_log && b128 gmake elaborate RTL_TOOL=ncsim COMP64=1 STUB_BTFM=1 | & tee elab_log &'
alias pjira 'cd /projects/CYW55909/users/dv_jira'
alias h2jira 'cd /projects/CYW55560/users/dv_jira'
alias h2ref 'cd /projects/CYW55560/users/dv_reference'
alias skip_audio_full_compile 'b128 -q normal_35 gmake compile RTL_TOOL=ncsim COMP64=1  SKIP_AUDIO_FL_GEN=1 | & tee compile_log && b128 -q normal_35 gmake force-elaborate RTL_TOOL=ncsim COMP64=1 | & tee elab_log ' 
alias test 'gmake RTL_TOOL=ncsim COMP64=1 '

################UI CHANGE#######
#set prompt="%m %B%/%b >" -->Old
#set prompt="%{\033[1;4;31m%}%m%{\033[0;31m%}%{\033[1;31m%}: %{\033[4;32m%}%~ \%%{\033[0m%} "
#set prompt="%{\033[1;4;32m%}%m%{\033[0;32m%}%{\033[1;32m%}: %{\033[4;31m%}%~ \%%{\033[0m%} "
#set prompt="%{\033[1;32m%}[ %{\033[4;31m%}%~ \]%{\033[0m%} "

################################################################################
# Prompt
################################################################################
set prompt="%{\033[1;31m%}[ %{\033[4;32m%} `hostname` @ %~ %{\033[1;31m%}] \n%{\033[4;36m%}--> %{\033[0m%} "
unalias precmd
alias precmd 'echo -n "\033]0;`pwd | rev | cut -d/ -f1,2,3 | rev`\a";source ~/setPrompt.csh'
bindkey -e # Set vi mode for prompt in TCSH
alias src "source ~/.cshrc"

###########ENDOFMOD#####
set filec
set autolist
#set addsuffix
set complete = enhance
#set CDN_MAX=100

#source ~/setenv.bcm4349
#source ~/setenv.bcm4372

#set ignoreeof


#set MHOME = "/home/smah"
#source $MHOME/cdl_cshrc


source ~/.alias
#########TEMPORARY DIRECTORY SC########
alias h2dvref 'cd /projects/CYW55560/users/dv_reference'



#################git related#############
alias gis "git -c color.ui=always status  | more "
alias gid "git difftool"
alias gido "git difftool \!:1^ \!:1"
alias mgiti "bsub -I mgit clone wlangit@wlangit.aus.cypress.com:\!:1/\!:1 \!:2"
#########################TMUX related$$$$$$$$$$
alias tma "~/.local/bin/tmux attach-session -t"
unsetenv GREP_OPTIONS
unsetenv GREP_COLOR
alias grep "grep --color=auto"
alias gg 'grep -iPrn  "\!:1" \!:2' #comprehensive and faster grep


alias mailjob  'echo "command_done in `pwd`" | mailx -S command_done_at__`pwd` ansn@cypress.com'
alias hgrep "history | grep"


alias bjobs 'bjobs -w'
alias uvmv 'cd /gpfs/iot/projects/BCM4350/work/anand/Mentor_UVM_training/uvm_labs'
##############Checking licenses#########
alias lic_verdi 'lmstat -a -c /proj/lic_vault/golden/lic_vault/snpslmd-design-prod-wan/license.dat -f Verdi'
#################### For c cases debug #######
alias cdebug "fromelf -a -c -d \!:1.exe > \!:1.diss; ~ayko/new_scripts/debug_tarmac.pl \!:1.diss \!:1.eis > \!:1.debug;g \!:1.debug"
################### For RTL updates on generated files ##########
alias compare "git stash && clob && gf && keep cp && git stash apply && clob && gf && keep comp &"

################### Hatchet2 specific ############################
alias tessent_vis 'cd /projects/CYW55560/users/ansn/Tessent_top; b128 tessent -shell  -tesvis -dof run_tessent -log logfiles/1.log -replace'

########################################################################
# gf for spyglass  
########################################################################
alias gfspgl 'set wd=`pwd`;bsub -I -q normal_35 gmake file_list FILELIST_PREFIX=`dirname $wd` | & tee gfspg.log'
alias gfm '~/scripts/mail-after gf'
alias gncfm '~/scripts/mail-after gncf'
alias open_spy 'b128 gmake COMP64=1 RTL_TOOL=spyglass configsim.gui &'
alias gpsy 'bsub -I gmake RTL_TOOL=spyglass compile SPYGLASS_GOALS=initial_rtl/lint/lint_rtl | & tee gspy.log'
alias gpsycdc 'b128 make compile RTL_TOOL=spyglass SPYGLASS_GOALS=initial_rtl/cdc/clock_reset_integrity,initial_rtl/cdc/cdc_verify_struct | & tee gspycdc.log'
alias lic_syn 'lmstat -a -c /proj/lic_vault/golden/lic_vault/snpslmd-aus-prod-wan/license.dat'
alias lic_cdn 'lmstat -a -c /proj/lic_vault/golden/lic_vault/cdslmd-aus-prod-wan/license.dat'
alias lic_men 'lmstat -a -c /proj/lic_vault/golden/lic_vault/mgcld-aus-prod-wan/license.dat'
alias spy '/tools/apps/local/synopsys/SpyGlass-M2017.03-SP2/SPYGLASS_HOME/bin/spyglass'
alias spyl '/tools/apps/synopsys/SpyGlass-O2018.09-SP1/SPYGLASS_HOME/bin/spyglass'
alias ff 'find . -iname "\!:1"'
setenv LM_LICENSE_FILE  /proj/lic_vault/golden/lic_vault/tmald-india-prod-wan/license.dat
setenv SNPSLMD_LICENSE_FILE  /proj/lic_vault/golden/lic_vault/snpslmd-design-prod-wan/license.dat
setenv SKIP_PLATFORM_CHECK  1

########################################################################
# To ensure delete does not insert tilde
########################################################################

bindkey "^[[3~" delete-char

#if ($?COLORTERM) then
#   if ($COLORTERM == "gnome-terminal") then
#      setenv TERM gnome
#   endif
#endif
#
#if ($?TERM) then
#   if ($TERM == "gnome") then
#      setenv TERMCAP \
#       "`infocmp -C gnome | grep -v '^#' | tr '\n\t' '  ' | sed 's/\\  //g' | sed s/::/:/g`"
#      bindkey "^?" delete-char
#      bindkey "^[^?" delete-word
#      bindkey "\377" delete-word
#   endif
#endif
#
#set KBS=`tput kbs`
#if (${%KBS} == 1) then 
#   stty erase $KBS
#endif


# diffr -- another diff method recommended by smah
set MHOME = "/home/smah"

alias diffr "diff -b -r -X $MHOME/tmp/diffr.files -I 'Generated on ' -I 'Created on:' -I 'Generated by:' -I '--  on ' -I '-- On: ' -I 'Header: ' -I 'Source:' -I 'Project:' -I 'Id:' -I 'DO NOT EDIT THIS FILE' -I '^-- Do Not Edit this file' -I '^-- on ' -I '^--  on '  -I '^-- Input files from ' -I '^// on' -I '^<!\-\- on' -I '^## on' -I '^# on' -I '^-- Started soccomp' -I '^// Started soccomp' -I '^#  on' -I '^-- ON ' -I '^-- On: '   -I '^-- COPYRIGHT'  -I '^--  COPYRIGHT' -I '^--   Copyright ' -I '^//  Copyright ' -I '^--  Copyright ' -I '^  -- .Id'  -I '^-- .Id' -I '^--   .Id'  -I '^# .Id' -I '^#.Id'  -I '^#  Copyright '  -I '^-- By vhdl_component_gen' -I '^RCS file: /projects/cvsroot' -I '^//.Id' -I '^// File' -I '^// Author' -I '^// Date' -I '^// Version' -I ^~=+-~ \!* -I '^\s*//.*' -I '^\s*--.*' -I '^\s*.*/projects/.*' -I '^\s*#.*' "
#| sed 's/^diff -b -r -X .*-I .^~=+-~./diff -b/g' "
      
set q = "/tools/apps/mentor/questasim_10.7e_2/questasim/bin"

# Proxy settings to access internet
setenv http_proxy corp-webw105.cysemi.com:74 
setenv https_proxy corp-webw105.cysemi.com:74 

