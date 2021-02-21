#!/usr/bin/env python3
import psutil

mem_used_in_perc = 0
try:
    v_mem = psutil.virtual_memory()
    mem_used_in_perc = v_mem.percent
except Exception as e:
    pass

print(" {}% ".format(mem_used_in_perc))
