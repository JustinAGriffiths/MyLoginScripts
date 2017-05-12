#!/usr/bin/env python
from __future__ import print_function

import os

rows,columns=os.popen('stty size', 'r').read().split()
vm=os.getenv('VIRTUAL_ENV')
bc=os.getenv('BAR_COLOR')
if bc is None: bc=''
bc=('\033'+bc[bc.index('[0;'):]).replace('\\]','')
if vm is not None: 
    vm='\033[0;31m(vm='+vm+')'+bc
    vm='__'+vm+'__'
    pass
import datetime

print ((datetime.datetime.now().ctime()+'_'+os.popen('pwd').read().split()[0]+vm).ljust(int(columns),'_'))
