#!/usr/bin/env python3

#check for packages update.
#run this in cronjob every 3 hours
#0       */1     *       *       *       /home/rojan/dotfiles/status-scripts/package_update.py >/dev/null 2>&1

import subprocess
import re

command = "sudo pacman -Suyp".split()
pacman = subprocess.Popen(command, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
out,err= pacman.communicate()

packages_to_updated = 0
try:
    if out:
        packages = re.search('community.*?\n(.*)', out.decode('ascii'), re.M|re.S)
        if packages:
            packages = packages.group(1)
            packages = packages.strip().split("\n")
            for p in packages:
                if p == "":
                    continue
                packages_to_updated += 1
except Exception as e:
    pass

print (packages_to_updated)
exit()

with open('/home/rojan/.packages', 'w') as packages_file:
    packages_file.write(str(packages_to_updated))
