#!/usr/bin/env python3.8

import re
import sys
import os
import fileinput

def findMaxTime(lista):
    ret = 0,0
    minimo = float("inf")
    for e,i in enumerate(lista):
        if e < minimo:
            minimo = e
            ret = e, i

    return ret

def top(list_files):
    regexMatch = r'Mem:\s+(?P<Mem_total>\d+)k total,\s+(?P<Mem_used>\d+)k used'
    regexMatch2 = r'Swap:\s+(?P<Swap_total>\d+)k total,\s+(?P<Swap_used>\d+)k used'
    regexMatch3 = r'\s*\d+\s+\w+\s+\d+\s+\d+\s+\d+\w?\s+(?P<res>\d+)\w?\s+\d+\s+\w+\s+(?P<CPU>\d+\.\d+)\s+(?P<MEM>\d+\.\d+)\s+\d+:\d+\.\d+\s+(?P<COMMAND>'+bin_name+')'

    for i,file in enumerate(list_files):
        with open('commands_output/' + file) as fp:
            for line in enumerate(fp):
                m1 = re.match(regexMatch, line[1])
                m2 = re.match(regexMatch2, line[1])
                m3 = re.match(regexMatch3, line[1])

                if m3 is not None:
                    d["res"] = float(m3.group('res'))
                    d["cpu"] = float(m3.group('CPU'))

def pidstat(list_files):
    regexMatch = (r'(?P<time>\d{2}:\d{2}:\d{2}) \s+ (?P<pid>\d+) \s+ (?P<usr>\d+\.\d+) \s+'
    '(?P<sys>\d+\.\d+) \s+ (?P<guest>\d+\.\d+) \s+ (?P<cpu>\d+\.\d+)'
    '\s+\d+\s+(?P<COMMAND>'+bin_name+')')


    for file in list_files:
        with open('commands_output/' + file) as fp:
            for line in enumerate(fp):
                m = re.match(regexMatch, line[1])
                if m is not None:
                    d["usr"] = float(m.group('usr'))
                    d["sys"] = float(m.group('sys'))
                    d["guest"] = float(m.group('guest'))
                    d["cpu"] = float(m.group('cpu'))

def pidstat_d(list_files):
    regexMatch = (r'(?P<time>\d{2}:\d{2}:\d{2}) \s+ (?P<pid>\d+) \s+ (?P<kB_rd>\d+\.\d+) \s+'
    '(?P<kB_wd>\d+\.\d+) \s+ (?P<kB_ccwr>\d+\.\d+)\s+(?P<COMMAND>'+bin_name+')')
    for file in list_files:
        with open('commands_output/' + file) as fp:
            for line in enumerate(fp):
                m = re.match(regexMatch, line[1])
                if m is not None:
                    d["kB_rd"] = float(m.group('kB_rd'))
                    d["kB_wd"] = float(m.group('kB_wd'))
                    d["kB_ccwr"] = float(m.group('kB_ccwr'))

def mpstat(list_files):
    regexMatch = (r'(?P<time>\d{2}:\d{2}:\d{2}) \s+ all \s+ (?P<usr>\d+\.\d+) \s+'
        '(?P<nice>\d+\.\d+) \s+ (?P<sys>\d+\.\d+) \s+ (?P<iowait>\d+\.\d+) \s+ (?P<irq>\d+\.\d+) \s+'
            '(?P<soft>\d+\.\d+) \s+ (?P<steal>\d+\.\d+) \s+ (?P<guest>\d+\.\d+) \s+ (?P<idle>\d+\.\d+)')

    for file in list_files:
        with open('commands_output/' + file) as fp:
            for line in enumerate(fp):
                m = re.match(regexMatch, line[1])
                if m is not None:
                    d["usr"] = float(m.group('usr'))
                    d["sys"] = float(m.group('sys'))
                    d["iowait"] = float(m.group('iowait'))
                    d["idle"] = float(m.group('idle'))

argv = sys.argv[1:]
input_script = argv[0]
command = argv[1]
all = False

try:
    if argv[2] == "all":
        all = True
except:
    pass

with open(input_script) as fp:
    for line in enumerate(fp):
        if match := re.search(r'#PBS -N (.*)',line[1]):
            prefixed = [filename for filename in os.listdir('.') if re.search(match.group(1) + r'\.o\d+', filename)]
            file_tempos = prefixed[0]

resultados = dict()
bin_name = ""
state=""
with open(file_tempos) as fp:
    for line in enumerate(fp):
        if state == "bin":
            if match := re.search(r'\s*Class\s*=\s*(.*)',line[1]):
                Class = match.group(1)
            elif match := re.search(r'\s*Time in seconds\s*=\s*(.*)',line[1]):
                time = float(match.group(1))
            elif match := re.search(r'\s*FFLAGS\s*=\s*(.*)',line[1]):
                fflags = match.group(1)
            elif re.match(r'pkill',line[1]):
                d = {"Class":Class,"Time":time, "FFlags":fflags}

                command_files = []
                for file in os.listdir('commands_output'):
                    if all:
                        if re.match(input_script.split('.')[0]+'_0'+fflags[2:]+'_class_'+Class+'_'+command+r'_all_[0-9]', file):
                            command_files.append(file)
                    else:
                        if re.match(input_script.split('.')[0]+'_0'+fflags[2:]+'_class_'+Class+'_'+command+r'_[0-9]', file):
                            command_files.append(file)
                if command == 'top':
                    top(command_files)
                if command == 'pidstat':
                    pidstat(command_files)
                if command == 'pidstat_d':
                    pidstat_d(command_files)
                if command == 'mpstat':
                    mpstat(command_files)

                l = resultados.get(Class+fflags,list())
                l.append(d)
                resultados[Class+fflags]=l
                state = ""
        elif re.match(r'\+ bin',line[1]):
            state = "bin"
            bin_name = line[1].split('/')[1].split('\n')[0]

for lista in resultados.values():
    minimos = list()

    for e in lista:
        if len(minimos) < 5:
            minimos.append(e)
        else:
            time, i = findMaxTime(minimos)
            if time > e["Time"]:
                minimos[i] = e

    Class = minimos[0]["Class"]
    fflags = minimos[0]["FFlags"]
    time = 0
    res = cpu = usr = sys = guest = cpu = iowait = idle = kB_ccwr = kB_wd = kB_rd = 0

    for e in minimos:
        time += e["Time"]

        if command == 'top':
            res += e["res"]
            cpu += e["cpu"]
        if command == 'pidstat':
            usr += e["usr"]
            sys += e["sys"]
            guest += e["guest"]
            cpu += e["cpu"]
        if command == 'pidstat_d':
            kB_rd += e["kB_rd"]
            kB_wd += e["kB_wd"]
            kB_ccwr += e["kB_ccwr"]
        if command == 'mpstat':
            usr += e["usr"]
            sys += e["sys"]
            iowait += e["iowait"]
            idle += e["idle"]

    time = round(time / len(minimos),3)

    x=0;y=0
    if Class == "W":
        x = 0
    elif Class == "A":
        x = 1
    elif Class == "B":
        x = 2
    elif Class == "C":
        x = 3

    if fflags == "-O0":
        y = 0
    elif fflags == "-O1":
        y = 1
    elif fflags == "-O2":
        y = 2
    elif fflags == "-O3":
        y = 3

    if command == 'top':
        res = round(res / len(minimos), 3)
        cpu = round(cpu / len(minimos), 3)
        print("res " + str(res))
        print("cpu " + str(cpu))

    if command == 'pidstat':
        usr = round(usr / len(minimos), 3)
        sys = round(sys / len(minimos), 3)
        guest = round(guest / len(minimos), 3)
        cpu = round(cpu / len(minimos), 3)

    if command == 'pidstat_d':
        kB_rd = round(kB_rd / len(minimos), 3)
        kB_wd = round(kB_wd / len(minimos), 3)
        kB_ccwr = round(kB_ccwr / len(minimos), 3)

        print(kB_rd)

    if command == 'mpstat':
        usr = round(usr / len(minimos), 3)
        sys = round(sys / len(minimos), 3)
        iowait = round(iowait / len(minimos), 3)
        idle = round(idle / len(minimos), 3)
