#!/bin/bash

if [ $TTY == 0 ]; then
    printf 'Running tier3 setups\n'
fi


vm(){
    source $HOME/vpy3/bin/activate
}

export PATH=/home/sg0228178/R/bin/:$PATH
export PATH=/home/sg0228178/local_builds/packages/bin:$PATH
export LD_LIBRARY_PATH=/home/sg0228178/local_builds/packages/lib:$LD_LIBRARY_PATH

shopt -s checkwinsize
