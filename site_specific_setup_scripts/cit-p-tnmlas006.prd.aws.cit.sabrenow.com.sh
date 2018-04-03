#!/bin/bash

if [ $TTY == 0 ]; then
    printf 'Running aws setups !!\n'
fi


# vm(){
#     source $HOME/vpy3/bin/activate
# }

# export PATH=/home/sg0228178/R/bin/:$PATH
# export PATH=/home/sg0228178/local_builds/packages/bin:$PATH
# export LD_LIBRARY_PATH=/home/sg0228178/local_builds/packages/lib:$LD_LIBRARY_PATH

shopt -s checkwinsize

#alias vm='source /tnmlas/tngo_restapi/vmpy3.6/bin/activate'
alias vm='source /home/tngo_restapi/setup_vm_gcc7.1.sh'
#alias tngo_restapi='source /home/tngo_restapi/setup_vm.sh'
#alias tngo_restapi='source /home/tngo_restapi/setup_vm_gcc4.9.sh'
alias tngo_restapi='source /home/tngo_restapi/setup_vm_gcc7.1.sh'

#ensure one can do: 'source file' rather than 'source ./file' when file in current directory
set +o posix
export SHORT_HOSTNAME='tnmlas006'
alias emacs='/home/sg0228178/local_builds/packages/bin/emacs'
export PYTHONPATH=$HOME/python_etc:$PYTHONPATH
