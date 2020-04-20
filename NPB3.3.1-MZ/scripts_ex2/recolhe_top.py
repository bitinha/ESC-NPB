#!/usr/bin/env python3

import re
import sys
import os
import fileinput

argv = sys.argv[1:]

list_files = []
for file in os.listdir('commands_output'):
    if re.match(argv[0] + r'_top_[0-9]', file):
        list_files.append(file)

#print(list_files)

regexMatch = r'Mem:\s+(?P<Mem_total>\d+)k total,\s+(?P<Mem_used>\d+)k used'
regexMatch2 = r'Swap:\s+(?P<Swap_total>\d+)k total,\s+(?P<Swap_used>\d+)k used'

regexMatch3 = r'\s*\d+\s+\w+\s+\d+\s+\d+\s+\d+\w?\s+(?P<res>\d+)\w?\s+\d+\s+\w+\s+(?P<CPU>\d+\.\d+)\s+(?P<MEM>\d+\.\d+)'

mem_used_list = []
swap_used_list = []

res_list = []
cpu_list = []
mem_list = []

i1 = 0
i2 = 0
i3 = 0

for file in list_files:
    with open('commands_output/' + file) as fp:
        for line in enumerate(fp):
            m1 = re.match(regexMatch, line[1])
            m2 = re.match(regexMatch2, line[1])
            m3 = re.match(regexMatch3, line[1])

            if m1 is not None:
                mem_used_list.append(m1.group('Mem_total'))
                i1 += 1
            
            if m2 is not None:
                swap_used_list.append(m2.group('Swap_total'))
                i2 += 1

            if m3 is not None:
                res_list.append(float(m3.group('res')))
                cpu_list.append(float(m3.group('CPU')))
                mem_list.append(float(m3.group('MEM')))
                i3 += 1

print("res: " + str(sum(res_list) / i3))
print("CPU: " + str(sum(cpu_list) / i3))
print("MEM: " + str(sum(mem_list) / i3))
