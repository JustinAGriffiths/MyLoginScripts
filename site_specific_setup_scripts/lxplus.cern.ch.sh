#!/bin/bash

if [ $TTY == 0 ]; then
    printf 'Running lxplus setups\n'
fi


PS1='\[\033[0;35m\]$string\n\[\033[0;33m\]\u@\h: $ \[\033[0m\]'

# export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/external/Python/2.7.2/x86_64-slc5-gcc43-opt/lib:$LD_LIBRARY_PATH
# export PATH=/afs/cern.ch/sw/lcg/external/Python/2.6.2/x86_64-slc5-gcc43-opt/bin/:$PATH

# export AtlasSetup=/afs/cern.ch/atlas/software/dist/AtlasSetup
# asetup() {
#     source $AtlasSetup/scripts/asetup.sh --testarea=$PWD $1 $2 $3 $4
#     export PATH=$HOME/cmt_bin:$PATH
# }


setupROOT(){
    root_dir=5.32.00/x86_64-slc5-gcc43-opt/root/
    if [[ $1 ]] ; then root_dir=$1 ; fi
    export ROOTSYS=$root_dir
    source $ROOTSYS/bin/thisroot.sh
}
#setupROOT $AFSROOT/5.34.01/x86_64-slc5-gcc43-opt/root/

#lxplus5
# source /afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.08/x86_64-slc5-gcc46-opt/root/bin/thisroot.sh
# source /afs/cern.ch/sw/lcg/external/gcc/4.6.3/x86_64-slc5-gcc46-opt/setup.sh
# export PATH=/afs/cern.ch/sw/lcg/external/Python/2.7.3/x86_64-slc5-gcc46-opt/bin:$PATH
# export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/external/Python/2.7.3/x86_64-slc5-gcc46-opt/lib:$LD_LIBRARY_PATH

#lxplus6
# source /afs/cern.ch/sw/lcg/app/releases/ROOT/5.34.18/x86_64-slc6-gcc46-opt/root/bin/thisroot.sh
# source /afs/cern.ch/sw/lcg/external/gcc/4.6.3/x86_64-slc6-gcc46-opt/setup.sh
# export PATH=/afs/cern.ch/sw/lcg/external/Python/2.7.3/x86_64-slc6-gcc46-opt/bin:$PATH
# export LD_LIBRARY_PATH=/afs/cern.ch/sw/lcg/external/Python/2.7.3/x86_64-slc6-gcc46-opt/lib:$LD_LIBRARY_PATH

source /cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/Gcc/gcc481_x86_64_slc6/setup.sh
export LD_LIBRARY_PATH=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/python/2.7.4-x86_64-slc6-gcc48/sw/lcg/external/Python/2.7.4/x86_64-slc6-gcc48-opt/lib:$LD_LIBRARY_PATH
export PATH=/cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/python/2.7.4-x86_64-slc6-gcc48/sw/lcg/external/Python/2.7.4/x86_64-slc6-gcc48-opt/bin:$PATH
source /cvmfs/atlas.cern.ch/repo/ATLASLocalRootBase/x86_64/root/5.34.18-x86_64-slc6-gcc4.8/bin/thisroot.sh

fjet_make_root() {
    cflags=`root-config --cflags`
    fcflags=`/afs/cern.ch/sw/lcg/external/fastjet/3.0.3/x86_64-slc5-gcc46-opt/bin/fastjet-config --cxxflags`
    libs=`root-config --libs`
    flibs=`/afs/cern.ch/sw/lcg/external/fastjet/3.0.3/x86_64-slc5-gcc46-opt/bin/fastjet-config --libs`
    name=`echo $1 | sed 's,\..*,,g'`
    if [[ $2 ]] ; then name=$2; fi
    g++ -g -Wall -fPIC -pthread -m64 $cflags $fcflags $libs $flibs -o $name $1
}




setup_lsRoot(){
    root_sys=`echo $ROOTSYS | sed 's,/root$,,g'`
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
    setup_mycode
fi
