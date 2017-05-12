#!/bin/bash

if [ $TTY == 0 ]; then
    printf 'Running vbox setups\n'
fi

vbox_mount(){
    grep -qs '/mnt/sharedFolder' /proc/mounts
    if [ $? -ne 0 ];then
	sudo mount -t vboxsf sharedFolder -o uid=$USER,gid=$(id -g) /mnt/sharedFolder
	#ln -s /mnt/sharedFolder $HOME/workarea
    fi
}

vbox_mount

vm(){
    virtual_generic ".virtual_py35"
}                    
