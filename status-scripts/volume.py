#!/usr/bin/env python3

import subprocess
import re


volume = subprocess.Popen(['pulsemixer', '--get-volume'],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
        )
stdout_v, stderr_v = volume.communicate()

mute = subprocess.Popen(['pulsemixer', '--get-mute'],
        stdout=subprocess.PIPE,
        stderr=subprocess.PIPE
        )
stdout_m, stderr_m = mute.communicate()

volume_level = stdout_v.decode('ascii')
is_mute = int(stdout_m.decode('ascii'))

if int(is_mute) > 0:
    print("婢 ")
if int(is_mute) <= 0:
    volume_level = re.search('(\d+)\s', volume_level)
    volume_level = volume_level.group(1)
    print("  {}% ".format(volume_level))

