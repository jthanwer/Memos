#!/bin/bash

for k in {10..16}
do
	### extrait O1D et OH en VMR et les renomme
	ncks -v O1DVMR,OHVMR PoleAsia_OXY_DM_20$k.nc -O PoleAsia_OXY2_DM_20$k.nc 
	ncrename -v O1DVMR,O1D PoleAsia_OXY2_DM_20$k.nc
	ncrename -v OHVMR,OH PoleAsia_OXY2_DM_20$k.nc 
done


