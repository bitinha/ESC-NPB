#!/usr/bin/env python3

import re
import sys
import os
import fileinput

argv = sys.argv[1:]

list_files = []
for file in os.listdir('commands_output'):
    if re.match(argv[0] + r'_pidstat_[0-9]', file):
        list_files.append(file)

#print(list_files)

regexMatch = (r'(?P<time>\d{2}:\d{2}:\d{2}) \s+ (?P<pid>\d+) \s+ (?P<usr>\d+\.\d+) \s+'
    '(?P<sys>\d+\.\d+) \s+ (?P<guest>\d+\.\d+) \s+ (?P<cpu>\d+\.\d+)')

usr_list = []
sys_list = []
guest_list = []
cpu_list = []

i = 0
for file in list_files:
    with open('commands_output/' + file) as fp:
        for line in enumerate(fp):
            m = re.match(regexMatch, line[1])
            if m is not None:
                usr_list.append(float(m.group('usr')))
                sys_list.append(float(m.group('sys')))
                guest_list.append(float(m.group('guest')))
                cpu_list.append(float(m.group('cpu')))
                i += 1

print("usr: " + str(sum(usr_list) / i))
print("sys: " + str(sum(sys_list) / i))
print("guest: " + str(sum(guest_list) / i))
print("cpu: " + str(sum(cpu_list) / i))
