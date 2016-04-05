library("ggplot2")
library(evd)
library(fitdistrplus)


suffix <- c("1")
for ( i in suffix ) {
    data <- read.csv(paste0("/Users/mariosky/evoDrawing/data/data",i,".csv"))
  # ggplot(data,aes(x=as.numeric(row.names(data)),y=participation)) +geom_point()+scale_y_log10()
    
    this.fit <- fgev(data$participation)
#    print(paste0("Fit ",i, " GEV " ))
 #   print(this.fit)
   
    ggplot(data,aes(x=as.numeric(row.names(data)),y=participation))+geom_point()+scale_y_log10() +stat_function(fun = dgev, args = list(loc = 10.3478, scale = 10.1431, shape= 0.6411, log=TRUE))
    
    #this.weibull <- fitdistr(data$participation,"weibull")
    #print(paste0("Fit ",i, " Weibull " ))
    #print(this.weibull)
}
