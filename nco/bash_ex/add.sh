#!/bin/bash

fref=fch4.oce.lambert.glo.fy2007.mask11.lmdz9696vector.nc

f1=fch4.biofuels_biomass.edgar_gfed.glo.2000_2017.mask11.lmdz9696vector.nc
f2=fch4.coal.edgar.glo.2000_2017.mask11.lmdz9696vector.nc
f3=fch4.livestock.edgar.glo.2000_2017.mask11.lmdz9696vector.nc
f4=fch4.oilgasind.edgar.glo.2000_2017.mask11.lmdz9696vector.nc
f5=fch4.waste.edgar.glo.2000_2017.mask11.lmdz9696vector.nc

f6=fch4.oce.lambert.glo.fy2007.mask11.lmdz9696vector.nc
f7=fch4.soil.ridgwell.glo.fy2007.mask11.lmdz9696vector.nc
f8=fch4.wetlands.poulter.glo.fy2007.mask11.lmdz9696vector.nc
f9=fch4.geological.fromPB.glo.fy2007.mask11.lmdz9696vector.nc

f10=fch4.termites.castaldi.glo.2007.mask11.lmdz9696vector.nc

i=0
m=$(($i*12))
n=$(($i*12 + 11))
ncks -d time,$m,$n -v flx_ch4 $f1 -O f1.nc
ncbo -y add termites_oneyear.nc f1.nc -O out_200$(($i)).nc
rm -f f1.nc

ncks -d time,$m,$n -v flx_ch4 $f2 -O f2.nc
ncbo -y add out_200$(($i)).nc f2.nc -O out_200$(($i)).nc
rm -f f2.nc

ncks -d time,$m,$n -v flx_ch4 $f3 -O f3.nc
ncbo -y add out_200$(($i)).nc f3.nc -O out_200$(($i)).nc
rm -f f3.nc

ncks -d time,$m,$n -v flx_ch4 $f4 -O f4.nc
ncbo -y add out_200$(($i)).nc f4.nc -O out_200$(($i)).nc
rm -f f4.nc

ncks -d time,$m,$n -v flx_ch4 $f5 -O f5.nc
ncbo -y add out_200$(($i)).nc f5.nc -O out_200$(($i)).nc
rm -f f5.nc

ncks -d time,0,11 -v flx_ch4 $f6 -O f6.nc
ncbo -y add out_200$(($i)).nc f6.nc -O out_200$(($i)).nc
rm -f f6.nc

ncks -d time,0,11 -v flx_ch4 $f7 -O f7.nc
ncbo -y add out_200$(($i)).nc f7.nc -O out_200$(($i)).nc
rm -f f7.nc

ncks -d time,0,11 -v flx_ch4 $f8 -O f8.nc
ncbo -y add out_200$(($i)).nc f8.nc -O out_200$(($i)).nc
rm -f f8.nc

ncks -d time,0,11 -v flx_ch4 $f9 -O f9.nc






