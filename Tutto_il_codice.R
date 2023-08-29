#Parco Regionale dell'Abbazia di Monteveglio 
#importo le librerie
library(raster)
library(sp)
library(RStoolbox)
library(ggplot2)

#poi faccio il settaggio della Working directory = setwd
setwd("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/lab/R20m_tutte")

#la banda 1, 9 e 10 non le uso perché è di 60m
#prima carico le banda già a 20m [5, 6, 7, 8A, 11 e 12]
#BANDA 5
banda5_20m <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B05_20m.jp2")
banda5_20m

#BANDA 6
banda6_20m <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B06_20m.jp2")
banda6_20m

#BANDA 7
banda7_20m <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B07_20m.jp2")
banda7_20m

#BANDA 8A
banda8A_20m <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B8A_20m.jp2")
banda8A_20m

#BANDA 11
banda11_20m <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B11_20m.jp2")
banda11_20m

#BANDA 12
banda12_20m <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B12_20m.jp2")
banda12_20m

#visto che sono tutte banda .jp2 le trasformo in .tiff
writeRaster(banda5_20m, "banda5_20m.tiff")
writeRaster(banda6_20m, "banda6_20m.tiff")
writeRaster(banda7_20m, "banda7_20m.tiff")
writeRaster(banda8A_20m, "banda8A_20m.tiff")
writeRaster(banda11_20m, "banda11_20m.tiff")
writeRaster(banda12_20m, "banda12_20m.tiff")

#portare le bande 2, 3, 4 e 8 da 10m a 20m 
#BANDA2
banda2 <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B02_10m.jp2")
banda2
#ora con la funzione resample porto la banda 2 da 10m a 20m
banda2_20m <- resample(banda2, banda5_20m)
banda2_20m
writeRaster(banda2_20m, "banda2_20m.tiff")

#BANDA3
banda3 <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B03_10m.jp2")
banda3
banda3_20m <- resample(banda3, banda5_20m)
banda3_20m
writeRaster(banda3_20m, "banda3_20m.tiff")

#BANDA4
banda4 <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B04_10m.jp2")
banda4
banda4_20m <- resample(banda4, banda5_20m)
banda4_20m
writeRaster(banda4_20m, "banda4_20m.tiff")

#BANDA8
banda8 <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B08_10m.jp2")
banda8
banda8_20m <- resample(banda8, banda5_20m)
banda8_20m
writeRaster(banda8_20m, "banda8_20m.tiff")

#ora ho tutte le bande [2, 3, 4, 5, 6, 7, 8, 8A, 11 e 12]
#nella cartella R20m_tutte 
#in .tiff
#creo un brick con tutte le bande a 20m
#2
brick("banda2_20m.tiff")
b2_20m <- brick("banda2_20m.tiff")
b2_20m

#3
brick("banda3_20m.tiff")
b3_20m <- brick("banda3_20m.tiff")
b3_20m

#4
brick("banda4_20m.tiff")
b4_20m <- brick("banda4_20m.tiff")
b4_20m

#5
brick("banda5_20m.tiff")
b5_20m <- brick("banda5_20m.tiff")
b5_20m

#6
brick("banda6_20m.tiff")
b6_20m <- brick("banda6_20m.tiff")
b6_20m

#7
brick("banda7_20m.tiff")
b7_20m <- brick("banda7_20m.tiff")
b7_20m

#8
brick("banda8_20m.tiff")
b8_20m <- brick("banda8_20m.tiff")
b8_20m

#8A
brick("banda8A_20m.tiff")
b8A_20m <- brick("banda8A_20m.tiff")
b8A_20m

#11
brick("banda11_20m.tiff")
b11_20m <- brick("banda11_20m.tiff")
b11_20m

#12
brick("banda12_20m.tiff")
b12_20m <- brick("banda12_20m.tiff")
b12_20m

################################################
################################################
#caricare R da qui
#carico tutte le bande dalla cartella R20m_tutte
#prima porto le librerie
library(RStoolbox)
library(ggplot2)
library(raster)

#poi faccio il settaggio della Working directory = setwd
setwd("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/lab/R20m_tutte")

#per carica tutto il pacchetto con .tiff
list.files(pattern = "_20m.tiff")
r20m_tutte <- list.files(pattern = "_20m.tiff")
r20m_tutte

lapply(r20m_tutte, raster)
import <- lapply(r20m_tutte, raster)
import

#brick
brick(import)
brick_r20mt <- brick(import)
brick_r20mt

#ora faccio il CROP con la nostra area di saggio di qgis [validare.shp]
shapefile("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/QGIS/validare.shp")
shp_area_di_saggio_12 <- shapefile("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/QGIS/validare.shp")
shp_area_di_saggio_12

#provo a fare il plot che è il perimetro del poligono che ho fatto su qgis
plot(shp_area_di_saggio_12)
#salvata come shp_area_di_saggio_12

#ora taglio il brick sullo shapefile
#la funzione di crop nel primo fattore metto il brick/raster e nel secondo fattore metto lo shp
crop(brick_r20mt, shp_area_di_saggio_12)
brick_tagliato_12 <- crop(brick_r20mt, shp_area_di_saggio_12)
brick_tagliato_12

#####################
#ora faccio le analisi di fuzzy classification sul mio brick tagliato 
MapTheme <- list(theme(
  axis.text = element_text(size = 6),
  axis.text.y = element_text(angle = 90, hjust = 0.5),
  axis.title = element_blank()
))

##RStoolbox esempio
ggRGB(brick_tagliato_12, stretch = "lin") + MapTheme
#salvata in come ggrgb_brick_tagliato_12

#################################
#CON 3 CLASSI --> nClasses = 3
#################################
#UNSUPERVISED
#CLUSTER
set.seed(42)
#brick_tagliato_uc = unsuperClass
brick_tagliato_12_uc <- unsuperClass(brick_tagliato_12, nClasses = 3, output = "classes")
brick_tagliato_12_uc
ggR(brick_tagliato_12_uc$map, forceCat = TRUE, geom_raster = TRUE) + 
  scale_fill_viridis_d(name = "Cluster", option = "A") + MapTheme
#salvato come ggR_cluster_12

###############
#DISTANCE
#New option: distances
#Return distance to all class centroids. There is one layer per class 
#containig the euclidean distance of each pixel to its centroid
set.seed(42)
brick_tagliato_12_ucd <- unsuperClass(brick_tagliato_12, nClasses = 3, output = "distances")
brick_tagliato_12_ucd
ggR(brick_tagliato_12_ucd$map, layer = 1:3, geom_raster = TRUE) + 
  scale_fill_viridis_c(name = "Distance", direction = -1) + MapTheme
#salvata come ggR_distance_12


###################
#SPECTRAL ANGLE
#Spectral angle mapper
#nClasses = 3
#A "more supervised" alternative, if you already know the class spectra, e.g.
#of burnt areas, would be to use the spectral angle mapper. I'm taking the 
#class centers from kmeans just as an example here.
classCentroids <- brick_tagliato_12_ucd$model$centers
brick_tagliato_12_sa <- sam (brick_tagliato_12, em = classCentroids, angles = TRUE)
brick_tagliato_12_sa
ggR(brick_tagliato_12_sa, 1:3, geom_raster = TRUE) +
  scale_fill_viridis_c(name = "Spectral angle", direction = -1) + MapTheme
#salvato come ggR_spectral_12

################
#PROBABILITY
#Spectral unmixing
#nClasses = 3
#Again, as with the Spectral angle mapper, we need to know the target class characteristics
brick_tagliato_12_umx <- mesma(brick_tagliato_12, em = classCentroids)
brick_tagliato_12_umx
ggR(brick_tagliato_12_umx, 1:3, geom_raster = TRUE) +
  scale_fill_viridis_c(name = "Probability", direction = -1) + MapTheme
#salvata come ggR_probability_12


######################################
######################################
#Probabilità di appartenenza
######################################
######################################
library(RStoolbox)
library(sp)
library(raster)
library(ggplot2)
library(cluster)
library(factoextra)# Extract and Visualize the Results of Multivariate Data Analyses

#setwd("")
setwd("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/RGB")
#inserisco la tabella .csv
tab_rgb <- read.csv("1_tab_rgb.csv")
tab_rgb
str(tab_rgb)
#tolgo la colonna di sinistra 
tab_rgb_2 <- tab_rgb[, 2:4]
tab_rgb_2
#porto tutti i valori in formato numerico 
tab_rgb_2$band_1 <- as.numeric(tab_rgb$band_1)
tab_rgb_2$band_2 <- as.numeric(tab_rgb$band_2)
tab_rgb_2$band_3 <- as.numeric(tab_rgb$band_3)
str(tab_rgb_2)

#con la funzione fanny
#Computes a fuzzy clustering of the data into k clusters.
setwd("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/RGB")
fanny(tab_rgb_2, 3, metric = "euclidean", stand = FALSE)
df <- scale(tab_rgb_2)

res.fanny <- fanny(df, 3)
head(res.fanny$membership, 3008)

#ottengo la matrice di probabilità con tutte le probabilità di appartenenza al Cluster 
#corrispondente per ogni pixel e per ogni banda RGB
#esporto la matrice di probabilità ottenuta
#write.csv(res.fanny$membership, "matrice_di_probabilità.csv")

#con questa funzione ottengo i Cluster a cui è stato assegnato il pixel 
res.fanny$clustering
#lo salvo 
#write.csv(res.fanny$membership, "clustering_g.csv")


######################################
######################################
#RGB cluster
######################################
######################################
####SOLO CON LE BANDE RGB --> 2, 3, e 4
#metto solo le bande 2, 3, 4 che sono blue, green, red, portandole a 20m
library(sp)
library(raster)
library(RStoolbox)
library(ggplot2)

#poi faccio il settaggio della Working directory = setwd
#setwd("")
setwd("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/lab/bande_rgb")

#2 = banda BLUE
brick("banda2_20m.tiff")
b2_20m <- brick("banda2_20m.tiff")
b2_20m

#3 = banda GREEN
brick("banda3_20m.tiff")
b3_20m <- brick("banda3_20m.tiff")
b3_20m

#4 = banda RED
brick("banda4_20m.tiff")
b4_20m <- brick("banda4_20m.tiff")
b4_20m

############################
#poi faccio il settaggio della Working directory = setwd
setwd("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/lab/bande_rgb")

#per carica tutto il pacchetto con .tiff
list.files(pattern = "_20m.tiff")
bande_rgb <- list.files(pattern = "_20m.tiff")
bande_rgb

lapply(bande_rgb, raster)
import_rgb <- lapply(bande_rgb, raster)
import_rgb

brick(import_rgb)
brick_rgb <- brick(import_rgb)
brick_rgb

#ora faccio il CROP con la nostra area di saggio di qgis [validare.sph]
shapefile("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/QGIS/validare.shp")
shp_area_di_saggio_12 <- shapefile("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/QGIS/validare.shp")
shp_area_di_saggio_12

#provo a fare il plot che è il perimetro del poligono che ho fatto su qgis
plot(shp_area_di_saggio_12)
#salvata come shp_area_di_saggio_12_rgb

#ora taglio il brick sullo shapefile
#la funzione di crop nel primo fattore metti il brick/raster
#e nel secondo fattore metto lo shp
crop(brick_rgb, shp_area_di_saggio_12)
brick_tagliato_rgb <- crop(brick_rgb, shp_area_di_saggio_12)
brick_tagliato_rgb

#####################
#ora faccio le analisi di fuzzy classification sul mio brick tagliato 
MapTheme <- list(theme(
  axis.text = element_text(size = 6),
  axis.text.y = element_text(angle = 90, hjust = 0.5),
  axis.title = element_blank()
))

##RStoolbox esempio
ggRGB(brick_tagliato_rgb, stretch = "lin") + MapTheme
#salvata in come ggrgb_brick_rgb

#################################
#CON 3 CLASSI 
#################################
#UNSUPERVISED
#CLUSTER
set.seed(42)
#brick_tagliato_uc = unsuperClass
brick_tagliato_rgb_uc <- unsuperClass(brick_tagliato_rgb, nClasses = 3, output = "classes")
brick_tagliato_rgb_uc
ggR(brick_tagliato_rgb_uc$map, forceCat = TRUE, geom_raster = TRUE) + 
  scale_fill_viridis_d(name = "Cluster", option = "A") + MapTheme
#salvato come ggR_cluster_rgb

###############
#DISTANCE
#New option: distances
#Return distance to all class centroids. There is one layer per class 
#containig the euclidean distance of each pixel to its centroid
#nClasses = 3
set.seed(42)
brick_tagliato_rgb_ucd <- unsuperClass(brick_tagliato_rgb, nClasses = 3, output = "distances")
brick_tagliato_rgb_ucd
ggR(brick_tagliato_rgb_ucd$map, layer = 1:3, geom_raster = TRUE) + 
  scale_fill_viridis_c(name = "Distance", direction = -1) + MapTheme
#salvata come ggR_distance_12_rgb

###################
#SPECTRAL ANGLE
#Spectral angle mapper
#nClasses = 3
#A "more supervised" alternative, if you already know the class spectra, e.g.
#of burnt areas, would be to use the spectral angle mapper. I'm taking the 
#class centers from kmeans just as an example here.
classCentroids <- brick_tagliato_rgb_ucd$model$centers
brick_tagliato_rgb <- sam (brick_tagliato_rgb, em = classCentroids, angles = TRUE)
brick_tagliato_rgb
ggR(brick_tagliato_rgb, 1:3, geom_raster = TRUE) +
  scale_fill_viridis_c(name = "Spectral angle", direction = -1) + MapTheme
#salvato come ggR_spectral_rgb

################
#PROBABILITY
#Spectral unmixing
#nClasses = 3
#Again, as with the Spectral angle mapper, we need to know the target class characteristics
brick_tagliato_rgb_umx <- mesma(brick_tagliato_rgb, em = classCentroids)
brick_tagliato_rgb_umx
ggR(brick_tagliato_rgb_umx, 1:3, geom_raster = TRUE) +
  scale_fill_viridis_c(name = "Probability", direction = -1) + MapTheme
#salvata come ggR_probability_rgb


######################################
######################################
#Validazione 
######################################
######################################
#Validazione
setwd("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/RGB")
matricec <- read.csv("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/RGB/matrice_di_probabilità.csv")
matricer <- read.csv("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA/RGB/rasterizzato_perfetto.csv")

#C classificazione; R realtà
C_matrice_di_probabilità <-matricec[,2:4]
R_matrice_di_realtà <-matricer[,2:4]

#scelgo random i punti da testare
pixel <- sample (1:3008, 30, replace = FALSE) #replace = ripetizioni
pixel

#
#
#
#creo una matrice 3 colonne e numero righe=punti test
R <- matrix(c(1:90), 30, 3)
R

#rimpiazzo gli elementi della matrice con i vettori delle probabilità
i <- 1
j <- 1

while(i!=31){
  while (j!=4){
    
    R[i,j]<-as.numeric(R_matrice_di_realtà[pixel[i],][j])
    j<-j+1
  }
  i<-i+1
  j<-1
}
R


#creo una matrice 3 colonne e numero righe=punti test
C <- matrix(c(1:90), 30, 3)
C

#rimpiazzo gli elementi della matrice con i vettori delle probabilità
i <- 1
j <- 1

while(i!=31){
  while (j!=4){
    C[i,j]<-as.numeric(C_matrice_di_probabilità[pixel[i],][j])
    j<-j+1
  }
  i<-i+1
  j<-1
}
C
#
#
#
#creo matrice minimi 
minimi_x_1 <- matrix(c(1:9), 3, 3)
minimi_x_2 <- matrix(c(1:9), 3, 3)
minimi_x_3 <- matrix(c(1:9), 3, 3)
minimi_x_4 <- matrix(c(1:9), 3, 3)
minimi_x_5 <- matrix(c(1:9), 3, 3)
minimi_x_6 <- matrix(c(1:9), 3, 3)
minimi_x_7 <- matrix(c(1:9), 3, 3)
minimi_x_8 <- matrix(c(1:9), 3, 3)
minimi_x_9 <- matrix(c(1:9), 3, 3)
minimi_x_10 <- matrix(c(1:9), 3, 3)
minimi_x_11 <- matrix(c(1:9), 3, 3)
minimi_x_12 <- matrix(c(1:9), 3, 3)
minimi_x_13 <- matrix(c(1:9), 3, 3)
minimi_x_14 <- matrix(c(1:9), 3, 3)
minimi_x_15 <- matrix(c(1:9), 3, 3)
minimi_x_16 <- matrix(c(1:9), 3, 3)
minimi_x_17 <- matrix(c(1:9), 3, 3)
minimi_x_18 <- matrix(c(1:9), 3, 3)
minimi_x_19 <- matrix(c(1:9), 3, 3)
minimi_x_20 <- matrix(c(1:9), 3, 3)
minimi_x_21 <- matrix(c(1:9), 3, 3)
minimi_x_22 <- matrix(c(1:9), 3, 3)
minimi_x_23 <- matrix(c(1:9), 3, 3)
minimi_x_24 <- matrix(c(1:9), 3, 3)
minimi_x_25 <- matrix(c(1:9), 3, 3)
minimi_x_26 <- matrix(c(1:9), 3, 3)
minimi_x_27 <- matrix(c(1:9), 3, 3)
minimi_x_28 <- matrix(c(1:9), 3, 3)
minimi_x_29 <- matrix(c(1:9), 3, 3)
minimi_x_30 <- matrix(c(1:9), 3, 3)
#####################x_1#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_1[g,t]<-min(C[1,t],R[1,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_2#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_2[g,t]<-min(C[2,t],R[2,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_3#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_3[g,t]<-min(C[3,t],R[3,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_4#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_4[g,t]<-min(C[4,t],R[4,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_5#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_5[g,t]<-min(C[5,t],R[5,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_6#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_6[g,t]<-min(C[6,t],R[6,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_7#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_7[g,t]<-min(C[7,t],R[7,g])
    t<-t+1  }
  g<- g+1
  t<- 1
}

#####################x_8#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_8[g,t]<-min(C[8,t],R[8,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_9#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_9[g,t]<-min(C[9,t],R[9,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_10#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_10[g,t]<-min(C[10,t],R[10,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_11#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_11[g,t]<-min(C[11,t],R[11,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_12#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_12[g,t]<-min(C[12,t],R[12,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_13#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_13[g,t]<-min(C[13,t],R[13,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_14#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_14[g,t]<-min(C[14,t],R[14,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_15#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_15[g,t]<-min(C[15,t],R[15,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_16#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_16[g,t]<-min(C[16,t],R[16,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_17#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_17[g,t]<-min(C[17,t],R[17,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_18#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_18[g,t]<-min(C[18,t],R[18,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_19#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_19[g,t]<-min(C[19,t],R[19,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_20#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_20[g,t]<-min(C[20,t],R[20,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_21#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_21[g,t]<-min(C[21,t],R[21,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_22#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_22[g,t]<-min(C[22,t],R[22,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_23#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_23[g,t]<-min(C[23,t],R[23,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_24#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_24[g,t]<-min(C[24,t],R[24,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_25#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_25[g,t]<-min(C[25,t],R[25,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_26#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_26[g,t]<-min(C[26,t],R[26,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_27#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_27[g,t]<-min(C[27,t],R[27,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_28#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_28[g,t]<-min(C[28,t],R[28,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_29#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_29[g,t]<-min(C[29,t],R[29,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_30#################
g <- 1
t <- 1

while(g!=4){
  while (t!=4){
    minimi_x_30[g,t]<-min(C[30,t],R[30,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

######################## somme #####################
matrice_confusione <- matrix(c(1:9), 3, 3)

f <- 1
h <- 1

while(f!=4){
  while (h!=4){
    matrice_confusione[f,h]<- minimi_x_1[f,h]+minimi_x_2[f,h]+minimi_x_3[f,h]+minimi_x_4[f,h]+minimi_x_5[f,h]+minimi_x_6[f,h]+minimi_x_7[f,h]+minimi_x_8[f,h]+minimi_x_9[f,h]+minimi_x_10[f,h]+minimi_x_11[f,h]+minimi_x_12[f,h]+minimi_x_13[f,h]+minimi_x_14[f,h]+minimi_x_15[f,h]+minimi_x_16[f,h]+minimi_x_17[f,h]+minimi_x_18[f,h]+minimi_x_19[f,h]+minimi_x_20[f,h]+minimi_x_21[f,h]+minimi_x_22[f,h]+minimi_x_23[f,h]+minimi_x_24[f,h]+minimi_x_25[f,h]+minimi_x_26[f,h]+minimi_x_27[f,h]+minimi_x_28[f,h]+minimi_x_29[f,h]+minimi_x_30[f,h]
    h<-h+1
  }
  f<- f+1
  h <- 1
}

matrice_confusione
####################### somma diagonale ########################
y <- 1
somma <- 0
while(y!=4){
  somma <-somma + matrice_confusione[y,y]
  y<- y+1
}
somma

##############################################################
Accuratezza <- somma/30

Accuratezza

