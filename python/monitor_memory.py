#!/usr/bin/env python


import time, os, subprocess, signal

log=open('%s/.monitor_memory.%s.log' %(os.getenv('HOME'), os.getenv('HOSTNAME')), 'a')

while True :
    l=subprocess.Popen(['top', '-n1b -a'], stdout=subprocess.PIPE).communicate()[0].split('\n')[7:15]
    for item in l:
        data=item.split()
        pid=data[0]
        user=data[1]
        mem=float(data[9])
        program=data[11]
        if float(mem) > 50:
            log.write('Warning : high memory usage: (pid,user,mem,program) (%i,%f,%s,%s) \n' %(pid, user, mem, program))
            log.write('Attempting to kill process: %i \n' %pid)
            log.flush()
            if os.kill(pid, signal.SIGKILL) != 0 :
                os.kill(pid, signal.SIGKILL)
            pass

        elif float(mem) > 10:
            log.write('Warning : high memory usage: (pid,user,mem,program) (%i,%f,%s,%s) \n' %(pid, user, mem, program))
            log.flush()
            pass

        time.sleep(5)
    

