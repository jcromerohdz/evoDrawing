library("ggplot2")
library(evd)
library(fitdistrplus)


suffix <- c("1","2","3")
for ( i in suffix ) {
    data <- read.csv(paste0("data",i,".csv"))
    ggplot(data,aes(x=as.numeric(row.names(data)),y=participation))+geom_point()+scale_y_log10()

    this.fit <- fgev(data$participation)
    print(paste0("Fit ",i, " GEV " ))
    print(this.fit)

    this.weibull <- fitdistr(data$participation,"weibull")
    print(paste0("Fit ",i, " Weibull " ))
    print(this.weibull)
}
