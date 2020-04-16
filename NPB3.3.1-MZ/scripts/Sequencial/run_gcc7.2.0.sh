#!/bin/sh
#
#PBS -N SERIAL-MZ_f77_662_gcc7
#PBS -l walltime=10:00:00
#PBS -l nodes=1:r662:ppn=48
#PBS -j oe 
cd ESC/TP1/NPB3.3-MZ-SER

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
    time bin/bt-mz.W.x
done
echo '------------Class A------------'

for i in {1..10}
do
    time bin/bt-mz.A.x
done
echo '------------Class B------------'

for i in {1..10}
do
    time bin/bt-mz.B.x
done
echo '------------Class C------------'


time bin/bt-mz.C.x


cp config/makeo1.def config/make.def
make bt-mz CLASS=W
make bt-mz CLASS=A
make bt-mz CLASS=B
make bt-mz CLASS=C
echo 'O1'
echo '------------Class W------------'

for i in {1..10}
do
    time bin/bt-mz.W.x
done
echo '------------Class A------------'

for i in {1..10}
do
    time bin/bt-mz.A.x
done
echo '------------Class B------------'

for i in {1..10}
do
    time bin/bt-mz.B.x
done
echo '------------Class C------------'


time bin/bt-mz.C.x


cp config/makeo2.def config/make.def
make bt-mz CLASS=W
make bt-mz CLASS=A
make bt-mz CLASS=B
make bt-mz CLASS=C
echo 'O2'
echo '------------Class W------------'

for i in {1..10}
do
    time bin/bt-mz.W.x
done
echo '------------Class A------------'

for i in {1..10}
do
    time bin/bt-mz.A.x
done
echo '------------Class B------------'

for i in {1..10}
do
    time bin/bt-mz.B.x
done
echo '------------Class C------------'

time bin/bt-mz.C.x


cp config/makeo3.def config/make.def
make bt-mz CLASS=W
make bt-mz CLASS=A
make bt-mz CLASS=B
make bt-mz CLASS=C
echo 'O3'
echo '------------Class W------------'

for i in {1..10}
do
    time bin/bt-mz.W.x
done
echo '------------Class A------------'

for i in {1..10}
do
    time bin/bt-mz.A.x
done
echo '------------Class B------------'

for i in {1..10}
do
    time bin/bt-mz.B.x
done
echo '------------Class C------------'

time bin/bt-mz.C.x
