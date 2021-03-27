#!/usr/bin/env python3

import psutil
import re
import math

temperature = 0
count = 0
avg_temp = 0
try:
    tmp_info = psutil.sensors_temperatures()
    cpus = tmp_info['coretemp']
    for cpu in cpus:
        if re.search('Core', cpu[0]):
            temperature = temperature + int(cpu[1])
            count += 1
except Exception as e:
    # raise e
    pass

if count > 0:
    avg_temp = math.ceil(temperature/count)

print ("{}°C".format(avg_temp))
