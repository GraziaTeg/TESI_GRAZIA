#Parco Regionale dell'Abbazia di Monteveglio 
#importo le librerie
library(raster)
library(sp)
library(RStoolbox)
library(ggplot2)

#poi faccio il settaggio della Working directory = setwd
setwd("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/lab/R20m_tutte")

#la banda 1, 9 e 10 non le uso perché è di 60m
#prima carico le banda già a 20m [5, 6, 7, 8A, 11 e 12]
#BANDA 5
banda5_20m <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B05_20m.jp2")
banda5_20m

#BANDA 6
banda6_20m <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B06_20m.jp2")
banda6_20m

#BANDA 7
banda7_20m <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B07_20m.jp2")
banda7_20m

#BANDA 8A
banda8A_20m <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B8A_20m.jp2")
banda8A_20m

#BANDA 11
banda11_20m <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B11_20m.jp2")
banda11_20m

#BANDA 12
banda12_20m <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B12_20m.jp2")
banda12_20m

#visto che sono tutte banda .jp2 le trasformo in .tiff
#writeRaster(banda5_20m, "banda5_20m.tiff")
#writeRaster(banda6_20m, "banda6_20m.tiff")
#writeRaster(banda7_20m, "banda7_20m.tiff")
#writeRaster(banda8A_20m, "banda8A_20m.tiff")
#writeRaster(banda11_20m, "banda11_20m.tiff")
#writeRaster(banda12_20m, "banda12_20m.tiff")

#portare le bande 2, 3, 4 e 8 da 10m a 20m 
#BANDA2
banda2 <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B02_10m.jp2")
banda2
#ora con la funzione resample porto la banda 2 da 10m a 20m
banda2_20m <- resample(banda2, banda5_20m)
banda2_20m
#writeRaster(banda2_20m, "banda2_20m.tiff")

#BANDA3
banda3 <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B03_10m.jp2")
banda3
banda3_20m <- resample(banda3, banda5_20m)
banda3_20m
#writeRaster(banda3_20m, "banda3_20m.tiff")

#BANDA4
banda4 <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B04_10m.jp2")
banda4
banda4_20m <- resample(banda4, banda5_20m)
banda4_20m
#writeRaster(banda4_20m, "banda4_20m.tiff")

#BANDA8
banda8 <- raster("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/lab/R20m/T32TPQ_20190325T101021_B08_10m.jp2")
banda8
banda8_20m <- resample(banda8, banda5_20m)
banda8_20m
#writeRaster(banda8_20m, "banda8_20m.tiff")

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
library(raster)
library(sp)
library(RStoolbox)
library(ggplot2)

#poi faccio il settaggio della Working directory = setwd
setwd("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/lab/R20m_tutte")

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
shapefile("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/QGIS/validare.shp")
shp_area_di_saggio_12 <- shapefile("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/QGIS/validare.shp")
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
  scale_fill_viridis_d(name = "Unsupervised", option = "A") + MapTheme
#salvato come ggR_cluster_12_unsupervised

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
#salvata come ggR_distance_12_dist

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
#salvato come ggR_spectral_12_spectral

################
#PROBABILITY
#Spectral unmixing
#nClasses = 3
#Again, as with the Spectral angle mapper, we need to know the target class characteristics
brick_tagliato_12_umx <- mesma(brick_tagliato_12, em = classCentroids)
brick_tagliato_12_umx
ggR(brick_tagliato_12_umx, 1:3, geom_raster = TRUE) +
  scale_fill_viridis_c(name = "Probability", direction = -1) + MapTheme
#salvata come ggR_probability_12_prob

####################################
####################################
####################################
#Unsupervised
setwd("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/Rn - Cm")
str(brick_tagliato_12_uc$map@data@values)

valori <- brick_tagliato_12_uc$map@data@values
valori
#write.csv(valori, "Cm - unsupervised.csv")

######################################
######################################
#MATRICE DI CONFUSIONE HARD 
valori_giusti <- read.csv("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/Rn - Cm/Cm - unsupervised.csv")
valori_giusti
R <- read.csv("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/Rn - Cm/Rn.csv")
R

pixel <- sample (1:3008, 100, replace = FALSE) #replace = ripetizioni
pixel 

confmatr <- matrix(c(0), 3, 3)
confmatr
j <- 1
i <- 1
t <- 1
######################ottengo l'indice della colonna con 1 in valori_giusti e di R
while(i!=101){
  a <- pixel[i]
  print(a)
  while(j<4){
    if(valori_giusti[a,j]==0){
      j=j+1
    }
    else{
      break
    }
  }
  while(t<4){
    if(R[a,t]==0){
      t=t+1
     }
    else{
      break
    }
  }
  if(j==1 && t==1){
    confmatr[1,1] <- confmatr[1,1]+1
  }
  else if(j==2 && t==2){
    confmatr[2,2] <- confmatr[2,2]+1
  }
  else if(j==3 && t==3){
    confmatr[3,3] <- confmatr[3,3]+1
  }
  else if(j==1 && t==2){
    confmatr[1,2] <- confmatr[1,2]+1
  }
  else if(j==1 && t==3){
    confmatr[1,3] <- confmatr[1,3]+1
  }
  else if(j==2 && t==1){
    confmatr[2,1] <- confmatr[2,1]+1
  }
  else if(j==2 && t==3){
    confmatr[2,3] <- confmatr[2,3]+1
  }
  else if(j==3 && t==1){
    confmatr[3,1] <- confmatr[3,1]+1
  }
  else if(j==3 && t==2){
    confmatr[3,2] <- confmatr[3,2]+1
  }
  i=i+1  
  j <-1
  t <-1
}
confmatr
##########################somma_diagonale########################
y <- 1
somma <- 0
while(y!=4){
  somma <-somma + confmatr[y,y]
  y<- y+1
}
somma
##############################################################
Accuratezza <- somma/100
Accuratezza


#######################################
#######################################
#######################################
#MATRICE DI CONFUSIONE FUZZY
setwd("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_GRAZIA_1/fuzzy")
str(brick_tagliato_12_umx)

str(brick_tagliato_12_umx@data@values)
prob <- brick_tagliato_12_umx@data@values
prob
#write.csv(prob, "prob.csv")

#####################################
#####################################
#MATRICE DI CONFUSIONE 
#Validazione
setwd("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/Rn - Cm")
matricec <- read.csv("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/Rn - Cm/Cm - probabilità.csv")
matricec
matricer <- read.csv("D:/UNIVERSITA' MAGISTRALE/TESI/TESI_TEGGI_GRAZIA/Rn - Cm/Rn.csv")
matricer

#scelgo random i punti da testare
pixel <- sample (1:3008, 100, replace = FALSE) #replace = ripetizioni
pixel

#creo una matrice 3 colonne e numero righe=punti test
R <- matrix(c(1:300), 100, 3)
R

#rimpiazzo gli elementi della matrice con i vettori delle probabilità
i <- 1
j <- 1
while(i!=101){
  while (j!=4){
    R[i,j]<-as.numeric(matricer[pixel[i],][j])
    j<-j+1
  }
  i<-i+1
  j<-1
}
R

#creo una matrice 3 colonne e numero righe = punti test
C <- matrix(c(1:300), 100, 3)
C

#rimpiazzo gli elementi della matrice con i vettori delle probabilità
i <- 1
j <- 1

while(i!=101){
  while (j!=4){
    C[i,j]<-as.numeric(matricec[pixel[i],][j])
    j<-j+1
  }
  i<-i+1
  j<-1
}
C
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
minimi_x_31 <- matrix(c(1:9), 3, 3)
minimi_x_32 <- matrix(c(1:9), 3, 3)
minimi_x_33 <- matrix(c(1:9), 3, 3)
minimi_x_34 <- matrix(c(1:9), 3, 3)
minimi_x_35 <- matrix(c(1:9), 3, 3)
minimi_x_36 <- matrix(c(1:9), 3, 3)
minimi_x_37 <- matrix(c(1:9), 3, 3)
minimi_x_38 <- matrix(c(1:9), 3, 3)
minimi_x_39 <- matrix(c(1:9), 3, 3)
minimi_x_40 <- matrix(c(1:9), 3, 3)
minimi_x_41 <- matrix(c(1:9), 3, 3)
minimi_x_42 <- matrix(c(1:9), 3, 3)
minimi_x_43 <- matrix(c(1:9), 3, 3)
minimi_x_44 <- matrix(c(1:9), 3, 3)
minimi_x_45 <- matrix(c(1:9), 3, 3)
minimi_x_46 <- matrix(c(1:9), 3, 3)
minimi_x_47 <- matrix(c(1:9), 3, 3)
minimi_x_48 <- matrix(c(1:9), 3, 3)
minimi_x_49 <- matrix(c(1:9), 3, 3)
minimi_x_50 <- matrix(c(1:9), 3, 3)
minimi_x_51 <- matrix(c(1:9), 3, 3)
minimi_x_52 <- matrix(c(1:9), 3, 3)
minimi_x_53 <- matrix(c(1:9), 3, 3)
minimi_x_54 <- matrix(c(1:9), 3, 3)
minimi_x_55 <- matrix(c(1:9), 3, 3)
minimi_x_56 <- matrix(c(1:9), 3, 3)
minimi_x_57 <- matrix(c(1:9), 3, 3)
minimi_x_58 <- matrix(c(1:9), 3, 3)
minimi_x_59 <- matrix(c(1:9), 3, 3)
minimi_x_60 <- matrix(c(1:9), 3, 3)
minimi_x_61 <- matrix(c(1:9), 3, 3)
minimi_x_62 <- matrix(c(1:9), 3, 3)
minimi_x_63 <- matrix(c(1:9), 3, 3)
minimi_x_64 <- matrix(c(1:9), 3, 3)
minimi_x_65 <- matrix(c(1:9), 3, 3)
minimi_x_66 <- matrix(c(1:9), 3, 3)
minimi_x_67 <- matrix(c(1:9), 3, 3)
minimi_x_68 <- matrix(c(1:9), 3, 3)
minimi_x_69 <- matrix(c(1:9), 3, 3)
minimi_x_70 <- matrix(c(1:9), 3, 3)
minimi_x_71 <- matrix(c(1:9), 3, 3)
minimi_x_72 <- matrix(c(1:9), 3, 3)
minimi_x_73 <- matrix(c(1:9), 3, 3)
minimi_x_74 <- matrix(c(1:9), 3, 3)
minimi_x_75 <- matrix(c(1:9), 3, 3)
minimi_x_76 <- matrix(c(1:9), 3, 3)
minimi_x_77 <- matrix(c(1:9), 3, 3)
minimi_x_78 <- matrix(c(1:9), 3, 3)
minimi_x_79 <- matrix(c(1:9), 3, 3)
minimi_x_80 <- matrix(c(1:9), 3, 3)
minimi_x_81 <- matrix(c(1:9), 3, 3)
minimi_x_82 <- matrix(c(1:9), 3, 3)
minimi_x_83 <- matrix(c(1:9), 3, 3)
minimi_x_84 <- matrix(c(1:9), 3, 3)
minimi_x_85 <- matrix(c(1:9), 3, 3)
minimi_x_86 <- matrix(c(1:9), 3, 3)
minimi_x_87 <- matrix(c(1:9), 3, 3)
minimi_x_88 <- matrix(c(1:9), 3, 3)
minimi_x_89 <- matrix(c(1:9), 3, 3)
minimi_x_90 <- matrix(c(1:9), 3, 3)
minimi_x_91 <- matrix(c(1:9), 3, 3)
minimi_x_92 <- matrix(c(1:9), 3, 3)
minimi_x_93 <- matrix(c(1:9), 3, 3)
minimi_x_94 <- matrix(c(1:9), 3, 3)
minimi_x_95 <- matrix(c(1:9), 3, 3)
minimi_x_96 <- matrix(c(1:9), 3, 3)
minimi_x_97 <- matrix(c(1:9), 3, 3)
minimi_x_98 <- matrix(c(1:9), 3, 3)
minimi_x_99 <- matrix(c(1:9), 3, 3)
minimi_x_100 <- matrix(c(1:9), 3, 3)
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
    t<-t+1
  }
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
#####################x_31#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_31[g,t]<-min(C[31,t],R[31,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_32#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_32[g,t]<-min(C[32,t],R[32,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_33#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_33[g,t]<-min(C[33,t],R[33,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_34#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_34[g,t]<-min(C[34,t],R[34,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_35#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_35[g,t]<-min(C[35,t],R[35,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_36#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_36[g,t]<-min(C[36,t],R[36,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_37#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_37[g,t]<-min(C[37,t],R[37,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_38#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_38[g,t]<-min(C[38,t],R[38,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_39#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_39[g,t]<-min(C[39,t],R[39,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_40#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_40[g,t]<-min(C[40,t],R[40,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_41#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_41[g,t]<-min(C[41,t],R[41,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_42#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_42[g,t]<-min(C[42,t],R[42,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_43#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_43[g,t]<-min(C[43,t],R[43,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_44#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_44[g,t]<-min(C[44,t],R[44,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_45#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_45[g,t]<-min(C[45,t],R[45,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_46#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_46[g,t]<-min(C[46,t],R[46,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_47#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_47[g,t]<-min(C[47,t],R[47,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_48#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_48[g,t]<-min(C[48,t],R[48,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_49#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_49[g,t]<-min(C[49,t],R[49,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_50#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_50[g,t]<-min(C[50,t],R[50,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}

#####################x_51#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_51[g,t]<-min(C[51,t],R[51,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_52#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_52[g,t]<-min(C[52,t],R[52,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_53#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_53[g,t]<-min(C[53,t],R[53,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_54#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_54[g,t]<-min(C[54,t],R[54,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_55#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_55[g,t]<-min(C[55,t],R[55,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_56#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_56[g,t]<-min(C[56,t],R[56,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_57#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_57[g,t]<-min(C[57,t],R[57,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_58#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_58[g,t]<-min(C[58,t],R[58,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_59#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_59[g,t]<-min(C[59,t],R[59,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_60#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_60[g,t]<-min(C[60,t],R[60,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_61#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_61[g,t]<-min(C[61,t],R[61,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_62#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_62[g,t]<-min(C[62,t],R[62,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_63#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_63[g,t]<-min(C[63,t],R[63,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_64#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_64[g,t]<-min(C[64,t],R[64,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_65#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_65[g,t]<-min(C[65,t],R[65,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_66#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_66[g,t]<-min(C[66,t],R[66,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_67#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_67[g,t]<-min(C[67,t],R[67,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_68#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_68[g,t]<-min(C[68,t],R[68,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_69#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_69[g,t]<-min(C[69,t],R[69,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_70#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_70[g,t]<-min(C[70,t],R[70,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_71#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_71[g,t]<-min(C[71,t],R[71,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_72#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_72[g,t]<-min(C[72,t],R[72,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_73#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_73[g,t]<-min(C[73,t],R[73,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_74#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_74[g,t]<-min(C[74,t],R[74,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_75#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_75[g,t]<-min(C[75,t],R[75,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_76#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_76[g,t]<-min(C[76,t],R[76,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_77#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_77[g,t]<-min(C[77,t],R[77,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_78#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_78[g,t]<-min(C[78,t],R[78,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_79#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_79[g,t]<-min(C[79,t],R[79,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_80#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_80[g,t]<-min(C[80,t],R[80,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_81#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_81[g,t]<-min(C[81,t],R[81,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_82#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_82[g,t]<-min(C[82,t],R[82,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_83#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_83[g,t]<-min(C[83,t],R[83,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_84#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_84[g,t]<-min(C[84,t],R[84,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_85#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_85[g,t]<-min(C[85,t],R[85,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_86#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_86[g,t]<-min(C[86,t],R[86,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_87#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_87[g,t]<-min(C[87,t],R[87,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_88#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_88[g,t]<-min(C[88,t],R[88,g])
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
    minimi_x_89[g,t]<-min(C[89,t],R[89,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_90#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_90[g,t]<-min(C[90,t],R[90,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_91#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_91[g,t]<-min(C[91,t],R[91,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_92#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_92[g,t]<-min(C[92,t],R[92,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_93#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_93[g,t]<-min(C[93,t],R[93,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_94#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_94[g,t]<-min(C[94,t],R[94,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_95#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_95[g,t]<-min(C[95,t],R[95,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_96#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_96[g,t]<-min(C[96,t],R[96,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_97#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_97[g,t]<-min(C[97,t],R[97,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_98#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_98[g,t]<-min(C[98,t],R[98,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_99#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_99[g,t]<-min(C[99,t],R[99,g])
    t<-t+1
  }
  g<- g+1
  t<- 1
}
#####################x_100#################
g <- 1
t <- 1
while(g!=4){
  while (t!=4){
    minimi_x_100[g,t]<-min(C[100,t],R[100,g])
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
    matrice_confusione[f,h] <- minimi_x_1[f,h]+minimi_x_2[f,h]+minimi_x_3[f,h]+minimi_x_4[f,h]+minimi_x_5[f,h]+minimi_x_6[f,h]+minimi_x_7[f,h]+minimi_x_8[f,h]+minimi_x_9[f,h]+minimi_x_10[f,h]+
      minimi_x_11[f,h]+minimi_x_12[f,h]+minimi_x_13[f,h]+minimi_x_14[f,h]+minimi_x_15[f,h]+minimi_x_16[f,h]+minimi_x_17[f,h]+minimi_x_18[f,h]+minimi_x_19[f,h]+minimi_x_20[f,h]+
      minimi_x_21[f,h]+minimi_x_22[f,h]+minimi_x_23[f,h]+minimi_x_24[f,h]+minimi_x_25[f,h]+minimi_x_26[f,h]+minimi_x_27[f,h]+minimi_x_28[f,h]+minimi_x_29[f,h]+minimi_x_30[f,h]+
      minimi_x_31[f,h]+minimi_x_32[f,h]+minimi_x_33[f,h]+minimi_x_34[f,h]+minimi_x_35[f,h]+minimi_x_36[f,h]+minimi_x_37[f,h]+minimi_x_38[f,h]+minimi_x_39[f,h]+minimi_x_40[f,h]+
      minimi_x_41[f,h]+minimi_x_42[f,h]+minimi_x_43[f,h]+minimi_x_44[f,h]+minimi_x_45[f,h]+minimi_x_46[f,h]+minimi_x_47[f,h]+minimi_x_48[f,h]+minimi_x_49[f,h]+minimi_x_50[f,h]+
      minimi_x_51[f,h]+minimi_x_52[f,h]+minimi_x_53[f,h]+minimi_x_54[f,h]+minimi_x_55[f,h]+minimi_x_56[f,h]+minimi_x_57[f,h]+minimi_x_58[f,h]+minimi_x_59[f,h]+minimi_x_60[f,h]+
      minimi_x_61[f,h]+minimi_x_62[f,h]+minimi_x_63[f,h]+minimi_x_64[f,h]+minimi_x_65[f,h]+minimi_x_66[f,h]+minimi_x_67[f,h]+minimi_x_68[f,h]+minimi_x_69[f,h]+minimi_x_70[f,h]+
      minimi_x_71[f,h]+minimi_x_72[f,h]+minimi_x_73[f,h]+minimi_x_74[f,h]+minimi_x_75[f,h]+minimi_x_76[f,h]+minimi_x_77[f,h]+minimi_x_78[f,h]+minimi_x_79[f,h]+minimi_x_80[f,h]+
      minimi_x_81[f,h]+minimi_x_82[f,h]+minimi_x_83[f,h]+minimi_x_84[f,h]+minimi_x_85[f,h]+minimi_x_86[f,h]+minimi_x_87[f,h]+minimi_x_88[f,h]+minimi_x_89[f,h]+minimi_x_90[f,h]+
      minimi_x_91[f,h]+minimi_x_92[f,h]+minimi_x_93[f,h]+minimi_x_94[f,h]+minimi_x_95[f,h]+minimi_x_96[f,h]+minimi_x_97[f,h]+minimi_x_98[f,h]+minimi_x_99[f,h]+minimi_x_100[f,h]
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
Accuratezza <- somma/100
Accuratezza

