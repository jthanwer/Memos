#!/bin/bash

for i in {1..9}
do
	echo $i
	# Average over the dimension Time
	ncwa -a Time ./2017-0$(($i))-01_00-00/trajq.nc -O m0$(($i)).nc
	# Transforme la dimension Time en vraie dimension record
	ncecat -u Time m0$(($i)).nc -O m0$(($i)).nc
done

for i in {10..12}
do
	echo $i
	# Average over the dimension Time
	ncwa -a Time ./2017-$(($i))-01_00-00/trajq.nc -O m$(($i)).nc
	ncecat -u Time m$(($i)).nc -O m$(($i)).nc
done


ncrcat m01.nc m02.nc m03.nc m04.nc m05.nc m06.nc m07.nc m08.nc m09.nc m10.nc m11.nc m12.nc -O out.nc



