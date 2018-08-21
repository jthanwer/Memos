#!/bin/bash
for k in {0..10}
do

	### extrait toutes les valeurs sur la dimension donnée avec les indices fournis
	ncks -d time_counter,0,30 INVSAT_DM_200$k.nc -O INVSAT_DM_200$(($k))_m01.nc 

	### extrait toutes les valeurs sur la dimension donnée avec les indices fournis
	ncks -d time_counter,31,58 INVSAT_DM_200$k.nc -O INVSAT_DM_200$(($k))_m02.nc 

	j=59
	for i in {3..7}
	do
	echo $k
	echo $i
	echo $j
		if [ $(($i % 2)) == 1 ]
		then
		   ### extrait toutes les valeurs sur la dimension donnée avec les indices fournis
			ncks -d time_counter,$j,$(($j+30)) INVSAT_DM_200$k.nc -O INVSAT_DM_200$(($k))_m0$i.nc
			j=$(($j+31))
		else
		   ### extrait toutes les valeurs sur la dimension donnée avec les indices fournis
			ncks -d time_counter,$j,$(($j+29)) INVSAT_DM_200$k.nc -O INVSAT_DM_200$(($k))_m0$i.nc
			j=$(($j+30))
		fi	 
	done


	for i in {8..9}
	do

		if [ $(($i % 2)) == 0 ]
		then
			### extrait toutes les valeurs sur la dimension donnée avec les indices fournis
			ncks -d time_counter,$j,$(($j+30)) INVSAT_DM_200$k.nc -O INVSAT_DM_200$(($k))_m0$i.nc
			j=$(($j+31))
		else
		   ### extrait toutes les valeurs sur la dimension donnée avec les indices fournis
			ncks -d time_counter,$j,$(($j+29)) INVSAT_DM_200$k.nc -O INVSAT_DM_200$(($k))_m0$i.nc
			j=$(($j+30))
		fi	 
	done


	for i in {10..12}
	do

		if [ $(($i % 2)) == 0 ]
		then
			### extrait toutes les valeurs sur la dimension donnée avec les indices fournis
		   ncks -d time_counter,$j,$(($j+30)) INVSAT_DM_200$k.nc -O INVSAT_DM_200$(($k))_m$i.nc
			j=$(($j+31))
		else
     		### extrait toutes les valeurs sur la dimension donnée avec les indices fournis
			ncks -d time_counter,$j,$(($j+29)) INVSAT_DM_200$k.nc -O INVSAT_DM_200$(($k))_m$i.nc
			j=$(($j+30))
		fi	 
	done
	
done
