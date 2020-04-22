#!/bin/sh
#
#PBS -N MPI-MZ_speed_LU
#PBS -l walltime=10:00:00
#PBS -l nodes=2:r641:ppn=32
#PBS -j oe 
cd ESC/TP1/NPB3.3-MZ-MPI

module load gnu/openmpi_eth/1.8.4
module load gcc/5.3.0
set -x

export OMP_NUM_THREADS=2

cp config/makeo3.def config/make.def
make lu-mz CLASS=B NPROCS=1
make lu-mz CLASS=B NPROCS=2
make lu-mz CLASS=B NPROCS=4
make lu-mz CLASS=B NPROCS=8
make lu-mz CLASS=B NPROCS=16
make lu-mz CLASS=B NPROCS=32
echo 'O3'
echo '------------Class B------------'

for i in {1..10}
do
	time mpirun -np 1 --map-by ppr:1:core -mca btl self,sm,tcp bin/lu-mz.B.1
done

for i in {1..10}
do
	time mpirun -np 2 --map-by ppr:1:core -mca btl self,sm,tcp bin/lu-mz.B.2
done

for i in {1..10}
do
	time mpirun -np 4 --map-by ppr:1:core -mca btl self,sm,tcp bin/lu-mz.B.4
done

for i in {1..10}
do
	time mpirun -np 8 --map-by ppr:1:core -mca btl self,sm,tcp bin/lu-mz.B.8
done

for i in {1..10}
do
	time mpirun -np 16 --map-by ppr:1:core -mca btl self,sm,tcp bin/lu-mz.B.16
done

for i in {1..10}
do
	time mpirun -np 32 --map-by ppr:1:core -mca btl self,sm,tcp bin/lu-mz.B.32
done