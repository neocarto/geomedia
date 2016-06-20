rm(list=ls())
setwd("/var/www/html/geomedia/files")
require(rgdal)

# IMPORT
donnees<-read.csv( "json/metadata.csv",header=TRUE,sep="\t",dec=".",encoding="latin1",)

# EXPORT
datajson <- rjson::toJSON(unname((as.data.frame(t(donnees)))),method="C")

write(datajson, "json/data.json")
