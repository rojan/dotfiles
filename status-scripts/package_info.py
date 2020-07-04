#!/usr/bin/env python3

#read number of packages to update from ~/.packages

package_info = 0
try:
    with open('/home/rojan/.packages') as packages_file:
        package_info = packages_file.read()
except Exception as e:
    pass

print ("  {} ".format(package_info))
