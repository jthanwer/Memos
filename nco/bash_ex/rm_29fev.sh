#!/bin/bash
for k in {9..9}
do

	### extrait toutes les valeurs sur la dimension donnée avec les indices fournis
	ncks -d time_counter,31,58 INVSAT_DM_200$k.nc -O INVSAT_DM_200$(($k))_m02.nc 
		
done
