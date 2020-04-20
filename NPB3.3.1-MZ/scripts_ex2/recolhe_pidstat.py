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
    '(?P<sys>\d+\.\d+) \s+ (?P<guest>\d+\.\d+) \s+ (?P<idle>\d+\.\d+)')

usr_list = []
sys_list = []
guest_list = []
idle_list = []

i = 0
for file in list_files:
    with open('commands_output/' + file) as fp:
        for line in enumerate(fp):
            m = re.match(regexMatch, line[1])
            if m is not None:
                usr_list.append(float(m.group('usr')))
                sys_list.append(float(m.group('sys')))
                guest_list.append(float(m.group('guest')))
                idle_list.append(float(m.group('idle')))
                i += 1

print("usr: " + str(sum(usr_list) / i))
print("sys: " + str(sum(sys_list) / i))
print("guest: " + str(sum(guest_list) / i))
print("idle: " + str(sum(idle_list) / i))
