#!/bin/sh
#
#PBS -N MPI-MZ_f77_641_64_MX
#PBS -l walltime=5:00:00
#PBS -l nodes=2:r641:ppn=32
#PBS -j oe 
cd ESC/TP1/NPB3.3-MZ-MPI

module load gnu/openmpi_mx/1.8.4
module load gcc/5.3.0
set -x

export OMP_NUM_THREADS=2

cp config/makeo0.def config/make.def
make bt-mz CLASS=B NPROCS=32
make bt-mz CLASS=C NPROCS=32
echo 'O0'
echo '------------Class B------------'

for i in {1..10}
do
    time mpirun -np 32 --map-by ppr:1:core -mca btl self,sm,tcp bin/bt-mz.B.32
done
echo '------------Class C------------'


time mpirun -np 32 --map-by ppr:1:core -mca btl self,sm,tcp bin/bt-mz.C.32


cp config/makeo1.def config/make.def
make bt-mz CLASS=B NPROCS=32
make bt-mz CLASS=C NPROCS=32
echo 'O1'
echo '------------Class B------------'

for i in {1..10}
do
    time mpirun -np 32 --map-by ppr:1:core -mca btl self,sm,tcp bin/bt-mz.B.32
done
echo '------------Class C------------'


time mpirun -np 32 --map-by ppr:1:core -mca btl self,sm,tcp bin/bt-mz.C.32


cp config/makeo2.def config/make.def
make bt-mz CLASS=B NPROCS=32
make bt-mz CLASS=C NPROCS=32
echo 'O2'
echo '------------Class B------------'

for i in {1..10}
do
    time mpirun -np 32 --map-by ppr:1:core -mca btl self,sm,tcp bin/bt-mz.B.32
done
echo '------------Class C------------'

time mpirun -np 32 --map-by ppr:1:core -mca btl self,sm,tcp bin/bt-mz.C.32


cp config/makeo3.def config/make.def
make bt-mz CLASS=B NPROCS=32
make bt-mz CLASS=C NPROCS=32
echo 'O3'
echo '------------Class B------------'

for i in {1..10}
do
    time mpirun -np 32 --map-by ppr:1:core -mca btl self,sm,tcp bin/bt-mz.B.32
done
echo '------------Class C------------'

time mpirun -np 32 --map-by ppr:1:core -mca btl self,sm,tcp bin/bt-mz.C.32
