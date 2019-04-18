#
# Default user .cshrc file
# 
# Usage:  Copy this file to a user's home directory and edit it to
# customize it to taste.  It is run by csh each time it starts up.
#
# Modified 981209 jsin
# Modified 981001 djo based on originals from dhynson 


#source /tools/bin/common.cshrc
source /tools/stabflow/iot/cshrc.iot

limit coredumpsize 0

setenv HOME2 /projects/work/ansn
setenv EDITOR vi
setenv PAGER less
setenv LPDEST lp
setenv TERM xterm-256color
#setenv PATH $HOME2/python/Python-2.7.11/:$PATH
#setenv PYTHONPATH $HOME2/python/Python-2.7.11
#setenv PATH $HOME/.local/bin:$PATH
#setenv PATH $HOME2/python3/Python-3.8.0a1/:$PATH
#setenv PATH $HOME/.local/usr/local/bin/:$PATH
#setenv PATH $HOME/.local/usr/local/share/vim/vim81:$PATH


setenv PREFIX $HOME2/usr
setenv PKG_CONFIG_PATH $PREFIX/lib/pkgconfig


#######################################
#PERSONAL CUSTOMIZATION BELOW THIS LINE
#######################################
#alias lg ".local/usr/local/bin/gvim"
#alias lvim ".local/usr/local/bin/vim"
#alias python "/projects/work/ansn/python/Python-2.7.11/python"
alias tm "~/.local/bin/tmux"
alias l "ls -altrh"
alias g gvim
alias h history
alias c clear
alias rm "rm -i"
#alias cp "cp -i"
alias mv "mv -i"
alias b5 "bsub -I -R 'rusage[memswap=10000,mem=5000]'"
alias b10 "bsub -I -R 'rusage[memswap=10000,mem=10000]'"
alias b20 "bsub -I -R 'rusage[memswap=10000,mem=20000]'"
alias b30 "bsub -I -R 'rusage[memswap=10000,mem=30000]'"
alias b60 "bsub -I -R 'rusage[mem=60000]'"
alias lkonsole "b30 konsole &"
alias lterminal "b30 gnome-terminal &"
alias lxterm   "b30 xterm &"
alias sf 'find `pwd` -type f -iname "\!:1" -print'
alias sd 'find `pwd` -type d -iname "\!:1" -print'

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
alias svv 'cd /gpfs/iot/projects/BCM4350/work/anand/SystemVerilog_prac/labs/128641/svv_labs'
alias wv 'bsub -q normal gmake RTL_TOOL=novas configsim.debussy COMP64=1 &'
alias clob 'gmake clobber'
alias full_std_nc_comp_elab 'bsub -I gmake compile RTL_TOOL=ncsim COMP64=1 | & tee comp_log && bsub -I gmake elaborate RTL_TOOL=ncsim COMP64=1 | & tee elab_log &'
alias full_clob_std_nc_compile 'gmake clobber && bsub -I gmake compile RTL_TOOL=ncsim COMP64=1 | & tee comp_log && bsub -I gmake elaborate RTL_TOOL=ncsim COMP64=1 | & tee elab_log   &&  echo "Compile done " | mailx -S "Compile done" ansn@cypress.com '
alias full_clob_std_nc_compile_verdi 'gmake clobber && bsub -I gmake compile RTL_TOOL=ncsim COMP64=1 | & tee comp_log && bsub -I gmake elaborate RTL_TOOL=ncsim COMP64=1 | & tee elab_log && bsub -I gmake compile RTL_TOOL=novas COMP64=1 | & tee novas_log  && echo "Compile done " | mailx -S "Compile done" ansn@cypress.com '
alias verdi_compile 'bsub -I gmake compile RTL_TOOL=novas COMP64=1 | & tee novas_log  &'
alias open_verdi 'bsub -I -q normal_35 gmake configsim.debussy RTL_TOOL=novas COMP64=1 &'
alias pansn 'cd /projects/CYW55909/users/ansn'
alias h2ansn 'cd /projects/CYW55560/users/ansn'
alias pgall 'cd /projects/CYW55909/\!:1'
alias 69gall 'cd /projects/BCM4369/\!:1'
alias 69gall 'cd /projects/BCM4369/gallery_frontend_B0_CY_4/'
alias pgall2111 'cd /projects/CYW55909/gallery_frontend_2111/sim/chipsim' 
alias h2gall5Mar 'cd /projects/CYW55560/gallery_frontend_5thMarch2019/sim/chipsim' 
###############TEMPORARY COMPILE FLOW ##################
alias px2111_comp 'gmake clobber && bsub -I gmake compile RTL_TOOL=ncsim COMP64=1 STUB_BTFM=1 | & tee comp_log && bsub -I gmake elaborate RTL_TOOL=ncsim COMP64=1 STUB_BTFM=1 | & tee elab_log &'
alias pjira 'cd /projects/CYW55909/users/dv_jira'
alias h2jira 'cd /projects/CYW55560/users/dv_jira'
alias h2ref 'cd /projects/CYW55560/users/dv_reference'
alias skip_audio_full_compile 'bsub -I -q normal_35 gmake compile RTL_TOOL=ncsim COMP64=1  SKIP_AUDIO_FL_GEN=1 | & tee compile_log && bsub -I -q normal_35 gmake force-elaborate RTL_TOOL=ncsim COMP64=1 | & tee elab_log ' 
alias test 'gmake RTL_TOOL=ncsim COMP64=1 '

################UI CHANGE#######
#set prompt="%m %B%/%b >" -->Old
#set prompt="%{\033[1;4;31m%}%m%{\033[0;31m%}%{\033[1;31m%}: %{\033[4;32m%}%~ \%%{\033[0m%} "
#set prompt="%{\033[1;4;32m%}%m%{\033[0;32m%}%{\033[1;32m%}: %{\033[4;31m%}%~ \%%{\033[0m%} "
#set prompt="%{\033[1;32m%}[ %{\033[4;31m%}%~ \]%{\033[0m%} "
set prompt="%{\033[1;31m%}[ %{\033[4;32m%}%~ %{\033[1;31m%}\]%{\033[0m%} "
set color
#setenv GREP_OPTIONS '--color=auto'; 
#setenv GREP_COLOR '00;38;5;226'; 
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

alias precmd 'echo -n "\033]0;`pwd | rev | cut -d/ -f1,2 | rev`\a"'

source ~/.alias
#########TEMPORARY DIRECTORY SC########
alias h2dvref 'cd /projects/CYW55560/users/dv_reference'



#################git related#############
alias gis git status | more
