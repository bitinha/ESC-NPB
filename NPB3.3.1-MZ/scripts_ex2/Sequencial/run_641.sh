#!/bin/sh
#
#PBS -N SERIAL-MZ_f77_641
#PBS -l walltime=10:00:00
#PBS -l nodes=1:r641:ppn=32
#PBS -j oe 
cd ESC/TP1/NPB3.3-MZ-SER

module load gnu/openmpi_eth/1.8.4
module load gcc/5.3.0
set -x


cp config/makeo0.def config/make.def
make bt-mz CLASS=W
make bt-mz CLASS=A
make bt-mz CLASS=B
make bt-mz CLASS=C
echo 'O0'
echo '------------Class W------------'

for i in {1..10}
do
    date
    bin/bt-mz.W.x &
    pid=$!
    
    top -d 2 -b -p $pid > 641_00_class_W__top_$i &
    pidstat 2 -p $pid > 641_00_class_W__pidstat_$i &
    mpstat 2 > 641_00_class_W__mpstat_$i &
    iostat -t 2 > 641_00_class_W__iostat_$i &
    lsof -r 2 -p $pid > 641_00_class_W__lsof_$i &
    #free -hs 2 > 641_00_class_W__free_$i & # free do search não tem opção -h
    #free -ms 2 > 641_00_class_W__free_$i &
    #vmstat 2 > 641_00_class_W__vmstat_$i &
    #cat cat /proc/meminfo > 641_00_class_W__meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > 641_00_class_W__ps_$i &
    
    wait $pid
    pkill top
    pkill pidstat
    pkill mpstat
    pkill iostat
    pkill lsof
    #pkill free
    #pkill vmstat
    #pkill ps
done
echo '------------Class A------------'

for i in {1..10}
do
    date
    bin/bt-mz.A.x &
    pid=$!
    
    top -d 2 -b -p $pid > 641_00_class_A__top_$i &
    pidstat 2 -p $pid > 641_00_class_A__pidstat_$i &
    mpstat 2 > 641_00_class_A__mpstat_$i &
    iostat -t 2 > 641_00_class_A__iostat_$i &
    lsof -r 2 -p $pid > 641_00_class_A__lsof_$i &
    #free -hs 2 > 641_00_class_A__free_$i & # free do search não tem opção -h
    #free -ms 2 > 641_00_class_A__free_$i &
    #vmstat 2 > 641_00_class_A__vmstat_$i &
    #cat cat /proc/meminfo > 641_00_class_A__meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > 641_00_class_A__ps_$i &
    
    wait $pid
    pkill top
    pkill pidstat
    pkill mpstat
    pkill iostat
    pkill lsof
    #pkill free
    #pkill vmstat
    #pkill ps
done
echo '------------Class B------------'

for i in {1..10}
do
    date
    bin/bt-mz.B.x &
    pid=$!
    
    top -d 2 -b -p $pid > 641_00_class_B__top_$i &
    pidstat 2 -p $pid > 641_00_class_B__pidstat_$i &
    mpstat 2 > 641_00_class_B__mpstat_$i &
    iostat -t 2 > 641_00_class_B__iostat_$i &
    lsof -r 2 -p $pid > 641_00_class_B__lsof_$i &
    #free -hs 2 > 641_00_class_B__free_$i & # free do search não tem opção -h
    #free -ms 2 > 641_00_class_B__free_$i &
    #vmstat 2 > 641_00_class_B__vmstat_$i &
    #cat cat /proc/meminfo > 641_00_class_B__meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > 641_00_class_B__ps_$i &
    
    wait $pid
    pkill top
    pkill pidstat
    pkill mpstat
    pkill iostat
    pkill lsof
    #pkill free
    #pkill vmstat
    #pkill ps
done
echo '------------Class C------------'


date
bin/bt-mz.C.x &
pid=$!

top -d 2 -b -p $pid > 641_00_class_C__top_$i &
pidstat 2 -p $pid > 641_00_class_C__pidstat_$i &
mpstat 2 > 641_00_class_C__mpstat_$i &
iostat -t 2 > 641_00_class_C__iostat_$i &
lsof -r 2 -p $pid > 641_00_class_C__lsof_$i &
#free -hs 2 > 641_00_class_C__free_$i & # free do search não tem opção -h
#free -ms 2 > 641_00_class_C__free_$i &
#vmstat 2 > 641_00_class_C__vmstat_$i &
#cat cat /proc/meminfo > 641_00_class_C__meminfo_$i &
#ps -p $pid -o pid,%mem,%cpu > 641_00_class_C__ps_$i &

wait $pid
pkill top
pkill pidstat
pkill mpstat
pkill iostat
pkill lsof
#pkill free
#pkill vmstat
#pkill ps


cp config/makeo1.def config/make.def
make bt-mz CLASS=W
make bt-mz CLASS=A
make bt-mz CLASS=B
make bt-mz CLASS=C
echo 'O1'
echo '------------Class W------------'

for i in {1..10}
do
    date
    bin/bt-mz.W.x &
    pid=$!
    
    top -d 2 -b -p $pid > 641_01_class_W__top_$i &
    pidstat 2 -p $pid > 641_01_class_W__pidstat_$i &
    mpstat 2 > 641_01_class_W__mpstat_$i &
    iostat -t 2 > 641_01_class_W__iostat_$i &
    lsof -r 2 -p $pid > 641_01_class_W__lsof_$i &
    #free -hs 2 > 641_01_class_W__free_$i & # free do search não tem opção -h
    #free -ms 2 > 641_01_class_W__free_$i &
    #vmstat 2 > 641_01_class_W__vmstat_$i &
    #cat cat /proc/meminfo > 641_01_class_W__meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > 641_01_class_W__ps_$i &
    
    wait $pid
    pkill top
    pkill pidstat
    pkill mpstat
    pkill iostat
    pkill lsof
    #pkill free
    #pkill vmstat
    #pkill ps
done
echo '------------Class A------------'

for i in {1..10}
do
    date
    bin/bt-mz.A.x &
    pid=$!
    
    top -d 2 -b -p $pid > 641_01_class_A__top_$i &
    pidstat 2 -p $pid > 641_01_class_A__pidstat_$i &
    mpstat 2 > 641_01_class_A__mpstat_$i &
    iostat -t 2 > 641_01_class_A__iostat_$i &
    lsof -r 2 -p $pid > 641_01_class_A__lsof_$i &
    #free -hs 2 > 641_01_class_A__free_$i & # free do search não tem opção -h
    #free -ms 2 > 641_01_class_A__free_$i &
    #vmstat 2 > 641_01_class_A__vmstat_$i &
    #cat cat /proc/meminfo > 641_01_class_A__meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > 641_01_class_A__ps_$i &
    
    wait $pid
    pkill top
    pkill pidstat
    pkill mpstat
    pkill iostat
    pkill lsof
    #pkill free
    #pkill vmstat
    #pkill ps
done
echo '------------Class B------------'

for i in {1..10}
do
    date
    bin/bt-mz.B.x &
    pid=$!
    
    top -d 2 -b -p $pid > 641_01_class_B__top_$i &
    pidstat 2 -p $pid > 641_01_class_B__pidstat_$i &
    mpstat 2 > 641_01_class_B__mpstat_$i &
    iostat -t 2 > 641_01_class_B__iostat_$i &
    lsof -r 2 -p $pid > 641_01_class_B__lsof_$i &
    #free -hs 2 > 641_01_class_B__free_$i & # free do search não tem opção -h
    #free -ms 2 > 641_01_class_B__free_$i &
    #vmstat 2 > 641_01_class_B__vmstat_$i &
    #cat cat /proc/meminfo > 641_01_class_B__meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > 641_01_class_B__ps_$i &
    
    wait $pid
    pkill top
    pkill pidstat
    pkill mpstat
    pkill iostat
    pkill lsof
    #pkill free
    #pkill vmstat
    #pkill ps
done
echo '------------Class C------------'


date
bin/bt-mz.C.x &
pid=$!

top -d 2 -b -p $pid > 641_01_class_C__top_$i &
pidstat 2 -p $pid > 641_01_class_C__pidstat_$i &
mpstat 2 > 641_01_class_C__mpstat_$i &
iostat -t 2 > 641_01_class_C__iostat_$i &
lsof -r 2 -p $pid > 641_01_class_C__lsof_$i &
#free -hs 2 > 641_01_class_C__free_$i & # free do search não tem opção -h
#free -ms 2 > 641_01_class_C__free_$i &
#vmstat 2 > 641_01_class_C__vmstat_$i &
#cat cat /proc/meminfo > 641_01_class_C__meminfo_$i &
#ps -p $pid -o pid,%mem,%cpu > 641_01_class_C__ps_$i &

wait $pid
pkill top
pkill pidstat
pkill mpstat
pkill iostat
pkill lsof
#pkill free
#pkill vmstat
#pkill ps


cp config/makeo2.def config/make.def
make bt-mz CLASS=W
make bt-mz CLASS=A
make bt-mz CLASS=B
make bt-mz CLASS=C
echo 'O2'
echo '------------Class W------------'

for i in {1..10}
do
    date
    bin/bt-mz.W.x &
    pid=$!
    
    top -d 2 -b -p $pid > 641_02_class_W__top_$i &
    pidstat 2 -p $pid > 641_02_class_W__pidstat_$i &
    mpstat 2 > 641_02_class_W__mpstat_$i &
    iostat -t 2 > 641_02_class_W__iostat_$i &
    lsof -r 2 -p $pid > 641_02_class_W__lsof_$i &
    #free -hs 2 > 641_02_class_W__free_$i & # free do search não tem opção -h
    #free -ms 2 > 641_02_class_W__free_$i &
    #vmstat 2 > 641_02_class_W__vmstat_$i &
    #cat cat /proc/meminfo > 641_02_class_W__meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > 641_02_class_W__ps_$i &
    
    wait $pid
    pkill top
    pkill pidstat
    pkill mpstat
    pkill iostat
    pkill lsof
    #pkill free
    #pkill vmstat
    #pkill ps
done
echo '------------Class A------------'

for i in {1..10}
do
    date
    bin/bt-mz.A.x &
    pid=$!
    
    top -d 2 -b -p $pid > 641_02_class_A__top_$i &
    pidstat 2 -p $pid > 641_02_class_A__pidstat_$i &
    mpstat 2 > 641_02_class_A__mpstat_$i &
    iostat -t 2 > 641_02_class_A__iostat_$i &
    lsof -r 2 -p $pid > 641_02_class_A__lsof_$i &
    #free -hs 2 > 641_02_class_A__free_$i & # free do search não tem opção -h
    #free -ms 2 > 641_02_class_A__free_$i &
    #vmstat 2 > 641_02_class_A__vmstat_$i &
    #cat cat /proc/meminfo > 641_02_class_A__meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > 641_02_class_A__ps_$i &
    
    wait $pid
    pkill top
    pkill pidstat
    pkill mpstat
    pkill iostat
    pkill lsof
    #pkill free
    #pkill vmstat
    #pkill ps
done
echo '------------Class B------------'

for i in {1..10}
do
    date
    bin/bt-mz.B.x &
    pid=$!
    
    top -d 2 -b -p $pid > 641_02_class_B__top_$i &
    pidstat 2 -p $pid > 641_02_class_B__pidstat_$i &
    mpstat 2 > 641_02_class_B__mpstat_$i &
    iostat -t 2 > 641_02_class_B__iostat_$i &
    lsof -r 2 -p $pid > 641_02_class_B__lsof_$i &
    #free -hs 2 > 641_02_class_B__free_$i & # free do search não tem opção -h
    #free -ms 2 > 641_02_class_B__free_$i &
    #vmstat 2 > 641_02_class_B__vmstat_$i &
    #cat cat /proc/meminfo > 641_02_class_B__meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > 641_02_class_B__ps_$i &
    
    wait $pid
    pkill top
    pkill pidstat
    pkill mpstat
    pkill iostat
    pkill lsof
    #pkill free
    #pkill vmstat
    #pkill ps
done
echo '------------Class C------------'

date
bin/bt-mz.C.x &
pid=$!
    
top -d 2 -b -p $pid > 641_02_class_C__top_$i &
pidstat 2 -p $pid > 641_02_class_C__pidstat_$i &
mpstat 2 > 641_02_class_C__mpstat_$i &
iostat -t 2 > 641_02_class_C__iostat_$i &
lsof -r 2 -p $pid > 641_02_class_C__lsof_$i &
#free -hs 2 > 641_02_class_C__free_$i & # free do search não tem opção -h
#free -ms 2 > 641_02_class_C__free_$i &
#vmstat 2 > 641_02_class_C__vmstat_$i &
#cat cat /proc/meminfo > 641_02_class_C__meminfo_$i &
#ps -p $pid -o pid,%mem,%cpu > 641_02_class_C__ps_$i &

wait $pid
pkill top
pkill pidstat
pkill mpstat
pkill iostat
pkill lsof
#pkill free
#pkill vmstat
#pkill ps


cp config/makeo3.def config/make.def
make bt-mz CLASS=W
make bt-mz CLASS=A
make bt-mz CLASS=B
make bt-mz CLASS=C
echo 'O3'
echo '------------Class W------------'

for i in {1..10}
do
    date
    bin/bt-mz.W.x &
    pid=$!
    
    top -d 2 -b -p $pid > 641_03_class_W__top_$i &
    pidstat 2 -p $pid > 641_03_class_W__pidstat_$i &
    mpstat 2 > 641_03_class_W__mpstat_$i &
    iostat -t 2 > 641_03_class_W__iostat_$i &
    lsof -r 2 -p $pid > 641_03_class_W__lsof_$i &
    #free -hs 2 > 641_03_class_W__free_$i & # free do search não tem opção -h
    #free -ms 2 > 641_03_class_W__free_$i &
    #vmstat 2 > 641_03_class_W__vmstat_$i &
    #cat cat /proc/meminfo > 641_03_class_W__meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > 641_03_class_W__ps_$i &
    
    wait $pid
    pkill top
    pkill pidstat
    pkill mpstat
    pkill iostat
    pkill lsof
    #pkill free
    #pkill vmstat
    #pkill ps
done
echo '------------Class A------------'

for i in {1..10}
do
    date
    bin/bt-mz.A.x &
    pid=$!
    
    top -d 2 -b -p $pid > 641_03_class_A__top_$i &
    pidstat 2 -p $pid > 641_03_class_A__pidstat_$i &
    mpstat 2 > 641_03_class_A__mpstat_$i &
    iostat -t 2 > 641_03_class_A__iostat_$i &
    lsof -r 2 -p $pid > 641_03_class_A__lsof_$i &
    #free -hs 2 > 641_03_class_A__free_$i & # free do search não tem opção -h
    #free -ms 2 > 641_03_class_A__free_$i &
    #vmstat 2 > 641_03_class_A__vmstat_$i &
    #cat cat /proc/meminfo > 641_03_class_A__meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > 641_03_class_A__ps_$i &
    
    wait $pid
    pkill top
    pkill pidstat
    pkill mpstat
    pkill iostat
    pkill lsof
    #pkill free
    #pkill vmstat
    #pkill ps
done
echo '------------Class B------------'

for i in {1..10}
do
    date
    bin/bt-mz.B.x &
    pid=$!
    
    top -d 2 -b -p $pid > 641_03_class_B__top_$i &
    pidstat 2 -p $pid > 641_03_class_B__pidstat_$i &
    mpstat 2 > 641_03_class_B__mpstat_$i &
    iostat -t 2 > 641_03_class_B__iostat_$i &
    lsof -r 2 -p $pid > 641_03_class_B__lsof_$i &
    #free -hs 2 > 641_03_class_B__free_$i & # free do search não tem opção -h
    #free -ms 2 > 641_03_class_B__free_$i &
    #vmstat 2 > 641_03_class_B__vmstat_$i &
    #cat cat /proc/meminfo > 641_03_class_B__meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > 641_03_class_B__ps_$i &
    
    wait $pid
    pkill top
    pkill pidstat
    pkill mpstat
    pkill iostat
    pkill lsof
    #pkill free
    #pkill vmstat
    #pkill ps
done
echo '------------Class C------------'

date
bin/bt-mz.C.x &
pid=$!
    
top -d 2 -b -p $pid > 641_03_class_C__top_$i &
pidstat 2 -p $pid > 641_03_class_C__pidstat_$i &
mpstat 2 > 641_03_class_C__mpstat_$i &
iostat -t 2 > 641_03_class_C__iostat_$i &
lsof -r 2 -p $pid > 641_03_class_C__lsof_$i &
#free -hs 2 > 641_03_class_C__free_$i & # free do search não tem opção -h
#free -ms 2 > 641_03_class_C__free_$i &
#vmstat 2 > 641_03_class_C__vmstat_$i &
#cat cat /proc/meminfo > 641_03_class_C__meminfo_$i &
#ps -p $pid -o pid,%mem,%cpu > 641_03_class_C__ps_$i &

wait $pid
pkill top
pkill pidstat
pkill mpstat
pkill iostat
pkill lsof
#pkill free
#pkill vmstat
#pkill ps
