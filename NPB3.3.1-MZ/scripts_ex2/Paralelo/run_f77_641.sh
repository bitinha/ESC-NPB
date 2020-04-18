#!/bin/sh
#
#PBS -N MPI-MZ_f77_641
#PBS -l walltime=10:00:00
#PBS -l nodes=2:r641:ppn=32
#PBS -j oe 
cd $HOME/ESC/TP1/NPB3.3-MZ-MPI
commands_output_dir=../scripts_ex2/Paralelo/commands_output
mkdir -p $commands_output_dir

module load gnu/openmpi_eth/1.8.4
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
    mpirun -np 24 bin/bt-mz.W.24 &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_f77_641_00_class_W $i
done
echo '------------Class A------------'

for i in {1..10}
do
    mpirun -np 24 bin/bt-mz.A.24 &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_f77_641_00_class_A $i
done
echo '------------Class B------------'

for i in {1..10}
do
    mpirun -np 24 bin/bt-mz.B.24 &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_f77_641_00_class_B $i
done
echo '------------Class C------------'


mpirun -np 24 bin/bt-mz.C.24 &
source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_f77_641_00_class_C $i


cp config/makeo1.def config/make.def
make bt-mz CLASS=W NPROCS=24
make bt-mz CLASS=A NPROCS=24
make bt-mz CLASS=B NPROCS=24
make bt-mz CLASS=C NPROCS=24
echo 'O1'
echo '------------Class W------------'

for i in {1..10}
do
    mpirun -np 24 bin/bt-mz.W.24 &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_f77_641_01_class_W $i
done
echo '------------Class A------------'

for i in {1..10}
do
    mpirun -np 24 bin/bt-mz.A.24 &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_f77_641_01_class_A $i
done
echo '------------Class B------------'

for i in {1..10}
do
    mpirun -np 24 bin/bt-mz.B.24 &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_f77_641_01_class_B $i
done
echo '------------Class C------------'


mpirun -np 24 bin/bt-mz.C.24 &
source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_f77_641_01_class_C $i


cp config/makeo2.def config/make.def
make bt-mz CLASS=W NPROCS=24
make bt-mz CLASS=A NPROCS=24
make bt-mz CLASS=B NPROCS=24
make bt-mz CLASS=C NPROCS=24
echo 'O2'
echo '------------Class W------------'

for i in {1..10}
do
    mpirun -np 24 bin/bt-mz.W.24 &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_f77_641_02_class_W $i
done
echo '------------Class A------------'

for i in {1..10}
do
    mpirun -np 24 bin/bt-mz.A.24 &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_f77_641_02_class_A $i
done
echo '------------Class B------------'

for i in {1..10}
do
    mpirun -np 24 bin/bt-mz.B.24 &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_f77_641_02_class_B $i
done
echo '------------Class C------------'

mpirun -np 24 bin/bt-mz.C.24 &
source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_f77_641_02_class_C $i


cp config/makeo3.def config/make.def
make bt-mz CLASS=W NPROCS=24
make bt-mz CLASS=A NPROCS=24
make bt-mz CLASS=B NPROCS=24
make bt-mz CLASS=C NPROCS=24
echo 'O3'
echo '------------Class W------------'

for i in {1..10}
do
    mpirun -np 24 bin/bt-mz.W.24 &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_f77_641_03_class_W $i
done
echo '------------Class A------------'

for i in {1..10}
do
    mpirun -np 24 bin/bt-mz.A.24 &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_f77_641_03_class_A $i
done
echo '------------Class B------------'

for i in {1..10}
do
    mpirun -np 24 bin/bt-mz.B.24 &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_f77_641_03_class_B $i
done
echo '------------Class C------------'

mpirun -np 24 bin/bt-mz.C.24 &
source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_f77_641_03_class_C $i
