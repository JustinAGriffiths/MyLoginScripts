#!/bin/bash

if [ $TTY == 0 ]; then
    printf 'Running Mac setups\n'
fi

alias vm='source $HOME/virtualenv/bin/activate'

#oracle crap
export ORACLE_HOME=/usr/local/oracle
export DYLD_LIBRARY_PATH=$ORACLE_HOME/instantclient_12_2
export LD_LIBRARY_PATH=$ORACLE_HOME/instantclient_12_2

export PATH=$PATH:/usr/local/mysql/bin/
alias aws='ssh tngo_restapi@10.6.33.84 -t "ssh sg0228178@cit-p-tnmlas006"'
alias tunnel='ssh -D 9098 tngo_restapi@10.6.33.84 -t "top"'
alias kinit='kinit -kt sg0228178.keytab sg0228178@HADOOP.SGDCPROD.SABRE.COM'

export KRB5_CONFIG=$HOME/krb5.conf 

alias open='/usr/bin/open'
alias which='/usr/bin/which'

alias uta='ssh -t -Y hepgw.uta.edu "ssh -Y -i .ssh/id_rsa_hepgw master.tier3-atlas.uta.edu"; tabname $SHORT_HOSTNAME'
alias uta_xrd='ssh -t -Y hepgw.uta.edu "ssh -Y -i .ssh/id_rsa_hepgw gw01.tier3-atlas.uta.edu"; tabname $SHORT_HOSTNAME'
alias ls='ls -G'

#source $HOME/root-v5-32-00-patches/bin/thisroot.sh
#source $HOME/root_src/root/bin/thisroot.sh
#source $HOME/root/bin/thisroot.sh

export DYLD_LIBRARY_PATH=$DYLD_LIBRARY_PATH:$HOME/my_code/lib

export HEPGWIP=129.107.14.68

read_info(){
    pushd .
    cd $HOME
    if [ -f info.gpg ]; then
	echo "Opening File"
	gpg info.gpg
	rm info.gpg
	emacs -nw -l $HOME/.emacs_nobackup info
	yes | gpg -c info &&
	rm info    
    else
	echo "File Already Open"
    fi
    popd
}


make_root() {
    cflags=`root-config --cflags`
    libs=`root-config --libs`
    name=`echo $1 | sed 's,\..*,,g'`
    if [[ $2 ]] ; then name=$2; fi
    #g++ -g -Wall -fPIC -pthread -m64 $cflags $libs -o $name $1
    g++ -g -Wall -fPIC -pthread -m64 $cflags -I/$HOME/my_code/include $libs -L$HOME/my_code/lib -lmyAnalysis -o $name $1
}
