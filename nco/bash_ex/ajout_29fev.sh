#!/bin/bash
for k in {0..0}
do

	### extrait toutes les valeurs sur la dimension donnée avec les indices fournis
	ncks -d time_counter,31,58 INVSAT_DM_200$k.nc -O INVSAT_DM_200$(($k))_m02.nc 
	
	### extrait toutes les valeurs sur la dimension donnée avec les indices fournis
	ncks -d time_counter,58,58 INVSAT_DM_200$k.nc -O 29fev_200$(($k))_m02.nc 
	
	### extrait toutes les valeurs sur la dimension donnée avec les indices fournis
	#ncrcat INVSAT_DM_200$(($k))_m02.nc  29fev_200$(($k))_m02.nc
	
	ncap2 -s 'time_counter_bounds=time_counter_bounds+86400' 29fev_2000_m02.nc out.nc
	
done
