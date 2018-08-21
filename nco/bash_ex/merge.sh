#!/bin/bash

rm -rf new*, day*, out*, copie_fichier*

for i in {1..9}
do
        echo $i
        ### extrait le scalaire en faisant une moyenne et supprime le temps
        ncwa -C -v presnivs,lat,lon,Cl,OH -d time_counter,$(($i-1)),$(($i-1)) -a time_counter INVSAT_MM_10Y.nc day$i.nc
        ### ajoute la nouvelle dimension temporelle
        ncks -A -v time_counter inca.an2011.m0$i.nc day$i.nc
        ### crée la nouvelle variable avec la nouvelle dimension temporelle 
        ncap2 -s 'Cl_new[$time_counter, $presnivs, $lat, $lon]=Cl;OH_new[$time_counter, $presnivs, $lat, $lon]=OH;' day$i.nc out$i.nc
        rm -rf day$i.nc
        ### supprime les variables moyennées et les remplace par celles avec une dimension temporelle
        ncks -C -O -x -v OH,Cl out$i.nc new$i.nc
        rm -rf out$i.nc
        ### renomme les variables
        ncrename -v OH_new,OH new$i.nc
        ncrename -v Cl_new,Cl new$i.nc
        ### supprime les variables OH et Cl du fichier Inca et copie les nouvelles variables
        ncks -C -O -x -v OH,Cl inca.an2011.m0$i.nc INVSAT_JT_m0$i.nc
        ncks -A -v OH,Cl new$i.nc INVSAT_JT_m0$i.nc
        rm -rf new$i.nc
        ### renomme l'attribut file_name
        ncatted -a file_name,global,m,c,'inca_avgr.nc' INVSAT_JT_m0$i.nc
done

for i in {10..12}
do
	echo $i
	### extrait le scalaire en faisant une moyenne et supprime le temps
	ncwa -C -v presnivs,lat,lon,Cl,OH -d time_counter,$(($i-1)),$(($i-1)) -a time_counter INVSAT_MM_10Y.nc day$i.nc
	### ajoute la nouvelle dimension temporelle
	ncks -A -v time_counter inca.an2011.m$i.nc day$i.nc 
	### crée la nouvelle variable avec la nouvelle dimension temporelle 
	ncap2 -s 'Cl_new[$time_counter, $presnivs, $lat, $lon]=Cl;OH_new[$time_counter, $presnivs, $lat, $lon]=OH;' day$i.nc out$i.nc
	rm -rf day$i.nc
	### supprime les variables moyennées et les remplace par celles avec une dimension temporelle
	ncks -C -O -x -v OH,Cl out$i.nc new$i.nc
	rm -rf out$i.nc
	### renomme les variables
	ncrename -v OH_new,OH new$i.nc
	ncrename -v Cl_new,Cl new$i.nc
	### supprime les variables OH et Cl du fichier Inca et copie les nouvelles variables
	ncks -C -O -x -v OH,Cl inca.an2011.m$i.nc INVSAT_JT_m$i.nc
	ncks -A -v OH,Cl new$i.nc INVSAT_JT_m$i.nc 
	rm -rf new$i.nc
	### renomme l'attribut file_name
	ncatted -a file_name,global,m,c,'inca_avgr.nc' INVSAT_JT_m$i.nc
done


