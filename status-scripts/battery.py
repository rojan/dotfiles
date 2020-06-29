#!/usr/bin/env python3

import psutil

battery = psutil.sensors_battery()
plugged = battery.power_plugged
percent = str(int(battery.percent))
if plugged == False:
    icon = " "
else:
    icon = " "

print("{}{}% ".format(icon, percent))
