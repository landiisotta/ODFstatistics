library('reshape2')

##read file .xlsx and .xls
readdb.xlsx <- function(path, dataset.name, typedf, nfact=NULL,
                        nsheet=NULL, nc=NULL){
  library('gdata')
  
  data.path <- file.path(path)

  if(typedf=='sh'){
    dataframe <- data.frame()
    for(i in 1:nsheet){
      assign(paste('dataframe',i,sep=''),
             read.xls(file.path(data.path,dataset.name),
                       header=TRUE, sheet=i, dec='.'))
      dataframe <- rbind(dataframe,get(paste('dataframe',i,sep='')))
    }
    typedf <- 'l'
  } else {
    dataframe <- read.xls(file.path(data.path,dataset.name), header=TRUE,
                          dec='.')
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
  } else { return(dataframe)}
         }
  return(list(dataframe.long,dataframe.wide))
}


##read file .csv
readdb.csv <- function(path, dataset.name, typedf, nfact=NULL, nsheet=NULL){  
  data.path <- file.path(path)

  if(typedf=='sh'){
    dataframe <- data.frame()
    time <- vector(mode='numeric')
    for(i in 1:nsheet){
      assign(paste('dataframe',i,sep=''),
             read.table(file.path(data.path,dataset.name),
                        header=TRUE, as.is=TRUE,
                        stringsAsFactors=TRUE, dec='.',
                        sep=','))
      dataframe <- rbind(dataframe,get(paste('dataframe',i,sep='')))
    }
    typedf <- 'l'
  } else {
    dataframe <- read.table(file.path(data.path,dataset.name),
                            header=TRUE, as.is=TRUE,
                            stringsAsFactors=TRUE, dec='.',
                            sep=',')
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
  } else {return(dataframe)}
         }
return(list(dataframe.long,dataframe.wide))
}


