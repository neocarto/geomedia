setwd("/var/www/html/geomedia/database")
require(rgdal)


mycsv<-read.csv( "input/PaysV4.csv",header=TRUE,sep="\t",dec=".",encoding="latin1",)
mycountries <- unique(mycsv$TAG)
mycountries <- data.frame(mycountries,mycountries)
colnames(mycountries) <- c("id","name")
datajson <- rjson::toJSON(unname((as.data.frame(t(mycountries)))),method="C")
write(datajson, "output/countries.json")
