#!/bin/bash

if [ $TTY == 0 ]; then
    printf 'Running heppc19 setups\n'
fi


alias e='/usr/bin/emacs-23.1-nox -nw'
source $HOME/root2/root/bin/thisroot.sh

alias lsRoot='$HOME/bin/source/lsroot/bin/lsRoot_heppc19'
alias uta='ssh -Y -i $HOME/.ssh/id_rsa_heppc19 master.tier3-atlas.uta.edu'
alias smu='ssh jgriffiths@smuhpc.hpc.smu.edu'

setxkbmap -option ctrl:nocaps