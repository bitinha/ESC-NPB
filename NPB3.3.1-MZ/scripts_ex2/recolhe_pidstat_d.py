#!/usr/bin/env python3

import re
import sys
import os
import fileinput

argv = sys.argv[1:]

list_files = []
for file in os.listdir('commands_output'):
    if re.match(argv[0] + r'_pidstat_d_[0-9]', file):
        list_files.append(file)

#print(list_files)

regexMatch = (r'(?P<time>\d{2}:\d{2}:\d{2}) \s+ (?P<pid>\d+) \s+ (?P<kB_rd>\d+\.\d+) \s+'
    '(?P<kB_wd>\d+\.\d+) \s+ (?P<kB_ccwr>\d+\.\d+)')

kB_rd_list = []
kB_wd_list = []
kB_ccwr_list = []

i = 0
for file in list_files:
    with open('commands_output/' + file) as fp:
        for line in enumerate(fp):
            m = re.match(regexMatch, line[1])
            if m is not None:
                kB_rd_list.append(float(m.group('kB_rd')))
                kB_wd_list.append(float(m.group('kB_wd')))
                kB_ccwr_list.append(float(m.group('kB_ccwr')))
                i += 1

print("kB_rd: " + str(sum(kB_rd_list) / i))
print("kB_wd: " + str(sum(kB_wd_list) / i))
print("kB_ccwr: " + str(sum(kB_ccwr_list) / i))
