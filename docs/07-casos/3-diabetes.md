---
id: caso-diabetes
title: Análisis de diabetes
sidebar_label: Diabetes
sidebar_position: 3
---


## Modelado de Probabilidad de Eventos Dicotómicos (Regresión Logística)
**Problema:** En epidemiología clínica, es vital predecir la probabilidad de presencia de una enfermedad (ej. diabetes) basada en factores de riesgo continuos como el Índice de Masa Corporal (IMC).

**Planteamiento Matemático:** Se utiliza la función *logit* para vincular la probabilidad $\pi$ con un predictor lineal:

``math
logit(\pi) = \ln\left(\frac{\pi}{1-\pi}\right) = \beta_0 + \beta_1X_1
```

Donde $\pi$ es el valor esperado del desenlace binario y $\beta_1$ representa el efecto del IMC sobre el logaritmo de la *odds* de padecer la enfermedad,.

**Ejemplo en R:**
```r
# Carga de datos de pacientes Pima (Diabetes)
library(faraway)
data(pima)

# Ajuste del Modelo Lineal Generalizado (GLM) con vínculo binomial
modelo_logit <- glm(test ~ bmi, family = binomial, data = pima)

# Resumen del modelo e interpretación de coeficientes
summary(modelo_logit)
# Predicción de probabilidad para un IMC de 35
predict(modelo_logit, data.frame(bmi = 35), type = "response")
```
