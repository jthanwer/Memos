#!/bin/bash

fref=fch4.oce.lambert.glo.fy2007.mask11.lmdz9696vector.nc
f=fch4.termites.castaldi.glo.2007.mask11.lmdz9696vector.nc

### supprime la dimension temporelle
ncwa -C -v vector,flx_ch4 -a time $f day.nc
### ajoute la nouvelle dimension temporelle
ncks -A -v time $fref day.nc
### crée la nouvelle variable avec la nouvelle dimension temporelle 
ncap2 -s 'flx_ch4_new[$time, $vector]=flx_ch4;' day.nc out.nc
rm -rf day.nc
### extrait toutes les variables sauf l'ancienne
ncks -C -O -x -v flx_ch4 out.nc termites_oneyear.nc
rm -rf out.nc
### renomme la nouvelle variable
ncrename -v flx_ch4_new,flx_ch4 termites_oneyear.nc

