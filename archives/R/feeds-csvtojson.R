setwd("/var/www/html/geomedia/database")
require(rgdal)

mycsv<-read.csv( "input/List_corpus_36_feeds.csv",header=TRUE,sep="\t",dec=".",encoding="latin1",)
myfeeds <- data.frame(mycsv$Name_Flux,mycsv$Journal_Name)
colnames(myfeeds) <- c("id","name")
datajson <- rjson::toJSON(unname((as.data.frame(t(myfeeds)))),method="C")
write(datajson, "output/feeds.json")