# Preparar datos para aplicación interactiva

#====

data  <- read.csv("data/r33_percapita.csv", as.is=T, encoding="utf8")

# Años
table(data$year) # 2011, 2012, 2013, 2014


# Agregar nombres completos de los Fondos
names(data)
require(plyr)
data$fondo <- mapvalues(data$variable, from = c('r33_total','r33_faeb'	,'r33_fasa'	,'r33_fis'	,'r33_fise'	,'r33_fism'	,'r33_multiple'	,'r33_alimenticio'	,'r33_infraeduca'	,'r33_edusuperior'	,'r33_fortamun'	,'r33_edutecnologica'	,'r33_segurid'	,'r33_fortaestados'), 
                        to = c('Total','Fondo de aportaciones para la educación básica y formal'	,'Fondo de aportaciones para los servicios de salud'	,'Fondo de aportaciones para la infraestructura social'	,'Fondo para la infraestructura social estatal'	,'Fondo para la infraestructura social municipal'	,'Fondo de aportaciones múltiples'	,'Apoyos alimentarios'	,'Apoyos para infraestructura educativa'	,'Apoyos para la educaciónn superior'	,'Fondo de aportaciones para el fortaleciomiento de los municipios y de las demarcaciones territoriales del distrito federal'	,'Fondo de aportaciones para la educación tecnológica y de adultos'	,'Fondo de aportaciones para la seguridad pública de los Estados y del Distrito Federal'	,'Fondo de aportaciones para el fortalecimiento de las Entidades Federativas'))
head(data)

# Cambiar formato % en valReal y Percap para reducir a dos decimales
data$valReal  <- as.numeric(format(round(as.numeric(data$valReal),1), nsmall = 1))
data$percap  <- as.numeric(format(round(as.numeric(data$percap),1), nsmall = 1))
data$poblacion  <- as.numeric(format(round(as.numeric(data$poblacion),1), nsmall = 0))
head(data)

# Separar miles con comas
data$valReal  <- format(data$valReal, big.mark=",")
data$poblacion  <- format(data$poblacion, big.mark=",",nsmall = 0)
data$percap  <- format(data$percap, big.mark=",")

# Mantener solo variables relevantes para la tabla
names(data)
data  <- data[,c(-4,-5,-6,-7)]
data  <- data[,-2]

# Cambiar nombres de variables
head(data)
names(data)  <- c("Año","Estado","Mdp","Población","Percápita","Fondo")
data  <- data[,c(1,2,6,3:5)]

# Exportar como datos para la aplicacion interactiva
write.csv(data,"data/data_table.csv",row.names=F, fileEncoding="utf8")

# Final del script
#########