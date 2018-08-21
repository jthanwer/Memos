# multiplie le premier 85.nc par 3 et le deuxième 85.nc par -2 puis les ajoute.
ncflint -w 3,-2 85.nc 85.nc tst.nc

#http://nco.sourceforge.net/nco.html#xmp_ncflint
#ncflint -w 0.8,0.0 extsw.nc extsw.nc tst.nc 
#ncks -A -v time  extsw.nc tst.nc 
