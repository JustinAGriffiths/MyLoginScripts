#!bin/bash
#echo "Welcome to My Terminal :)"
alias aws='ssh tngo_restapi@10.6.33.84 -t "ssh sg0225xxx@10.6.24.180"'
alias tunnel='ssh tngo_restapi@10.6.33.84 -t "top"'
buffer=`tty`
export TTY=$?

#   '#' --> '%23'
#export all_proxy='http://sg0228178:passwd@www-ad-proxy.sabre.com:80' 

export SHORT_HOSTNAME=`echo $HOSTNAME | grep -io '^[a-zA-Z0-9_]*'`
if [ "$SHORT_HOSTNAME" == "master" ]; then
    export SHORT_HOSTNAME='tier3-uta'
fi

which sw_vers &> /dev/null
if [ $? == 0 ]; then
    export SHORT_HOSTNAME='Mac'
fi

export BAR_COLOR='\[\033[0;32m\]'
export PROMPT_COMMAND='export PS1=$MYPS1;prompt_string=`$HOME/MyLoginScripts/python/prompt.py`'
MYPS1=$BAR_COLOR'$prompt_string\n\[\033[1;36m\]\u@\h: $ \[\033[0m\]'
PS1=$MYPS1
export HISTCONTROL="ignoredups"
export HADOOP='hdpct2ldap02g02.hadoop.sgdcprod.sabre.com'
export CERT_HADOOP='hdp032ldacgw101.hadoop.sgdccert.sabre.com'
export DEV_HADOOP='hdp032ldadgw001.hadoop.sgdcelab.sabre.com'

#general stuff
export MANPATH=$MANPATH:/usr/local/share/man
alias open='gnome-open'
#alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
alias ssh='ssh -Y '
alias ls='ls --color=tty -B'
alias cls='clear'
alias grep='grep --color=auto'
alias emacs='emacs -nw'
alias e='emacs -nw'
alias cursor='tput cnorm'
export PATH=$PATH:~/bin
export PATH=$PATH:$HOME/MyLoginScripts/bin
export PATH=$HOME/packages/R-dev-3.3.3/bin/:$PATH
export PATH=$HOME/TNGOUtils/bin:$PATH
export PYTHONSTARTUP=$HOME/.helper_scripts/python_startup.py
#export PYTHONPATH=$PYTHONPATH:$HOME/MyUtils/:$HOME/python_etc/
export PYTHONPATH=$PYTHONPATH:$HOME/TNGOUtils/:$HOME/python_etc/

alias aws='ssh -Y -t -l citprod\\sg0228178 10.6.33.84 "ssh -Y cit-p-tnmlas006"'
alias azure='ssh -Y -t -l tngo_restapi 10.6.33.84 "ssh -Y justing@dsvm-aitraining.southcentralus.cloudapp.azure.com"'
alias hadoop_server='ssh -c aes192-cbc sg228178@bdaolp013node14.sabre.com'
#alias hadoop_scp='ssh -c aes192-cbc sg228178@bdaolp013node14.sabre.com'


hadoop_scp() {
    if [[ ! $1 ]]; then
	echo "provide file/dir"
    fi
    scp -c aes192-cbc -r $@ sg228178@bdaolp013node14.sabre.com:transfer/
}

hadoop_rscp() {
    if [[ ! $1 ]]; then
	echo "provide file/dir"
    fi
    scp -c aes192-cbc -r sg228178@bdaolp013node14.sabre.com:$1 .
}


#cern/atlas stuff
export SVNGROUPS='svn+ssh://svn.cern.ch/reps/atlasgrps/'
export SVNPHYS='svn+ssh://svn.cern.ch/reps/atlasphys/'
export SVNPERF='svn+ssh://svn.cern.ch/reps/atlasperf/'
export SVNINST='svn+ssh://svn.cern.ch/reps/atlasinst/'
export SVNOFF='svn+ssh://svn.cern.ch/reps/atlasoff/'
export SVNUSR='svn+ssh://svn.cern.ch/reps/atlasusr/'
alias voms='voms-proxy-init -voms atlas'
alias root='root -l'
alias cern='ssh -Y lxplus.cern.ch'

#UTA stuff
export UTA='master.tier3-atlas.uta.edu'
alias uta='ssh -t -Y hepgw.uta.edu "ssh -Y -i .ssh/id_rsa_hepgw master.tier3-atlas.uta.edu"'
alias uta_xrd='ssh -t -Y hepgw.uta.edu "ssh -Y -i .ssh/id_rsa_hepgw gw01.tier3-atlas.uta.edu"'
export SUPERCOMPUTER='192.168.1.5'
alias supercomputer='ssh -Y -t orodruin.uta.edu "ssh -i .ssh/id_rsa_ditto -Y $SUPERCOMPUTER"'

#old projects
export SVNCFG='https://cfb-rankings.svn.sourceforge.net/svnroot/cfb-rankings/'
export SVNLSR='https://cfb-rankings.svn.sourceforge.net/svnroot/lsroot'
alias sforge='svn --username jgriffi6'
export LD_LIBRARY_PATH=$HOME/my_code/lib:$LD_LIBRARY_PATH


#useful functions
#source $HOME/.bash_functions

#special conditions
if [ $TTY == 0 ]; then
    if [ -f $HOME/site_specific_setup_scripts/$HOSTNAME.sh ]; then 
	source $HOME/site_specific_setup_scripts/$HOSTNAME.sh
    elif [ "`echo $HOSTNAME | grep -io 'lxplus'`" == "lxplus" ]; then
	source $HOME/site_specific_setup_scripts/lxplus.cern.ch.sh
    elif [ -f $HOME/site_specific_setup_scripts/$SHORT_HOSTNAME.sh ]; then
	source $HOME/site_specific_setup_scripts/$SHORT_HOSTNAME.sh
    fi    
    source $HOME/.helper_scripts/git_helpers.sh
fi


if [ $TTY == 0 ]; then
    source $HOME/.bash_functions
fi

if [ $TTY == 0 ]; then
    winname $SHORT_HOSTNAME
    tabname $SHORT_HOSTNAME
    #winname_timer &
    if [ "$SHORT_HOSTNAME" != "Mac" ]; then
	export `dircolors | head -n 1 | sed 's,;$,,g' | sed "s,',,g"`
    fi
    
    printf 'Welcome to my Terminal!\n'
    printf 'Running on Host: '$HOSTNAME'\n'
    #print reminders
    notes 
fi

cd $HOME

set +o posix
