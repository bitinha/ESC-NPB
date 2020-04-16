#!/bin/sh
#
#PBS -N MPI-MZ_f77_641_128_MX
#PBS -l walltime=5:00:00
#PBS -l nodes=4:r641:ppn=32
#PBS -j oe 
cd ESC/TP1/NPB3.3-MZ-MPI

module load gnu/openmpi_mx/1.8.4
module load gcc/5.3.0
set -x

export OMP_NUM_THREADS=2

cp config/makeo0.def config/make.def
make bt-mz CLASS=W NPROCS=64
make bt-mz CLASS=A NPROCS=64
make bt-mz CLASS=B NPROCS=64
make bt-mz CLASS=C NPROCS=64
echo 'O0'
echo '------------Class W------------'

for i in {1..10}
do
    time mpirun -np 64 --map-by ppr:1:core -mca btl self,sm bin/bt-mz.W.64
done
echo '------------Class A------------'

for i in {1..10}
do
    time mpirun -np 64 --map-by ppr:1:core -mca btl self,sm bin/bt-mz.A.64
done
echo '------------Class B------------'

for i in {1..10}
do
    time mpirun -np 64 --map-by ppr:1:core -mca btl self,sm bin/bt-mz.B.64
done
echo '------------Class C------------'


time mpirun -np 64 --map-by ppr:1:core -mca btl self,sm bin/bt-mz.C.64


cp config/makeo1.def config/make.def
make bt-mz CLASS=W NPROCS=64
make bt-mz CLASS=A NPROCS=64
make bt-mz CLASS=B NPROCS=64
make bt-mz CLASS=C NPROCS=64
echo 'O1'
echo '------------Class W------------'

for i in {1..10}
do
    time mpirun -np 64 --map-by ppr:1:core -mca btl self,sm bin/bt-mz.W.64
done
echo '------------Class A------------'

for i in {1..10}
do
    time mpirun -np 64 --map-by ppr:1:core -mca btl self,sm bin/bt-mz.A.64
done
echo '------------Class B------------'

for i in {1..10}
do
    time mpirun -np 64 --map-by ppr:1:core -mca btl self,sm bin/bt-mz.B.64
done
echo '------------Class C------------'


time mpirun -np 64 --map-by ppr:1:core -mca btl self,sm bin/bt-mz.C.64


cp config/makeo2.def config/make.def
make bt-mz CLASS=W NPROCS=64
make bt-mz CLASS=A NPROCS=64
make bt-mz CLASS=B NPROCS=64
make bt-mz CLASS=C NPROCS=64
echo 'O2'
echo '------------Class W------------'

for i in {1..10}
do
    time mpirun -np 64 --map-by ppr:1:core -mca btl self,sm bin/bt-mz.W.64
done
echo '------------Class A------------'

for i in {1..10}
do
    time mpirun -np 64 --map-by ppr:1:core -mca btl self,sm bin/bt-mz.A.64
done
echo '------------Class B------------'

for i in {1..10}
do
    time mpirun -np 64 --map-by ppr:1:core -mca btl self,sm bin/bt-mz.B.64
done
echo '------------Class C------------'

time mpirun -np 64 --map-by ppr:1:core -mca btl self,sm bin/bt-mz.C.64


cp config/makeo3.def config/make.def
make bt-mz CLASS=W NPROCS=64
make bt-mz CLASS=A NPROCS=64
make bt-mz CLASS=B NPROCS=64
make bt-mz CLASS=C NPROCS=64
echo 'O3'
echo '------------Class W------------'

for i in {1..10}
do
    time mpirun -np 64 --map-by ppr:1:core -mca btl self,sm bin/bt-mz.W.64
done
echo '------------Class A------------'

for i in {1..10}
do
    time mpirun -np 64 --map-by ppr:1:core -mca btl self,sm bin/bt-mz.A.64
done
echo '------------Class B------------'

for i in {1..10}
do
    time mpirun -np 64 --map-by ppr:1:core -mca btl self,sm bin/bt-mz.B.64
done
echo '------------Class C------------'

time mpirun -np 64 --map-by ppr:1:core -mca btl self,sm bin/bt-mz.C.64
