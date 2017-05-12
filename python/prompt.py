#!/usr/bin/env python
from __future__ import print_function

import os

rows,columns=os.popen('stty size', 'r').read().split()
vm=os.getenv('VIRTUAL_ENV')
bc=os.getenv('BAR_COLOR')
bc_len=0
if bc is None:
    bc=''
else:
    if vm is not None: bc_len=len(bc)
    bc=('\033'+bc[bc.index('[0;'):]).replace('\\]','')
    pass
if vm is not None:
    vm=vm[vm.rfind('/')+1:]
    vm='\033[0;31m(vm='+vm+')'+bc
    vm='__'+vm+'__'
    pass
else: vm=''

import datetime

print ((datetime.datetime.now().ctime()+'_'+os.popen('pwd').read().split()[0]+vm).ljust(int(columns)+bc_len,'_'))
