library("ggplot2")
library(evd)

data <- read.csv("data1.csv")
fw <- fitdistr(data$participation, "weibull")


this.fw.weib <- data.frame(rank=1:length(data$participation),
                            y=sort(rweibull(length(data$participation),
                                            this.weibull$estimate["shape"],
                                            this.weibull$estimate["scale"]),decreasing=T))
print(this.fw.weib)


ggplot(data,aes(x=as.numeric(row.names(data)),y=participation))+geom_point()+geom_point(data=this.fw.weib,aes(x=rank,y=y,color='Fit',shape='Fit'))+scale_y_log10() + stat_function(fun = dweibull, args = list( scale = 75.1151136, shape= 0.069, log=TRUE ))  


ggplot(data,aes(x=as.numeric(row.names(data)),y=participation))+geom_point()+scale_y_log10() +stat_function(fun = dgev, args = list(loc = 10.3478, scale = 10.1431, shape= 0.6411, log=TRUE))



data <- read.csv(paste0("/Users/mariosky/evoDrawing/data/data",2,".csv"))
ggplot(data,aes(x=as.numeric(row.names(data)),y=participation))+geom_point()+scale_y_log10() +stat_function(fun = dgev, args = list(loc = 17.4977 , scale = 12.3651, shape= 0.3873 , log=TRUE))


data <- read.csv(paste0("/Users/mariosky/evoDrawing/data/data",3,".csv"))
ggplot(data,aes(x=as.numeric(row.names(data)),y=participation))+geom_point()+scale_y_log10() +stat_function(fun = dgev, args = list(loc =22.327 , scale = 28.153, shape= 1.039  , log=TRUE))     

 
