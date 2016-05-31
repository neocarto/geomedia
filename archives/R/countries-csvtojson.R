# LES PAYS (liste, codes, labels, polygones, centroides)

setwd("/var/www/html/geomedia/database")
require(rgdal)
require(rgeos)

# COUNTRIES (polygones)
countries <- readOGR(dsn ="input/geom",layer = "NED_10m_eckertIV_v2")

mycsv<-read.csv( "input/PaysV4.csv",header=TRUE,sep="\t",dec=".",encoding="latin1",)
countries@data = data.frame(countries@data,mycsv[match(countries@data[,"ISO3"], mycsv[,"TAG"]),])
countries <- countries[!is.na(countries@data$VERSION),]
countries@data <- countries@data[,c("ISO3","name")]
colnames(countries@data) <- c("id","name")

#writeOGR(countries, "output", "world", driver="ESRI Shapefile")
#writeOGR(sah, "output", "sah", driver="ESRI Shapefile")

sah <- countries[countries@data$ISO3=="SAH",]
sah@data <- sah@data[,c("ISO3","name")]
colnames(sah@data) <- c("id","name")

# PAYS(centroides)


# TERRES EMMERGEES


xy@data$x <- xy@coords[,1]
xy@data$y <- xy@coords[,2]

head(xy@data)
countries <- xy@data[,c("ISO3","name","x","y")]
colnames(countries) <- c("id","name","x","y")
datajson <- rjson::toJSON(unname((as.data.frame(t(countries)))),method="C")
write(datajson, "output/countries.json")


head(countries)
