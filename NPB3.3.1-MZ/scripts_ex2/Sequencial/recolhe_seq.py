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

def top(file):
    regexMatch = r'Mem:\s+(?P<Mem_total>\d+)k total,\s+(?P<Mem_used>\d+)k used'
    regexMatch2 = r'Swap:\s+(?P<Swap_total>\d+)k total,\s+(?P<Swap_used>\d+)k used'
    regexMatch3 = r'\s*\d+\s+\w+\s+\d+\s+\d+\s+\d+\w?\s+(?P<res>\d+m?)\s+\d+\s+\w+\s+(?P<CPU>\d+\.\d+)\s+(?P<MEM>\d+\.\d+)\s+\d+:\d+\.\d+\s+(?P<COMMAND>'+r'lu.*'+')'
    
    res_f = 0
    cpu_f = 0
    n_prints = 0

    with open('commands_output/' + file) as fp:
        for line in enumerate(fp):
            m1 = re.match(regexMatch, line[1])
            m2 = re.match(regexMatch2, line[1])
            m3 = re.match(regexMatch3, line[1])

            if m1 is not None:
                n_prints += 1

            if m3 is not None:
                if re.search(r'm',m3.group('res')):
                    res = float(m3.group('res').split('m')[0]) * 1024
                else:
                    res = float(m3.group('res'))

                res_f += res
                cpu_f += float(m3.group('CPU'))

        d["res"] = res_f / (n_prints)
        d["cpu"] = cpu_f / n_prints

def pidstat(file):
    regexMatch = (r'(?P<time>\d{2}:\d{2}:\d{2})\s+(?P<pid>\d+)\s+(?P<usr>\d+\.\d+)\s+'
    '(?P<sys>\d+\.\d+)\s+(?P<guest>\d+\.\d+)\s+(?P<cpu>\d+\.\d+)'
    '\s+\d+\s+(?P<COMMAND>'+r'lu'+')')
    regexNewLine = r'.*Command'

    usr = 0
    sys = 0
    guest = 0
    cpu = 0
    n_prints = 0
    with open('commands_output/' + file) as fp:
        for line in enumerate(fp):
            m = re.match(regexMatch, line[1])
            m2 = re.match(regexNewLine, line[1])

            if m2 is not None:
                n_prints += 1

            if m is not None:
                usr += float(m.group('usr'))
                sys += float(m.group('sys'))
                guest += float(m.group('guest'))
                cpu += float(m.group('cpu'))

    d["usr"] = usr / (n_prints)
    d["sys"] = sys / (n_prints)
    d["guest"] = guest / (n_prints)
    d["cpu"] = cpu / (n_prints)

def pidstat_d(file):
    regexMatch = (r'(?P<time>\d{2}:\d{2}:\d{2})\s+(?P<pid>\d+)\s+(?P<kB_rd>\d+\.\d+)\s+'
    '(?P<kB_wd>\d+\.\d+)\s+(?P<kB_ccwr>\d+\.\d+)\s+(?P<COMMAND>'+bin_name+')')
    regexNewLine = r'.*Command'
    
    n_prints = 0
    kb_rd = kb_wd = kb_ccwr = 0

    with open('commands_output/' + file) as fp:
        for line in enumerate(fp):
            m = re.match(regexMatch, line[1])
            m2 = re.match(regexNewLine, line[1])

            if m2 is not None:
                n_prints += 1

            if m is not None:
                kb_rd += float(m.group('kB_rd'))
                kb_wd += float(m.group('kB_wd'))
                kb_ccwr += float(m.group('kB_ccwr'))

    d["kb_rd"] = kb_rd / (n_prints)
    d["kb_wd"] = kb_wd / n_prints
    d["kb_ccwr"] = kb_ccwr / n_prints
        

def mpstat(file):
    regexMatch = (r'(?P<time>\d{2}:\d{2}:\d{2})\s+all\s+(?P<usr>\d+\.\d+)\s+'
        '(?P<nice>\d+\.\d+)\s+(?P<sys>\d+\.\d+)\s+(?P<iowait>\d+\.\d+)\s+(?P<irq>\d+\.\d+)\s+'
            '(?P<soft>\d+\.\d+)\s+(?P<steal>\d+\.\d+)\s+(?P<guest>\d+\.\d+)\s+(?P<idle>\d+\.\d+)')

    usr = sys = iowait = idle = 0
    n_prints = 0

    with open('commands_output/' + file) as fp:
        for line in enumerate(fp):
            m = re.match(regexMatch, line[1])
            if m is not None:
                usr += float(m.group('usr'))
                sys += float(m.group('sys'))
                iowait += float(m.group('iowait'))
                idle += float(m.group('idle'))
                n_prints += 1

    d["usr"] = usr / n_prints
    d["sys"] = sys / n_prints
    d["iowait"] = iowait / n_prints
    d["idle"] = idle / n_prints

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
Class=""
last=""

with open(file_tempos) as fp:
    for line in enumerate(fp):
        if state == "bin":
            if match := re.search(r'\s*Class\s*=\s*(.*)',line[1]):
                Class = match.group(1)
            elif match := re.search(r'\s*Time in seconds\s*=\s*(.*)',line[1]):
                time = float(match.group(1))
            elif match := re.search(r'\s*FFLAGS\s*=\s*(.*)',line[1]):
                fflags = match.group(1)
            elif re.match(r'\+\+ pkill ps',line[1]):
                if Class == "":
                    state = ""
                    continue
                if Class+fflags == last:
                    i-=1
                else:
                    i=10

                d = {"Class":Class,"Time":time, "FFlags":fflags}

                if match := re.search(r'\s*-O(\d)',fflags):
                    oflags = match.group(1)
                if all:
                    command_file = input_script.split('.')[0]+'_0'+oflags+'_class_'+Class+'_'+command+'_all_'+str(i)
                else:
                    command_file = input_script.split('.')[0]+'_0'+oflags+'_class_'+Class+'_'+command+'_'+str(i)

                if os.path.isfile('commands_output/'+command_file):
                    if command == 'top':
                        top(command_file)
                    if command == 'pidstat':
                        pidstat(command_file)
                    if command == 'pidstat_d':
                        pidstat_d(command_file)
                    if command == 'mpstat':
                        mpstat(command_file)

                    l = resultados.get(Class+fflags,list())
                    l.append(d)
                    resultados[Class+fflags]=l
                    
                    last = Class+fflags
                    state = ""
        elif re.match(r'\+ bin',line[1]):
            state = "bin"
            bin_name = line[1].split('/')[1].split('\n')[0]
            
#print(resultados)

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
            try:
                res += e["res"]
                cpu += e["cpu"]
            except:
                pass
        if command == 'pidstat':
            try:
                usr += e["usr"]
                sys += e["sys"]
                guest += e["guest"]
                cpu += e["cpu"]
            except:
                pass
        if command == 'pidstat_d':
            try:
                kB_rd += e["kB_rd"]
                kB_wd += e["kB_wd"]
                kB_ccwr += e["kB_ccwr"]
            except:
                pass
        if command == 'mpstat':
            try:
                usr += e["usr"]
                sys += e["sys"]
                iowait += e["iowait"]
                idle += e["idle"]
            except:
                pass

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

    if fflags == "-O0 -fopenmp":
        y = 0
    elif fflags == "-O1 -fopenmp":
        y = 1
    elif fflags == "-O2 -fopenmp":
        y = 2
    elif fflags == "-O3 -fopenmp":
        y = 3

    if command == 'top':
        res = round(res / len(minimos), 3)
        cpu = round(cpu / len(minimos), 3)

        print(str(x) + " " + str(y) + " " + str(time) + " " + str(res) + " " + str(cpu) + " " + fflags + " " + Class + " ")

    if command == 'pidstat':
        usr = round(usr / len(minimos), 3)
        sys = round(sys / len(minimos), 3)
        guest = round(guest / len(minimos), 3)
        cpu = round(cpu / len(minimos), 3)

        print(str(x) + " " + str(y) + " " + str(time) + " " + str(usr) + " " + str(sys) + " " + str(usr+sys) + " " + str(guest) + " " + str(cpu) + " " + fflags + " " + Class + " ")

    if command == 'pidstat_d':
        kB_rd = round(kB_rd / len(minimos), 3)
        kB_wd = round(kB_wd / len(minimos), 3)
        kB_ccwr = round(kB_ccwr / len(minimos), 3)

        print(str(x) + " " + str(y) + " " + str(time) + " " + str(kB_rd) + " " + str(kB_wd) + " " + str(kB_ccwr) + " " + fflags + " " + Class + " ")

    if command == 'mpstat':
        usr = round(usr / len(minimos), 3)
        sys = round(sys / len(minimos), 3)
        iowait = round(iowait / len(minimos), 3)
        idle = round(idle / len(minimos), 3)

        print(str(x)+ " " + str(y)+ " " + str(time) + " " + str(usr) + " " + str(sys) + " " + str(usr+sys) + " " + str(iowait) + " " + str(idle) + " " + fflags + " " + Class +" ")
