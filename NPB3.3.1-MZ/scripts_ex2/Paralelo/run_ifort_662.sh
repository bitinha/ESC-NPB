#!/bin/sh
#
#PBS -N MPI-MZ_ifort_662
#PBS -l walltime=10:00:00
#PBS -l nodes=1:r662:ppn=48
#PBS -j oe 
cd ESC/TP1/NPB3.3-MZ-MPI

module load gnu/openmpi_eth/1.8.4
module load gcc/5.3.0
set -x

export OMP_NUM_THREADS=2

cp config/makeo0.def_ifort config/make.def
make bt-mz CLASS=W NPROCS=24
make bt-mz CLASS=A NPROCS=24
make bt-mz CLASS=B NPROCS=24
make bt-mz CLASS=C NPROCS=24
echo 'O0'
echo '------------Class W------------'

for i in {1..10}
do
    date
    mpirun -np 24 bin/bt-mz.W.24 &
    pid=$!
    
    top -d 2 -b -p $pid > ifort_00_class_W_op_$i &
    pidstat 2 -p $pid > ifort_00_class_W_pidstat_$i &
    mpstat 2 > ifort_00_class_W_mpstat_$i &
    iostat -t 2 > ifort_00_class_W_iostat_$i &
    lsof -r 2 -p $pid > ifort_00_class_W_lsof_$i &
    #free -hs 2 > ifort_00_class_W_free_$i & # free do search não tem opção -h
    #free -ms 2 > ifort_00_class_W_free_$i &
    #vmstat 2 > ifort_00_class_W_vmstat_$i &
    #cat cat /proc/meminfo > ifort_00_class_W_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > ifort_00_class_W_ps_$i &
    
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
    mpirun -np 24 bin/bt-mz.A.24 &
    pid=$!
    
    top -d 2 -b -p $pid > ifort_00_class_A_top_$i &
    pidstat 2 -p $pid > ifort_00_class_A_pidstat_$i &
    mpstat 2 > ifort_00_class_A_mpstat_$i &
    iostat -t 2 > ifort_00_class_A_iostat_$i &
    lsof -r 2 -p $pid > ifort_00_class_A_lsof_$i &
    #free -hs 2 > ifort_00_class_A_free_$i & # free do search não tem opção -h
    #free -ms 2 > ifort_00_class_A_free_$i &
    #vmstat 2 > ifort_00_class_A_vmstat_$i &
    #cat cat /proc/meminfo > ifort_00_class_A_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > ifort_00_class_A_ps_$i &
    
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
    mpirun -np 24 bin/bt-mz.B.24 &
    pid=$!
    
    top -d 2 -b -p $pid > ifort_00_class_B_top_$i &
    pidstat 2 -p $pid > ifort_00_class_B_pidstat_$i &
    mpstat 2 > ifort_00_class_B_mpstat_$i &
    iostat -t 2 > ifort_00_class_B_iostat_$i &
    lsof -r 2 -p $pid > ifort_00_class_B_lsof_$i &
    #free -hs 2 > ifort_00_class_B_free_$i & # free do search não tem opção -h
    #free -ms 2 > ifort_00_class_B_free_$i &
    #vmstat 2 > ifort_00_class_B_vmstat_$i &
    #cat cat /proc/meminfo > ifort_00_class_B_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > ifort_00_class_B_ps_$i &
    
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
mpirun -np 24 bin/bt-mz.C.24 &
pid=$!
    
top -d 2 -b -p $pid > ifort_00_class_C_top_$i &
pidstat 2 -p $pid > ifort_00_class_C_pidstat_$i &
mpstat 2 > ifort_00_class_C_mpstat_$i &
iostat -t 2 > ifort_00_class_C_iostat_$i &
lsof -r 2 -p $pid > ifort_00_class_C_lsof_$i &
#free -hs 2 > ifort_00_class_C_free_$i & # free do search não tem opção -h
#free -ms 2 > ifort_00_class_C_free_$i &
#vmstat 2 > ifort_00_class_C_vmstat_$i &
#cat cat /proc/meminfo > ifort_00_class_C_meminfo_$i &
#ps -p $pid -o pid,%mem,%cpu > ifort_00_class_C_ps_$i &

wait $pid
pkill top
pkill pidstat
pkill mpstat
pkill iostat
pkill lsof
#pkill free
#pkill vmstat
#pkill ps


cp config/makeo1.def_ifort config/make.def
make bt-mz CLASS=W NPROCS=24
make bt-mz CLASS=A NPROCS=24
make bt-mz CLASS=B NPROCS=24
make bt-mz CLASS=C NPROCS=24
echo 'O1'
echo '------------Class W------------'

for i in {1..10}
do
    date
    mpirun -np 24 bin/bt-mz.W.24 &
    pid=$!
    
    top -d 2 -b -p $pid > ifort_01_class_W_top_$i &
    pidstat 2 -p $pid > ifort_01_class_W_pidstat_$i &
    mpstat 2 > ifort_01_class_W_mpstat_$i &
    iostat -t 2 > ifort_01_class_W_iostat_$i &
    lsof -r 2 -p $pid > ifort_01_class_W_lsof_$i &
    #free -hs 2 > ifort_01_class_W_free_$i & # free do search não tem opção -h
    #free -ms 2 > ifort_01_class_W_free_$i &
    #vmstat 2 > ifort_01_class_W_vmstat_$i &
    #cat cat /proc/meminfo > ifort_01_class_W_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > ifort_01_class_W_ps_$i &
    
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
    mpirun -np 24 bin/bt-mz.A.24 &
    pid=$!
    
    top -d 2 -b -p $pid > ifort_01_class_A_top_$i &
    pidstat 2 -p $pid > ifort_01_class_A_pidstat_$i &
    mpstat 2 > ifort_01_class_A_mpstat_$i &
    iostat -t 2 > ifort_01_class_A_iostat_$i &
    lsof -r 2 -p $pid > ifort_01_class_A_lsof_$i &
    #free -hs 2 > ifort_01_class_A_free_$i & # free do search não tem opção -h
    #free -ms 2 > ifort_01_class_A_free_$i &
    #vmstat 2 > ifort_01_class_A_vmstat_$i &
    #cat cat /proc/meminfo > ifort_01_class_A_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > ifort_01_class_A_ps_$i &
    
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
    mpirun -np 24 bin/bt-mz.B.24 &
    pid=$!
    
    top -d 2 -b -p $pid > ifort_01_class_B_top_$i &
    pidstat 2 -p $pid > ifort_01_class_B_pidstat_$i &
    mpstat 2 > ifort_01_class_B_mpstat_$i &
    iostat -t 2 > ifort_01_class_B_iostat_$i &
    lsof -r 2 -p $pid > ifort_01_class_B_lsof_$i &
    #free -hs 2 > ifort_01_class_B_free_$i & # free do search não tem opção -h
    #free -ms 2 > ifort_01_class_B_free_$i &
    #vmstat 2 > ifort_01_class_B_vmstat_$i &
    #cat cat /proc/meminfo > ifort_01_class_B_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > ifort_01_class_B_ps_$i &
    
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
mpirun -np 24 bin/bt-mz.C.24 &
pid=$!
    
top -d 2 -b -p $pid > ifort_01_class_C_top_$i &
pidstat 2 -p $pid > ifort_01_class_C_pidstat_$i &
mpstat 2 > ifort_01_class_C_mpstat_$i &
iostat -t 2 > ifort_01_class_C_iostat_$i &
lsof -r 2 -p $pid > ifort_01_class_C_lsof_$i &
#free -hs 2 > ifort_01_class_C_free_$i & # free do search não tem opção -h
#free -ms 2 > ifort_01_class_C_free_$i &
#vmstat 2 > ifort_01_class_C_vmstat_$i &
#cat cat /proc/meminfo > ifort_01_class_C_meminfo_$i &
#ps -p $pid -o pid,%mem,%cpu > ifort_01_class_C_ps_$i &

wait $pid
pkill top
pkill pidstat
pkill mpstat
pkill iostat
pkill lsof
#pkill free
#pkill vmstat
#pkill ps


cp config/makeo2.def_ifort config/make.def
make bt-mz CLASS=W NPROCS=24
make bt-mz CLASS=A NPROCS=24
make bt-mz CLASS=B NPROCS=24
make bt-mz CLASS=C NPROCS=24
echo 'O2'
echo '------------Class W------------'

for i in {1..10}
do
    date
    mpirun -np 24 bin/bt-mz.W.24 &
    pid=$!
    
    top -d 2 -b -p $pid > ifort_02_class_W_top_$i &
    pidstat 2 -p $pid > ifort_02_class_W_pidstat_$i &
    mpstat 2 > ifort_02_class_W_mpstat_$i &
    iostat -t 2 > ifort_02_class_W_iostat_$i &
    lsof -r 2 -p $pid > ifort_02_class_W_lsof_$i &
    #free -hs 2 > ifort_02_class_W_free_$i & # free do search não tem opção -h
    #free -ms 2 > ifort_02_class_W_free_$i &
    #vmstat 2 > ifort_02_class_W_vmstat_$i &
    #cat cat /proc/meminfo > ifort_02_class_W_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > ifort_02_class_W_ps_$i &
    
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
    mpirun -np 24 bin/bt-mz.A.24 &
    pid=$!
    
    top -d 2 -b -p $pid > ifort_02_class_A_top_$i &
    pidstat 2 -p $pid > ifort_02_class_A_pidstat_$i &
    mpstat 2 > ifort_02_class_A_mpstat_$i &
    iostat -t 2 > ifort_02_class_A_iostat_$i &
    lsof -r 2 -p $pid > ifort_02_class_A_lsof_$i &
    #free -hs 2 > ifort_02_class_A_free_$i & # free do search não tem opção -h
    #free -ms 2 > ifort_02_class_A_free_$i &
    #vmstat 2 > ifort_02_class_A_vmstat_$i &
    #cat cat /proc/meminfo > ifort_02_class_A_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > ifort_02_class_A_ps_$i &
    
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
    mpirun -np 24 bin/bt-mz.B.24 &
    pid=$!
    
    top -d 2 -b -p $pid > ifort_02_class_B_top_$i &
    pidstat 2 -p $pid > ifort_02_class_B_pidstat_$i &
    mpstat 2 > ifort_02_class_B_mpstat_$i &
    iostat -t 2 > ifort_02_class_B_iostat_$i &
    lsof -r 2 -p $pid > ifort_02_class_B_lsof_$i &
    #free -hs 2 > ifort_02_class_B_free_$i & # free do search não tem opção -h
    #free -ms 2 > ifort_02_class_B_free_$i &
    #vmstat 2 > ifort_02_class_B_vmstat_$i &
    #cat cat /proc/meminfo > ifort_02_class_B_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > ifort_02_class_B_ps_$i &
    
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
mpirun -np 24 bin/bt-mz.C.24 &
pid=$!
    
top -d 2 -b -p $pid > ifort_02_class_C_top_$i &
pidstat 2 -p $pid > ifort_02_class_C_pidstat_$i &
mpstat 2 > ifort_02_class_C_mpstat_$i &
iostat -t 2 > ifort_02_class_C_iostat_$i &
lsof -r 2 -p $pid > ifort_02_class_C_lsof_$i &
#free -hs 2 > ifort_02_class_C_free_$i & # free do search não tem opção -h
#free -ms 2 > ifort_02_class_C_free_$i &
#vmstat 2 > ifort_02_class_C_vmstat_$i &
#cat cat /proc/meminfo > ifort_02_class_C_meminfo_$i &
#ps -p $pid -o pid,%mem,%cpu > ifort_02_class_C_ps_$i &

wait $pid
pkill top
pkill pidstat
pkill mpstat
pkill iostat
pkill lsof
#pkill free
#pkill vmstat
#pkill ps


cp config/makeo3.def_ifort config/make.def
make bt-mz CLASS=W NPROCS=24
make bt-mz CLASS=A NPROCS=24
make bt-mz CLASS=B NPROCS=24
make bt-mz CLASS=C NPROCS=24
echo 'O3'
echo '------------Class W------------'

for i in {1..10}
do
    date
    mpirun -np 24 bin/bt-mz.W.24 &
    pid=$!
    
    top -d 2 -b -p $pid > ifort_03_class_W_top_$i &
    pidstat 2 -p $pid > ifort_03_class_W_pidstat_$i &
    mpstat 2 > ifort_03_class_W_mpstat_$i &
    iostat -t 2 > ifort_03_class_W_iostat_$i &
    lsof -r 2 -p $pid > ifort_03_class_W_lsof_$i &
    #free -hs 2 > ifort_03_class_W_free_$i & # free do search não tem opção -h
    #free -ms 2 > ifort_03_class_W_free_$i &
    #vmstat 2 > ifort_03_class_W_vmstat_$i &
    #cat cat /proc/meminfo > ifort_03_class_W_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > ifort_03_class_W_ps_$i &
    
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
    mpirun -np 24 bin/bt-mz.A.24 &
    pid=$!
    
    top -d 2 -b -p $pid > ifort_03_class_A_top_$i &
    pidstat 2 -p $pid > ifort_03_class_A_pidstat_$i &
    mpstat 2 > ifort_03_class_A_mpstat_$i &
    iostat -t 2 > ifort_03_class_A_iostat_$i &
    lsof -r 2 -p $pid > ifort_03_class_A_lsof_$i &
    #free -hs 2 > ifort_03_class_A_free_$i & # free do search não tem opção -h
    #free -ms 2 > ifort_03_class_A_free_$i &
    #vmstat 2 > ifort_03_class_A_vmstat_$i &
    #cat cat /proc/meminfo > ifort_03_class_A_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > ifort_03_class_A_ps_$i &
    
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
    mpirun -np 24 bin/bt-mz.B.24 &
    pid=$!
    
    top -d 2 -b -p $pid > ifort_03_class_B_top_$i &
    pidstat 2 -p $pid > ifort_03_class_B_pidstat_$i &
    mpstat 2 > ifort_03_class_B_mpstat_$i &
    iostat -t 2 > ifort_03_class_B_iostat_$i &
    lsof -r 2 -p $pid > ifort_03_class_B_lsof_$i &
    #free -hs 2 > ifort_03_class_B_free_$i & # free do search não tem opção -h
    #free -ms 2 > ifort_03_class_B_free_$i &
    #vmstat 2 > ifort_03_class_B_vmstat_$i &
    #cat cat /proc/meminfo > ifort_03_class_B_meminfo_$i &
    #ps -p $pid -o pid,%mem,%cpu > ifort_03_class_B_ps_$i &
    
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
mpirun -np 24 bin/bt-mz.C.24 &
pid=$!
    
top -d 2 -b -p $pid > ifort_03_class_C_top_$i &
pidstat 2 -p $pid > ifort_03_class_C_pidstat_$i &
mpstat 2 > ifort_03_class_C_mpstat_$i &
iostat -t 2 > ifort_03_class_C_iostat_$i &
lsof -r 2 -p $pid > ifort_03_class_C_lsof_$i &
#free -hs 2 > ifort_03_class_C_free_$i & # free do search não tem opção -h
#free -ms 2 > ifort_03_class_C_free_$i &
#vmstat 2 > ifort_03_class_C_vmstat_$i &
#cat cat /proc/meminfo > ifort_03_class_C_meminfo_$i &
#ps -p $pid -o pid,%mem,%cpu > ifort_03_class_C_ps_$i &

wait $pid
pkill top
pkill pidstat
pkill mpstat
pkill iostat
pkill lsof
#pkill free
#pkill vmstat
#pkill ps
