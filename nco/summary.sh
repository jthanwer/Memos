############
### NCKS ###
############

Pour extraire des variables ou des dimensions

# Extrait toutes les variables en découpant sur la dimension donnée
ncks -d [dimension],[index_debut],[index_fin (pris en compte)] [file_input] -O [file_output]
# Extrait les variables sélectionnées
ncks -v [var1],[var2] [file_input] -O [file_output]
# Extrait toutes les variables sauf celles sélectionnées
ncks -C -x -v [var1],[var2] [file_input] -O [file_output]
# Ajoute la dimension prise d'un autre fichier
ncks -A -v [dimension] [file_from_where_the_dimension_comes] [file_where_the_dimension_is_put] 
# Transformer une dimension fixed en dimension record
ncks -O --mk_rec_dmn [dimension] [file_input] -O [file_output]


############
### NCWA ###
############

Pour faire une moyenne

# Fait une moyenne sur la dimension donnée
ncwa -C -v [var1],[var2] -d [dimension],[index_debut],[index_fin (pris en compte)] -a [dimension] [file_input] -O [file_output]


##############
### NCECAT ###
##############

# Transforme la dimension en dimension record
ncecat -u [dimension] [file_input] -O [file_output]


##############
### NCRCAT ###
##############

Concatène

# Concatène plusieurs fichiers
ncrcat [file1] [file2] [file3] -O [file_output]

################
### NCRENAME ###
################

Renomme

# Renomme les variables sélectionnées
ncrename -v [var1],[var2] [file_input]

#############
### NCAP2 ###
#############

### crée la nouvelle variable avec la nouvelle dimension
ncap2 -s 'var_new[$NEW_DIMENSION, $vector]=var;' [file_input] -O [file_output]
