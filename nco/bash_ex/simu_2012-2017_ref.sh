#!/bin/bash
for k in {17..17} ; do
for i in {10..10} ; do
dir="./obsoperator/fwd_0000/"
year="20$k"
month="-$i"
befend="-01_00-00/trajq"
end=".nc"
echo $dir$year$month$befend$end
echo $year$month$end

# Average over Time dimension to obtain one value per month
ncwa -a Time $dir$year$month$befend$end -O $year$month$end
# Transform Time dimension into record dimension
ncecat -u Time $year$month$end -O $year$month$end

done

# concatenate month files
ncrcat 20$(($k))-01.nc 20$(($k))-02.nc 20$(($k))-03.nc 20$(($k))-04.nc 20$(($k))-05.nc 20$(($k))-06.nc 20$(($k))-07.nc 20$(($k))-08.nc 20$(($k))-09.nc 20$(($k))-10.nc 20$(($k))-11.nc 20$(($k))-12.nc -O 20$(($k))_ref.nc


done

ncrcat 2012_ref.nc 2013_ref.nc 2014_ref.nc 2015_ref.nc 2016_ref.nc 2017_ref.nc -O 2012-2017_ref.nc

for k in {12..17} ; do
for i in {01..12} ; do
year="20$k"
month="-$i"
end=".nc"
echo $year$month$end
rm -f $year$month$end
done
done


