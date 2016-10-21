#!/bin/bash                                                                                                                                                                          

if [ $TTY == 0 ]; then
    printf 'Running orodruin setups\n'
fi

export PATH=$PATH:$HOME/bin
export KRB5_CONFIG=$HOME/krb5.conf 

alias png-open='eog'
#alias acroread='~/software/Adobe/Reader9/bin/acroread'
alias kinit='kinit -l 25h'
alias ssh='ssh -i $HOME/.ssh/id_rsa_ditto'
alias supercomputer='ssh -Y $SUPERCOMPUTER'

# if [ $TTY == 0 ]; then
#     #source monitor_memory.sh
#     #monitor_memory.sh
# fi

