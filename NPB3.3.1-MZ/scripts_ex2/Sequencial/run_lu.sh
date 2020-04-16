#!/bin/sh
#
#PBS -N SERIAL-MZ
#PBS -l walltime=10:00:00
#PBS -l nodes=1:r662:ppn=48
#PBS -j oe 
cd ESC/TP1/NPB3.3-MZ-SER

module load gcc/5.3.0
set -x


cp config/makeo0.def config/make.def
make lu-mz CLASS=W
make lu-mz CLASS=A
make lu-mz CLASS=B
make lu-mz CLASS=C
echo 'O0'
echo '------------Class W------------'

for i in {1..10}
do
    date
    bin/lu-mz.W.x &
    pid=$!
    
    top -d 2 -b -p $pid > lu_00_class_W_top_$i &
    pidstat 2 -p $pid > lu_00_class_W_pidstat_$i &
    mpstat 2 > lu_00_class_W_mpstat_$i &
    iostat -t 2 > lu_00_class_W_iostat_$i &
    lsof -r 2 -p $pid > lu_00_class_W_lsof_$i &
    #free -hs 2 > lu_00_class_W_free_$i & # free do search não tem opção -h
    #free -ms 2 > lu_00_class_W_free_$i &
    #vmstat 2 > lu_00_class_W_vmstat_$i &
    #cat cat /proc/meminfo > lu_00_class_W_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > lu_00_class_W_ps_$i &
    
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
    bin/lu-mz.A.x &
    pid=$!
    
    top -d 2 -b -p $pid > lu_00_class_A_top_$i &
    pidstat 2 -p $pid > lu_00_class_A_pidstat_$i &
    mpstat 2 > lu_00_class_A_mpstat_$i &
    iostat -t 2 > lu_00_class_A_iostat_$i &
    lsof -r 2 -p $pid > lu_00_class_A_lsof_$i &
    #free -hs 2 > lu_00_class_A_free_$i & # free do search não tem opção -h
    #free -ms 2 > lu_00_class_A_free_$i &
    #vmstat 2 > lu_00_class_A_vmstat_$i &
    #cat cat /proc/meminfo > lu_00_class_A_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > lu_00_class_A_ps_$i &
    
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
    bin/lu-mz.B.x &
    pid=$!
    
    top -d 2 -b -p $pid > lu_00_class_B_top_$i &
    pidstat 2 -p $pid > lu_00_class_B_pidstat_$i &
    mpstat 2 > lu_00_class_B_mpstat_$i &
    iostat -t 2 > lu_00_class_B_iostat_$i &
    lsof -r 2 -p $pid > lu_00_class_B_lsof_$i &
    #free -hs 2 > lu_00_class_B_free_$i & # free do search não tem opção -h
    #free -ms 2 > lu_00_class_B_free_$i &
    #vmstat 2 > lu_00_class_B_vmstat_$i &
    #cat cat /proc/meminfo > lu_00_class_B_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > lu_00_class_B_ps_$i &
    
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
bin/lu-mz.C.x &
pid=$!
    
top -d 2 -b -p $pid > lu_00_class_C_top_$i &
pidstat 2 -p $pid > lu_00_class_C_pidstat_$i &
mpstat 2 > lu_00_class_C_mpstat_$i &
iostat -t 2 > lu_00_class_C_iostat_$i &
lsof -r 2 -p $pid > lu_00_class_C_lsof_$i &
#free -hs 2 > lu_00_class_C_free_$i & # free do search não tem opção -h
#free -ms 2 > lu_00_class_C_free_$i &
#vmstat 2 > lu_00_class_C_vmstat_$i &
#cat cat /proc/meminfo > lu_00_class_C_meminfo_$i &
#ps -p $pid -o pid,%mem,%cpu > lu_00_class_C_ps_$i &

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
make lu-mz CLASS=W
make lu-mz CLASS=A
make lu-mz CLASS=B
make lu-mz CLASS=C
echo 'O1'
echo '------------Class W------------'

for i in {1..10}
do
    date
    bin/lu-mz.W.x &
    pid=$!
    
    top -d 2 -b -p $pid > lu_01_class_W_top_$i &
    pidstat 2 -p $pid > lu_01_class_W_pidstat_$i &
    mpstat 2 > lu_01_class_W_mpstat_$i &
    iostat -t 2 > lu_01_class_W_iostat_$i &
    lsof -r 2 -p $pid > lu_01_class_W_lsof_$i &
    #free -hs 2 > lu_01_class_W_free_$i & # free do search não tem opção -h
    #free -ms 2 > lu_01_class_W_free_$i &
    #vmstat 2 > lu_01_class_W_vmstat_$i &
    #cat cat /proc/meminfo > lu_01_class_W_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > lu_01_class_W_ps_$i &
    
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
    bin/lu-mz.A.x &
    pid=$!
    
    top -d 2 -b -p $pid > lu_01_class_A_top_$i &
    pidstat 2 -p $pid > lu_01_class_A_pidstat_$i &
    mpstat 2 > lu_01_class_A_mpstat_$i &
    iostat -t 2 > lu_01_class_A_iostat_$i &
    lsof -r 2 -p $pid > lu_01_class_A_lsof_$i &
    #free -hs 2 > lu_01_class_A_free_$i & # free do search não tem opção -h
    #free -ms 2 > lu_01_class_A_free_$i &
    #vmstat 2 > lu_01_class_A_vmstat_$i &
    #cat cat /proc/meminfo > lu_01_class_A_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > lu_01_class_A_ps_$i &
    
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
    bin/lu-mz.B.x &
    pid=$!
    
    top -d 2 -b -p $pid > lu_01_class_B_top_$i &
    pidstat 2 -p $pid > lu_01_class_B_pidstat_$i &
    mpstat 2 > lu_01_class_B_mpstat_$i &
    iostat -t 2 > lu_01_class_B_iostat_$i &
    lsof -r 2 -p $pid > lu_01_class_B_lsof_$i &
    #free -hs 2 > lu_01_class_B_free_$i & # free do search não tem opção -h
    #free -ms 2 > lu_01_class_B_free_$i &
    #vmstat 2 > lu_01_class_B_vmstat_$i &
    #cat cat /proc/meminfo > lu_01_class_B_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > lu_01_class_B_ps_$i &
    
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
bin/lu-mz.C.x &
pid=$!
    
top -d 2 -b -p $pid > lu_01_class_C_top_$i &
pidstat 2 -p $pid > lu_01_class_C_pidstat_$i &
mpstat 2 > lu_01_class_C_mpstat_$i &
iostat -t 2 > lu_01_class_C_iostat_$i &
lsof -r 2 -p $pid > lu_01_class_C_lsof_$i &
#free -hs 2 > lu_01_class_C_free_$i & # free do search não tem opção -h
#free -ms 2 > lu_01_class_C_free_$i &
#vmstat 2 > lu_01_class_C_vmstat_$i &
#cat cat /proc/meminfo > lu_01_class_C_meminfo_$i &
#ps -p $pid -o pid,%mem,%cpu > lu_01_class_C_ps_$i &

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
make lu-mz CLASS=W
make lu-mz CLASS=A
make lu-mz CLASS=B
make lu-mz CLASS=C
echo 'O2'
echo '------------Class W------------'

for i in {1..10}
do
    date
    bin/lu-mz.W.x &
    pid=$!
    
    top -d 2 -b -p $pid > lu_02_class_W_top_$i &
    pidstat 2 -p $pid > lu_02_class_W_pidstat_$i &
    mpstat 2 > lu_02_class_W_mpstat_$i &
    iostat -t 2 > lu_02_class_W_iostat_$i &
    lsof -r 2 -p $pid > lu_02_class_W_lsof_$i &
    #free -hs 2 > lu_02_class_W_free_$i & # free do search não tem opção -h
    #free -ms 2 > lu_02_class_W_free_$i &
    #vmstat 2 > lu_02_class_W_vmstat_$i &
    #cat cat /proc/meminfo > lu_02_class_W_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > lu_02_class_W_ps_$i &
    
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
    bin/lu-mz.A.x &
    pid=$!
    
    top -d 2 -b -p $pid > lu_02_class_A_top_$i &
    pidstat 2 -p $pid > lu_02_class_A_pidstat_$i &
    mpstat 2 > lu_02_class_A_mpstat_$i &
    iostat -t 2 > lu_02_class_A_iostat_$i &
    lsof -r 2 -p $pid > lu_02_class_A_lsof_$i &
    #free -hs 2 > lu_02_class_A_free_$i & # free do search não tem opção -h
    #free -ms 2 > lu_02_class_A_free_$i &
    #vmstat 2 > lu_02_class_A_vmstat_$i &
    #cat cat /proc/meminfo > lu_02_class_A_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > lu_02_class_A_ps_$i &
    
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
    bin/lu-mz.B.x &
    pid=$!
    
    top -d 2 -b -p $pid > lu_02_class_B_top_$i &
    pidstat 2 -p $pid > lu_02_class_B_pidstat_$i &
    mpstat 2 > lu_02_class_B_mpstat_$i &
    iostat -t 2 > lu_02_class_B_iostat_$i &
    lsof -r 2 -p $pid > lu_02_class_B_lsof_$i &
    #free -hs 2 > lu_02_class_B_free_$i & # free do search não tem opção -h
    #free -ms 2 > lu_02_class_B_free_$i &
    #vmstat 2 > lu_02_class_B_vmstat_$i &
    #cat cat /proc/meminfo > lu_02_class_B_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > lu_02_class_B_ps_$i &
    
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
bin/lu-mz.C.x &
pid=$!
    
top -d 2 -b -p $pid > lu_02_class_C_top_$i &
pidstat 2 -p $pid > lu_02_class_C_pidstat_$i &
mpstat 2 > lu_02_class_C_mpstat_$i &
iostat -t 2 > lu_02_class_C_iostat_$i &
lsof -r 2 -p $pid > lu_02_class_C_lsof_$i &
#free -hs 2 > lu_02_class_C_free_$i & # free do search não tem opção -h
#free -ms 2 > lu_02_class_C_free_$i &
#vmstat 2 > lu_02_class_C_vmstat_$i &
#cat cat /proc/meminfo > lu_02_class_C_meminfo_$i &
#ps -p $pid -o pid,%mem,%cpu > lu_02_class_C_ps_$i &

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
make lu-mz CLASS=W
make lu-mz CLASS=A
make lu-mz CLASS=B
make lu-mz CLASS=C
echo 'O3'
echo '------------Class W------------'

for i in {1..10}
do
    date
    bin/lu-mz.W.x &
    pid=$!
    
    top -d 2 -b -p $pid > lu_03_class_W_top_$i &
    pidstat 2 -p $pid > lu_03_class_W_pidstat_$i &
    mpstat 2 > lu_03_class_W_mpstat_$i &
    iostat -t 2 > lu_03_class_W_iostat_$i &
    lsof -r 2 -p $pid > lu_03_class_W_lsof_$i &
    #free -hs 2 > lu_03_class_W_free_$i & # free do search não tem opção -h
    #free -ms 2 > lu_03_class_W_free_$i &
    #vmstat 2 > lu_03_class_W_vmstat_$i &
    #cat cat /proc/meminfo > lu_03_class_W_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > lu_03_class_W_ps_$i &
    
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
    bin/lu-mz.A.x &
    pid=$!
    
    top -d 2 -b -p $pid > lu_03_class_A_top_$i &
    pidstat 2 -p $pid > lu_03_class_A_pidstat_$i &
    mpstat 2 > lu_03_class_A_mpstat_$i &
    iostat -t 2 > lu_03_class_A_iostat_$i &
    lsof -r 2 -p $pid > lu_03_class_A_lsof_$i &
    #free -hs 2 > lu_03_class_A_free_$i & # free do search não tem opção -h
    #free -ms 2 > lu_03_class_A_free_$i &
    #vmstat 2 > lu_03_class_A_vmstat_$i &
    #cat cat /proc/meminfo > lu_03_class_A_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > lu_03_class_A_ps_$i &
    
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
    bin/lu-mz.B.x &
    pid=$!
    
    top -d 2 -b -p $pid > lu_03_class_B_top_$i &
    pidstat 2 -p $pid > lu_03_class_B_pidstat_$i &
    mpstat 2 > lu_03_class_B_mpstat_$i &
    iostat -t 2 > lu_03_class_B_iostat_$i &
    lsof -r 2 -p $pid > lu_03_class_B_lsof_$i &
    #free -hs 2 > lu_03_class_B_free_$i & # free do search não tem opção -h
    #free -ms 2 > lu_03_class_B_free_$i &
    #vmstat 2 > lu_03_class_B_vmstat_$i &
    #cat cat /proc/meminfo > lu_03_class_B_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > lu_03_class_B_ps_$i &
    
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
bin/lu-mz.C.x &
pid=$!
    
top -d 2 -b -p $pid > lu_03_class_C_top_$i &
pidstat 2 -p $pid > lu_03_class_C_pidstat_$i &
mpstat 2 > lu_03_class_C_mpstat_$i &
iostat -t 2 > lu_03_class_C_iostat_$i &
lsof -r 2 -p $pid > lu_03_class_C_lsof_$i &
#free -hs 2 > lu_03_class_C_free_$i & # free do search não tem opção -h
#free -ms 2 > lu_03_class_C_free_$i &
#vmstat 2 > lu_03_class_C_vmstat_$i &
#cat cat /proc/meminfo > lu_03_class_C_meminfo_$i &
#ps -p $pid -o pid,%mem,%cpu > lu_03_class_C_ps_$i &

wait $pid
pkill top
pkill pidstat
pkill mpstat
pkill iostat
pkill lsof
#pkill free
#pkill vmstat
#pkill ps

