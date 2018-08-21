#!/bin/bash

ncwa -a time_counter /home/inversion/yyin/CHEMFILES/INCA/inca.an2006.m01.nc base.nc
ncecat -u time_counter base.nc -O base.nc

for i in {06..06}; do
echo $i
for k in {01..12}; do
	echo $k
	### extrait le scalaire en faisant une moyenne et supprime le temps
	ncwa -a time_counter /home/inversion/yyin/CHEMFILES/INCA/inca.an20$(($i)).m$(($k)).nc -O out.nc
	ncecat -u time_counter out.nc -O out.nc
	ncrcat base.nc out.nc -O base.nc
done
done


