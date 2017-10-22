####################################################################################
####### Object:  Analyse BFAST      
####### Author:  yelena.finegold@fao.org & remi.dannunzio@fao.org                               
####### Update:  2017/10/22                                    
###################################################################################

####### Materiel adapte de thttps://github.com/rosca002/FAO_Bfast_workshop/tree/master/tutorial

###################################################################################
#### Parametres d'environnement
###################################################################################

#### Repertoire racine
#rootdir <- "/media/dannunzio/OSDisk/Users/dannunzio/Documents/countries/cote_ivoire/trainings_cote_ivoire/training_alertes_oct2017/"
rootdir <- "~/rci_ws_20171022/"

#### Repertoire des donnees d'entree
data_dir <- paste0(rootdir,"data/")
dir.create(data_dir)

####################################################################################################################
####### Les donnees d'entree proviennent de GEE et sont composees de tous les indices NDVI et NDMI sur la periode
####### NDMI / NDVI export https://code.earthengine.google.com/197d0ead4a094c8ada0a069485419677
####################################################################################################################
setwd(data_dir)
system(sprintf("echo 4/SGn-wOSw1u0Pt2kW3Sctd_4nyrYX0ZMsn2YcJWvYejc | gdrive download 0B48Ol_Tb6ewSX1RVcEZCRm9lWGM --force"))
setwd(rootdir)

#### Repertoire des resultats
results_directory <- paste0(rootdir,"results/")
dir.create(results_directory)

#### Stack des donnees NDMI  
NDMIstack <- paste0(data_dir,'All_NDMI_rci.tif') # tile3
#### Liste des identifiant correspondant 
NDMIsceneID <- paste0(data_dir,'tableID_NDMI_rci.csv')

#### Stack des donnees NDVI 
NDVIstack <- paste0(data_dir,'All_NDVI_rci.tif')
#### Liste des identifiant correspondant 
NDVIsceneID <- paste0(data_dir,'tableID_NDVI_rci.csv')

#### Annee de demarrage de la periode historique
historical_year_beg <- 2007

#### Annee de demarrage de la periode de monitoring
monitoring_year_beg <- 2013

#### Annee de fin de la periode de monitoring
monitoring_year_end <- 2017

###################################################################################
#### Execution des scripts de process
###################################################################################

#### Standardisation des donnees d'entree
source("Rscripts/input_data.R",echo = T)

#### Execution BFAST avec les parametres "all"
source("Rscripts/example_1.R",echo = T)

#### Execution BFAST avec les parametres "ROC"
source("Rscripts/example_2.R",echo = T)

#### Execution BFAST avec les parametres "2007 --->"
source("Rscripts/example_3.R",echo = T)

#### Comparaison des donnees de reference
#### source("Rscripts/reference_data.R")

#### Classification des magnitudes de changement
source("Rscripts/magnitude_threshold.R")
