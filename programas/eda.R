# Instalación (si es necesario) y carga de librerías
if(!require(mlbench)) install.packages("mlbench")
if(!require(tidyverse)) install.packages("tidyverse")
if(!require(corrplot)) install.packages("corrplot")

library(mlbench)
library(tidyverse)
library(corrplot)

# Carga del dataset
data(BreastCancer)
df <- BreastCancer


cat("Dataset cargado exitosamente.\n")

#------------------------------------------------------------
# Etapa 2: Inspección Inicial y Estructura
#------------------------------------------------------------
# Visualización de las primeras filas
head(df)

# Estructura del dataset (tipos de datos)
str(df)

# Resumen estadístico descriptivo
summary(df)


#------------------------------------------------------------
#Etapa 3: Limpieza de Datos
#------------------------------------------------------------
# Eliminamos la columna ID ya que no aporta valor estadístico
df <- df %>% select(-Id)

# Conversión de columnas de factores a numéricas (excepto la variable objetivo 'Class')
df_numeric <- df
df_numeric[,-10] <- sapply(df_numeric[,-10], function(x) as.numeric(as.character(x)))

# Verificación de valores faltantes (NA)
colSums(is.na(df_numeric))

# Eliminamos filas con NAs para este ejemplo
df_clean <- na.omit(df_numeric)

#------------------------------------------------------------
# Etapa 4: Análisis Univariado (Distribuciones)
#------------------------------------------------------------
# Distribución de la variable objetivo
ggplot(df_clean, aes(x = Class, fill = Class)) +
  geom_bar() +
  theme_minimal() +
  labs(title = "Distribución de Diagnósticos", x = "Clase", y = "Frecuencia")

# Histograma de una característica (ej. Clump Thickness)
ggplot(df_clean, aes(x = Cl.thickness)) +
  geom_histogram(binwidth = 1, fill = "steelblue", color = "white") +
  theme_minimal() +
  labs(title = "Distribución de Grosor de Masa", x = "Grosor", y = "Conteo")


#------------------------------------------------------------
# Etapa 5: Análisis Bivariado y Correlaciones
#------------------------------------------------------------
# Matriz de correlación (excluyendo la columna Class)
cor_matrix <- cor(df_clean[,-10])

# Visualización del Mapa de Calor
corrplot(cor_matrix, method = "color", type = "upper", 
         tl.col = "black", tl.srt = 45, addCoef.col = "black")

# Relación entre Cel.size y Cel.shape coloreado por Clase
ggplot(df_clean, aes(x = Cell.size, y = Cell.shape, color = Class)) +
  geom_jitter(alpha = 0.5) + # Usamos jitter porque los datos son discretos (1-10)
  theme_minimal() +
  labs(title = "Tamaño vs Forma de Celda por Diagnóstico")

#------------------------------------------------------------
# Etapa 6: Identificación de Valores Atípicos (Outliers)
#------------------------------------------------------------
# Transformamos los datos a formato largo para graficar múltiples boxplots
df_long <- df_clean %>%
  pivot_longer(cols = -Class, names_to = "Caracteristica", values_to = "Valor")

# Gráfico de Boxplots
ggplot(df_long, aes(x = Caracteristica, y = Valor, fill = Caracteristica)) +
  geom_boxplot() +
  coord_flip() + # Giramos para mejor lectura
  theme_minimal() +
  theme(legend.position = "none") +
  labs(title = "Detección de Outliers en Características", x = "", y = "Valor (Escala 1-10)")