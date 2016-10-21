#!/bin/bash                                                                                                                                                                          

if [ $TTY == 0 ]; then
    printf 'Running tier3 setups\n'
fi


rm -rf $HOME/bio
export RUCIO_ACCOUNT=griffith
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/my_code/bin
export PATH=$PATH:$HOME/bin/cmake-2.8.8-install/bin
export PATH=$PATH:$HOME/bin/source/lsroot/bin
#export PATH=$PATH:$HOME/bin/source/xrootd-3.2.1-install/bin
#export PATH=$HOME/python-2.7/bin:$PATH
export MANPATH=$MANPATH:~/bin/source/lsRoot/man
#source $HOME/root/bin/thisroot.sh

export ROOTCORE_NCPUS=4

#source /cluster/app/ATLASLocalRootBase/x86_64/python/2.6.5-x86_64-slc5-gcc43/setup.sh

#source $HOME/trunk/setupRoot.sh


# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cluster/home/griffith/bin/source/xrootd-3.2.1-install/lib64/
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/cluster/home/griffith/python-2.7/lib/

export ATLAS_LOCAL_ROOT_BASE=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/
ls $ATLAS_LOCAL_ROOT_BASE &> /dev/null
let cvmfs_code=$?
if [ $cvmfs_code == 0 ]; then

    # source /cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/Gcc/gcc435_x86_64_slc5/setup.sh
    # export LD_LIBRARY_PATH=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/python/2.6.5-x86_64-slc5-gcc43/sw/lcg/external/Python/2.6.5/x86_64-slc5-gcc43-opt/lib:$LD_LIBRARY_PATH
    # export PATH=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/python/2.6.5-x86_64-slc5-gcc43/sw/lcg/external/Python/2.6.5/x86_64-slc5-gcc43-opt/bin:$PATH
    # source /cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/root/5.34.18-x86_64-slc5-gcc4.3/bin/thisroot.sh
    # #source /cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/root/5.34.17-x86_64-slc5-gcc4.3/bin/thisroot.sh

    source /cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/Gcc/gcc481_x86_64_slc6/setup.sh
    export LD_LIBRARY_PATH=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/python/2.7.4-x86_64-slc6-gcc48/sw/lcg/external/Python/2.7.4/x86_64-slc6-gcc48-opt/lib:$LD_LIBRARY_PATH
    export PATH=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/python/2.7.4-x86_64-slc6-gcc48/sw/lcg/external/Python/2.7.4/x86_64-slc6-gcc48-opt/bin:$PATH
    source /cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/root/5.34.18-x86_64-slc6-gcc4.8/bin/thisroot.sh


    #export ATLAS_LOCAL_ROOT_BASE=/cluster/app/ATLASLocalRootBase/                                                                                                                       
    alias setupATLAS='source ${ATLAS_LOCAL_ROOT_BASE}/user/atlasLocalSetup.sh'
fi
export KRB5_CONFIG=$HOME/krb5.conf 
alias uta_xrd='ssh -Y gw01.tier3-atlas.uta.edu'


alias png-open='eog'
#alias acroread='~/software/Adobe/Reader9/bin/acroread'
alias kinit='kinit -l 25h'

setup_lsRoot(){
    root_sys=`echo $ROOTSYS | sed 's,/root$,,g'`
    if [ "`echo $ROOTSYS | grep ROOT`" == "" ]; then
        root_sys=`echo $root_sys | sed 's,.*/,,g'`
    else
        root_sys=`echo $root_sys | sed "s,.*/ROOT,,g" | sed "s,/,-,g"`
    fi
    root_sys=`echo $root_sys | sed 's,.*/,,g'`
    if [ -f $HOME/bin/source/lsroot/bin_root_ver/lsRoot_$root_sys ]; then
	echo "Changing alias to: " lsRoot_$root_sys
    else

	pushd .
	cd $HOME/bin/source/lsroot/
	make clean; 
	make
	mkdir -p bin_root_ver
	cp bin/lsRoot bin_root_ver/lsRoot_$root_sys
	popd
    fi
    alias lsRoot='$HOME/bin/source/lsroot/bin_root_ver/lsRoot_'$root_sys
}

setup_mycode(){
    root_sys=`echo $ROOTSYS | sed 's,/root$,,g'`
    root_sys=`echo $root_sys | sed 's,.*/,,g'`
    if [ -f $HOME/my_code/lib_$root_sys/libmyAnalysis.so ]; then
	echo "Changing my_code_lib to: " $HOME/my_code/lib_$root_sys/libmyAnalysis.so
    else

	pushd .
	cd $HOME/my_code
	FILE=Makefile
	root_ver=`echo $ROOTSYS | grep 'root/6'`
	if [ "$root_ver"=="root/6" ]; then
	    FILE=Makefile.r6
	fi
	make clean; 
	make -f $FILE
	mkdir -p lib_$root_sys/
	cp lib/libmyAnalysis.so lib_$root_sys/
	popd
    fi
    cp $HOME/my_code/lib_$root_sys/libmyAnalysis.so $HOME/my_code/lib
    # LD_LIBRARY_PATH=`echo $LD_LIBRARY_PATH | sed 's,'$HOME"/my_code/[/-\.a-zA-Z0-9_]*,,g"`
    # LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$HOME/my_code/my_code_lib_$root_sys
}

if [ $TTY == 0 -a $cvmfs_code == 0 ]; then
    setup_lsRoot
    #setup_mycode
fi

ping_my_term(){
    $HOME/bin/ping_term.sh &
}


alias smu='ssh jgriffiths@smuhpc.hpc.smu.edu'


if [ $TTY == 0 ]; then
    source monitor_memory.sh
    #monitor_memory.sh

fi

