#!/bin/sh
#
#PBS -N SERIAL-MZ
#PBS -l walltime=10:00:00
#PBS -l nodes=1:r641:ppn=32
#PBS -j oe 
cd ESC/TP1/NPB3.3-MZ-SER

module load intel/2019
set -x


cp config/makeo0.def_ifort config/make.def
make sp-mz CLASS=W
make sp-mz CLASS=A
make sp-mz CLASS=B
make sp-mz CLASS=C
echo 'O0'
echo '------------Class W------------'

for i in {1..10}
do
    time bin/sp-mz.W.x
done
echo '------------Class A------------'

for i in {1..10}
do
    time bin/sp-mz.A.x
done
echo '------------Class B------------'

for i in {1..10}
do
    time bin/sp-mz.B.x
done
echo '------------Class C------------'


time bin/sp-mz.C.x


cp config/makeo1.def_ifort config/make.def
make sp-mz CLASS=W
make sp-mz CLASS=A
make sp-mz CLASS=B
make sp-mz CLASS=C
echo 'O1'
echo '------------Class W------------'

for i in {1..10}
do
    time bin/sp-mz.W.x
done
echo '------------Class A------------'

for i in {1..10}
do
    time bin/sp-mz.A.x
done
echo '------------Class B------------'

for i in {1..10}
do
    time bin/sp-mz.B.x
done
echo '------------Class C------------'


time bin/sp-mz.C.x


cp config/makeo2.def_ifort config/make.def
make sp-mz CLASS=W
make sp-mz CLASS=A
make sp-mz CLASS=B
make sp-mz CLASS=C
echo 'O2'
echo '------------Class W------------'

for i in {1..10}
do
    time bin/sp-mz.W.x
done
echo '------------Class A------------'

for i in {1..10}
do
    time bin/sp-mz.A.x
done
echo '------------Class B------------'

for i in {1..10}
do
    time bin/sp-mz.B.x
done
echo '------------Class C------------'

time bin/sp-mz.C.x


cp config/makeo3.def_ifort config/make.def
make sp-mz CLASS=W
make sp-mz CLASS=A
make sp-mz CLASS=B
make sp-mz CLASS=C
echo 'O3'
echo '------------Class W------------'

for i in {1..10}
do
    time bin/sp-mz.W.x
done
echo '------------Class A------------'

for i in {1..10}
do
    time bin/sp-mz.A.x
done
echo '------------Class B------------'

for i in {1..10}
do
    time bin/sp-mz.B.x
done
echo '------------Class C------------'

time bin/sp-mz.C.x
