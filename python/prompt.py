#!/usr/bin/env python
import os

rows,columns=os.popen('stty size', 'r').read().split()

import datetime

#print (datetime.datetime.now().ctime()+'_'+os.getcwd()).ljust(int(columns),'_')
print (datetime.datetime.now().ctime()+'_'+os.popen('pwd').read().split()[0]).ljust(int(columns),'_')
