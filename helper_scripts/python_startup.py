# python startup file                                                                                                                                                                
import readline
import rlcompleter
import atexit
import os
print('loading system pythonstartup')
# tab completion                                                                                                                                                                     
readline.parse_and_bind('tab: complete')
# history file                                                                                                                                                                       
histfile = os.path.join(os.environ['HOME'], '.pythonhistory')
try:
    readline.read_history_file(histfile)
except IOError:
    pass
atexit.register(readline.write_history_file, histfile)
del os, histfile, readline, rlcompleter

try:
    import df_utils
    pd=df_utils.Pd()
    import db_tools
    import numpy as np
    import datetime
except:
    print("couldn't load standard modules, vm running?")
    pass
