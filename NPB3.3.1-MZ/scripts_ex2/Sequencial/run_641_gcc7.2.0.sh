#!/bin/sh
#
#PBS -N SERIAL-MZ_f77_641_gcc7
#PBS -l walltime=10:00:00
#PBS -l nodes=1:r641:ppn=32
#PBS -j oe 
cd $HOME/ESC/TP1/NPB3.3-MZ-SER
commands_output_dir=../scripts_ex2/Sequencial/commands_output
mkdir -p $commands_output_dir

module load gnu/openmpi_eth/1.8.4
module load gcc/7.2.0
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
    bin/bt-mz.W.x &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_641_gcc7.2.0_00_class_W $i
done
echo '------------Class A------------'

for i in {1..10}
do
    bin/bt-mz.A.x &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_641_gcc7.2.0_00_class_A $i
done
echo '------------Class B------------'

for i in {1..10}
do
    bin/bt-mz.B.x &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_641_gcc7.2.0_00_class_B $i
done
echo '------------Class C------------'


bin/bt-mz.C.x &
source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_641_gcc7.2.0_00_class_C $i


cp config/makeo1.def config/make.def
make bt-mz CLASS=W
make bt-mz CLASS=A
make bt-mz CLASS=B
make bt-mz CLASS=C
echo 'O1'
echo '------------Class W------------'

for i in {1..10}
do
    bin/bt-mz.W.x &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_641_gcc7.2.0_01_class_W $i
done
echo '------------Class A------------'

for i in {1..10}
do
    bin/bt-mz.A.x &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_641_gcc7.2.0_01_class_A $i
done
echo '------------Class B------------'

for i in {1..10}
do
    bin/bt-mz.B.x &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_641_gcc7.2.0_01_class_B $i
done
echo '------------Class C------------'


bin/bt-mz.C.x &
source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_641_gcc7.2.0_01_class_C $i


cp config/makeo2.def config/make.def
make bt-mz CLASS=W
make bt-mz CLASS=A
make bt-mz CLASS=B
make bt-mz CLASS=C
echo 'O2'
echo '------------Class W------------'

for i in {1..10}
do
    bin/bt-mz.W.x &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_641_gcc7.2.0_02_class_W $i
done
echo '------------Class A------------'

for i in {1..10}
do
    bin/bt-mz.A.x &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_641_gcc7.2.0_02_class_A $i
done
echo '------------Class B------------'

for i in {1..10}
do
    bin/bt-mz.B.x &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_641_gcc7.2.0_02_class_B $i
done
echo '------------Class C------------'

bin/bt-mz.C.x &
source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_641_gcc7.2.0_02_class_C $i


cp config/makeo3.def config/make.def
make bt-mz CLASS=W
make bt-mz CLASS=A
make bt-mz CLASS=B
make bt-mz CLASS=C
echo 'O3'
echo '------------Class W------------'

for i in {1..10}
do
    bin/bt-mz.W.x &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_641_gcc7.2.0_03_class_W $i
done
echo '------------Class A------------'

for i in {1..10}
do
    bin/bt-mz.A.x &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_641_gcc7.2.0_03_class_A $i
done
echo '------------Class B------------'

for i in {1..10}
do
    bin/bt-mz.B.x &
    source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_641_gcc7.2.0_03_class_B $i
done
echo '------------Class C------------'

bin/bt-mz.C.x &
source ../scripts_ex2/Sequencial/commands.sh $commands_output_dir/run_641_gcc7.2.0_03_class_C $i
