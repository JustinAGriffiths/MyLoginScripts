#!bin/bash
#echo "Welcome to My Terminal :)"

buffer=`tty`
export TTY=$?

export SHORT_HOSTNAME=`echo $HOSTNAME | grep -io '^[a-zA-Z0-9_]*'`
if [ "$SHORT_HOSTNAME" == "master" ]; then
    export SHORT_HOSTNAME='tier3-uta'
fi

which sw_vers &> /dev/null
if [ $? == 0 ]; then
    export SHORT_HOSTNAME='Mac'
fi

export PROMPT_COMMAND='prompt_string=`$HOME/MyLoginScripts/python/prompt.py`'
PS1='\[\033[0;35m\]$prompt_string\n\[\033[1;36m\]\u@\h: $ \[\033[0m\]'
export HISTCONTROL="ignoredups"



#general stuff
export MANPATH=$MANPATH:/usr/local/share/man
alias open='gnome-open'
alias which='alias | /usr/bin/which --tty-only --read-alias --show-dot --show-tilde'
alias ssh='ssh -Y '
alias ls='ls --color=tty -B'
alias cls='clear'
alias grep='grep --color=auto'
alias emacs='emacs -nw'
alias e='emacs -nw'
alias cursor='tput cnorm'
export PATH=$PATH:~/bin

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
