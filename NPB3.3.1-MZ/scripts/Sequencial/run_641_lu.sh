#!/bin/sh
#
#PBS -N SERIAL-MZ
#PBS -l walltime=10:00:00
#PBS -l nodes=1:r641:ppn=32
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
    time bin/lu-mz.W.x
done
echo '------------Class A------------'

for i in {1..10}
do
    time bin/lu-mz.A.x
done
echo '------------Class B------------'

for i in {1..10}
do
    time bin/lu-mz.B.x
done
echo '------------Class C------------'


time bin/lu-mz.C.x


cp config/makeo1.def config/make.def
make lu-mz CLASS=W
make lu-mz CLASS=A
make lu-mz CLASS=B
make lu-mz CLASS=C
echo 'O1'
echo '------------Class W------------'

for i in {1..10}
do
    time bin/lu-mz.W.x
done
echo '------------Class A------------'

for i in {1..10}
do
    time bin/lu-mz.A.x
done
echo '------------Class B------------'

for i in {1..10}
do
    time bin/lu-mz.B.x
done
echo '------------Class C------------'


time bin/lu-mz.C.x


cp config/makeo2.def config/make.def
make lu-mz CLASS=W
make lu-mz CLASS=A
make lu-mz CLASS=B
make lu-mz CLASS=C
echo 'O2'
echo '------------Class W------------'

for i in {1..10}
do
    time bin/lu-mz.W.x
done
echo '------------Class A------------'

for i in {1..10}
do
    time bin/lu-mz.A.x
done
echo '------------Class B------------'

for i in {1..10}
do
    time bin/lu-mz.B.x
done
echo '------------Class C------------'

time bin/lu-mz.C.x


cp config/makeo3.def config/make.def
make lu-mz CLASS=W
make lu-mz CLASS=A
make lu-mz CLASS=B
make lu-mz CLASS=C
echo 'O3'
echo '------------Class W------------'

for i in {1..10}
do
    time bin/lu-mz.W.x
done
echo '------------Class A------------'

for i in {1..10}
do
    time bin/lu-mz.A.x
done
echo '------------Class B------------'

for i in {1..10}
do
    time bin/lu-mz.B.x
done
echo '------------Class C------------'

time bin/lu-mz.C.x
