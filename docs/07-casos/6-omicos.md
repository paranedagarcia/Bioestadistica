---
id: casos-omicos
title: Datos omicos
sidebar_label: Datos omicos
sidebar_position: 6
---

## Reducción de Dimensionalidad en Datos Ómicos (PCA)
**Problema:** Analizar perfiles de expresión génica masiva (ej. dataset NCI60 con >6,000 genes) para visualizar agrupamientos de diferentes tipos de cáncer en un espacio bidimensional.

**Planteamiento Matemático:** El Análisis de Componentes Principales (PCA) transforma variables correlacionadas en un nuevo conjunto de variables ortogonales (CP). La primera componente $Z_1$ es la combinación lineal de las características originales $X$ que maximiza la varianza:

```math
Z_1 = \phi_{11}X_1 + \phi_{21}X_2 + \dots + \phi_{p1}X_p
```
Donde $\phi$ son los *loadings* (pesos) que definen la dirección de máxima variabilidad,.

**Ejemplo en R:**
```r
# Uso del dataset NCI60 de microarrays
library(ISLR)
nci_data <- NCI60$data

# Ejecución de PCA con escalamiento de genes
pca_res <- prcomp(nci_data, scale = TRUE)

# Visualización de las dos primeras componentes
plot(pca_res$x[, 1:2], col = as.factor(NCI60$labs), pch = 19,
     xlab = "Componente Principal 1", ylab = "Componente Principal 2")
```