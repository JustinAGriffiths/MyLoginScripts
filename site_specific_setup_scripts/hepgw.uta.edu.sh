#!/bin/bash

if [ $TTY == 0 ]; then
    printf 'Running hepgw setups\n'
fi


PS1='\[\033[0;31m\]$string\n\[\033[1;36m\]\u@\h: $ \[\033[0m\]'


