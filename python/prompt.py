#!/usr/bin/env python
from __future__ import print_function

import os

rows,columns=os.popen('stty size', 'r').read().split()

import datetime

print ((datetime.datetime.now().ctime()+'_'+os.popen('pwd').read().split()[0]).ljust(int(columns),'_'))
