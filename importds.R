library('reader')

################################################################################
################################################################################
#########################MODIFY THE VARIABLES###################################
################################################################################
##write the path to your dataset ('path' variable)
##and the name of your dataset file .xlsx/.xls/.csv ('dataset.name' variable)
path <- 'path_name'
dataset.name <- 'file_name'

##write the type of the data file long, wide, sheet, cross-sectional as
##'l','w','sh','cs'
typedf <- 'insert_type'  

##number of factors (except subject and time for longitudinal datasets only)
nfact <- NULL

##number of sheets (if any, for longitudinal datasets only)
nsheet <- NULL

##if 'l' columns should have subject,time,factors,time-factors
##if 'w' columns should have subject, factors, time-factors
##if 'sh' columns should have subject, time, factors, time-factors
##if 'cs' columns should be subject, factors

################################################################################
#########################DO NOT MODIFY FROM HERE ON!!!##########################
################################################################################
##get the extension of your file
ext <- get.ext(dataset.name)

source('readtables.R')

if (ext=='xlsx' | ext=='xls'){
  database <- readdb.xlsx(path, dataset.name, typedf, nfact, nsheet)
  if(typedf!='cs'){
  database.long <- database[[1]]
  database.wide <- database[[2]]}
}
if(ext=='csv'){
  database <- readdb.csv(path, dataset.name, typedf, nfact, nsheet)
  if(typedf!='cs'){
    database.long <- database[[1]]
    database.wide <- database[[2]]}
}


if(typedf!='cs'){
  save(file=file.path(path,'database.long.RData'),database.long)
  save(file=file.path(path,'database.wide.RData'),database.wide)
} else { save(file=file.path(path,'database.RData'),database)}



























