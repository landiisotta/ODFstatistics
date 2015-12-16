library('reader')

################################################################################
################################################################################
#########################MODIFY THE VARIABLES###################################
################################################################################
##write the path to your dataset ('path' variable)
##and the name of your dataset file .xlsx/.xls/.csv ('dataset.name' variable)
path <- 'path_name'
dataset.name <- 'file_name'

##write the type of the data file long, wide, sheet as 'l','w','sh'
typedf <- 'l'  

##number of factors (except subject and time)
nfact <- NULL

##number of sheets (if any)
nsheet <- NULL

##if 'l' columns should have subject,time,factors,time-factors
##if 'w' columns should have subject, factors, time-factors
##if 'sh' columns should have subject, time, factors, time-factors

################################################################################
#########################DO NOT MODIFY FROM HERE ON!!!##########################
################################################################################
##get the extension of your file
ext <- get.ext(dataset.name)

source('readtables.R')

if (ext=='xlsx' | ext=='xls'){
  database <- readdb.xlsx(path, dataset.name, typedf, nfact, nsheet)
  database.long <- database[[1]]
  database.wide <- database[[2]]
} else{ database <- readdb.csv(path, dataset.name, typedf, nfact, nsheet)
        database.long <- database[[1]]
        database.wide <- database[[2]]
      }





























