#!/bin/sh
#
#PBS -N MPI-MZ_f77_641_MX
#PBS -l walltime=10:00:00
#PBS -l nodes=2:r641:ppn=32
#PBS -j oe 
cd ESC/TP1/NPB3.3-MZ-MPI

module load gnu/openmpi_mx/1.8.4
module load gcc/5.3.0
set -x

export OMP_NUM_THREADS=2

cp config/makeo0.def config/make.def
make bt-mz CLASS=W NPROCS=24
make bt-mz CLASS=A NPROCS=24
make bt-mz CLASS=B NPROCS=24
make bt-mz CLASS=C NPROCS=24
echo 'O0'
echo '------------Class W------------'

for i in {1..10}
do
    time mpirun -np 24 bin/bt-mz.W.24
done
echo '------------Class A------------'

for i in {1..10}
do
    time mpirun -np 24 bin/bt-mz.A.24
done
echo '------------Class B------------'

for i in {1..10}
do
    time mpirun -np 24 bin/bt-mz.B.24
done
echo '------------Class C------------'


time mpirun -np 24 bin/bt-mz.C.24


cp config/makeo1.def config/make.def
make bt-mz CLASS=W NPROCS=24
make bt-mz CLASS=A NPROCS=24
make bt-mz CLASS=B NPROCS=24
make bt-mz CLASS=C NPROCS=24
echo 'O1'
echo '------------Class W------------'

for i in {1..10}
do
    time mpirun -np 24 bin/bt-mz.W.24
done
echo '------------Class A------------'

for i in {1..10}
do
    time mpirun -np 24 bin/bt-mz.A.24
done
echo '------------Class B------------'

for i in {1..10}
do
    time mpirun -np 24 bin/bt-mz.B.24
done
echo '------------Class C------------'


time mpirun -np 24 bin/bt-mz.C.24


cp config/makeo2.def config/make.def
make bt-mz CLASS=W NPROCS=24
make bt-mz CLASS=A NPROCS=24
make bt-mz CLASS=B NPROCS=24
make bt-mz CLASS=C NPROCS=24
echo 'O2'
echo '------------Class W------------'

for i in {1..10}
do
    time mpirun -np 24 bin/bt-mz.W.24
done
echo '------------Class A------------'

for i in {1..10}
do
    time mpirun -np 24 bin/bt-mz.A.24
done
echo '------------Class B------------'

for i in {1..10}
do
    time mpirun -np 24 bin/bt-mz.B.24
done
echo '------------Class C------------'

time mpirun -np 24 bin/bt-mz.C.24


cp config/makeo3.def config/make.def
make bt-mz CLASS=W NPROCS=24
make bt-mz CLASS=A NPROCS=24
make bt-mz CLASS=B NPROCS=24
make bt-mz CLASS=C NPROCS=24
echo 'O3'
echo '------------Class W------------'

for i in {1..10}
do
    time mpirun -np 24 bin/bt-mz.W.24
done
echo '------------Class A------------'

for i in {1..10}
do
    time mpirun -np 24 bin/bt-mz.A.24
done
echo '------------Class B------------'

for i in {1..10}
do
    time mpirun -np 24 bin/bt-mz.B.24
done
echo '------------Class C------------'

time mpirun -np 24 bin/bt-mz.C.24
