##mean and standard deviation
features <- names(database.long[,-1])
subdf <- subset(database.long,select=features)

tapply(subdf[,1], subdf$Tempo,function(x)mean(x,na.rm=TRUE))
