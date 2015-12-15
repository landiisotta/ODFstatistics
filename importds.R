################################################################################
################################################################################
##write the path to your dataset and the name of your dataset file .xlsx
path <- '~/Desktop/'
dataset.name <- 'sheet.xlsx'

##write the type of the data file long, wide, sheet as 'l','w','sh'
typedf <- 'sh' 

##number of factors (except subject and time)
nfact <- 1

##number of sheets (if any)
nsheet <- 2

##if 'l' or 'w' columns should have subject,time,factors,time-factors

################################################################################
#########################DO NOT MODIFY FROM HERE ON!!!##########################
################################################################################
library('openxlsx')
library('reshape2')

data.path <- file.path(path)

if(typedf=='sh'){
  dataframe <- data.frame()
  time <- vector(mode='numeric')
  for(i in 1:nsheet){
    assign(paste('dataframe',i,sep=''),
           read.xlsx(file.path(data.path,dataset.name),
                                                      colNames=TRUE, sheet=i))
    dataframe <- rbind(dataframe,get(paste('dataframe',i,sep='')))
  }
  typedf <- 'l'
} else {
  dataframe <- read.xlsx(file.path(data.path,dataset.name), colNames=TRUE)
}
if (typedf=='w'){
  dataframe.wide <- dataframe
  idx <- grep('[.][1-9]', names(dataframe.wide))
  dataframe.long <- reshape(dataframe.wide,
                            varying=names(dataframe.wide)[idx],
                            direction='long',
                            idvar=names(dataframe.wide)[1])
} else { if(typedf=='l'){
  dataframe.long <- dataframe
  dataframe.wide <- reshape(dataframe.long,
                            v.names=names(dataframe.long)[-c(1:(nfact+2))],
                            timevar=names(dataframe.long)[2],
                            idvar=names(dataframe.long)[1],
                            direction='wide')
}
       }































