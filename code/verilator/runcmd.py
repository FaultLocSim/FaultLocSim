import os
import subprocess
import signal

def exccmd(command,timeout=500000):
    p = subprocess.Popen([command],stdout=subprocess.PIPE,stderr=subprocess.PIPE,shell=True,preexec_fn=os.setsid)
    return_output = []
    try:
        output = p.communicate(timeout=timeout)
        return_output = (output[0].decode() + output[1].decode()).strip().split("\n")
    except Exception as e:
        print("timeout ---------------------------")
        try:
            os.killpg(p.pid, signal.SIGTERM)
        except Exception:
            pass
    return return_output