#!/bin/bash

if [ $TTY == 0 ]; then
    printf 'Running atlas007 setups\n'
fi

alias string='string_atlas007'
export PROMPT_COMMAND='string=`string $COLUMNS $PWD`'
PS1='\[\033[0;35m\]$string\n\[\033[1;36m\]\u@\h: $ \[\033[0m\]'


#source /usr/local/root/5.22/bin/thisroot.sh
source /scratch-local-1/AFP/bin/source/root/bin/thisroot.sh
alias e='/usr/bin/emacs -nw'
alias lsRoot='$HOME/bin/source/lsroot/bin/_lsRoot_atlas007'

make_root() {
    cflags=`root-config --cflags`
    libs=`root-config --libs`
    name=`echo $1 | sed 's,\..*,,g'`
    if [[ $2 ]] ; then name=$2; fi
    #g++ -g -Wall -fPIC -pthread -m64 $cflags $libs -o $name $1
    g++ -g -Wall -fPIC -pthread -m64 $cflags $libs -o $name $1
}
