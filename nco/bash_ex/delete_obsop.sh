#!/bin/bash

dir=`pwd`
echo $dir
shopt -s extglob

for k in {12..17} ; do

for i in {1..9} ; do

cd ./obsoperator/fwd_0000/20$(($k))-0$(($i))-01_00-00/
rm !(trajq.nc)
cd $dir

done

for i in {10..12} ; do

cd ./obsoperator/fwd_0000/20$(($k))-$(($i))-01_00-00/
rm !(trajq.nc)
cd $dir

done

done

