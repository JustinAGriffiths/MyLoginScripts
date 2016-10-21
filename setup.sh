#!/bin/bash

SCRIPT_DIR=`echo $PWD/$BASH_ARGV | sed 's,\(.*/\)[-a-zA-Z0-9_\. ]*,\1,g'`

verify(){

    if [[ -f $HOME/$1 || -L $HOME/$1 ]]; then
	if [ -L $HOME/$1 ] ; then
	    echo 'removing sym link '$HOME/$1
	rm $HOME/$1
	else
	    echo "mv "$HOME"/$1 to "$HOME/$1_back
	    mv $HOME/$1 $HOME/$1_bak
	fi
    fi
}

verify .bashrc
verify .bash_logout
verify .bash_functions


if [[ -d $HOME/site_specific_setup_scripts && -L $HOME/site_specific_setup_scripts ]]; then
    rm $HOME/site_specific_setup_scripts
fi
    
    

ln -s $SCRIPT_DIR'bashrc' $HOME/.bashrc
ln -s $SCRIPT_DIR'bash_logout' $HOME/.bash_logout
ln -s $SCRIPT_DIR'functions' $HOME/.bash_functions
ln -s $SCRIPT_DIR'site_specific_setup_scripts' $HOME/site_specific_setup_scripts



