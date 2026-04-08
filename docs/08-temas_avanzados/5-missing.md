---
id: temas-missing
title: Datos faltantes
sidebar_label: "🔸Datos faltantes"
sidebar_position: 4
description: Introducción al manejo de datos faltantes (missing data) y sesgos en investigación
---

El **manejo de datos faltantes** (*missing data*) se define como el conjunto de estrategias metodológicas y computacionales destinadas a abordar la ausencia de observaciones que estaban previstas para su recolección en un diseño de estudio. En sistemas de registros de salud electrónicos (EHR) y ensayos clínicos, los datos faltantes no son la excepción, sino la regla, y su tratamiento inadecuado puede comprometer severamente la validez de las inferencias biostadísticas.

## Marco Conceptual y Taxonomía

Para abordar científicamente este fenómeno, se utiliza la clasificación propuesta por Donald Rubin (1976), la cual se basa en la relación entre el proceso de ausencia y las variables medidas.

Definimos $Y$ como el vector de datos completos, que se particiona en $Y_{obs}$ (datos observados) e $Y_{mis}$ (datos faltantes). Se introduce una variable indicadora $R$ (respuesta), donde $R_{ij}=1$ si el dato es observado y $R_{ij}=0$ si es ausente.

*   **Missing Completely at Random (MCAR):** La probabilidad de que un dato falte es independiente tanto de los valores observados como de los no observados. Matemáticamente: $P(R | Y_{obs}, Y_{mis}, X) = P(R)$. *Ejemplo:* La rotura accidental de un tubo de ensayo en un laboratorio.

*   **Missing at Random (MAR):** La ausencia depende de las variables observadas (covariables o respuestas previas), pero no de los valores faltantes una vez controlado por estas. Matemáticamente: $P(R | Y_{obs}, Y_{mis}, X) = P(R | Y_{obs}, X)$. *Ejemplo:* Los pacientes con menor peso tienen más datos faltantes de sueño porque es más difícil monitorearlos, pero esto no depende de cuánto duermen en realidad.

*   **Not Missing at Random (NMAR/MNAR):** La probabilidad de ausencia depende del valor intrínseco del dato faltante. Se considera un mecanismo **no ignorable**. *Ejemplo:* Pacientes con cuadros de depresión grave que abandonan un ensayo clínico precisamente por su estado clínico no registrado.

## Elementos Esenciales

Un protocolo riguroso debe incluir:
1.  **Identificación y Tabulación:** Uso de funciones diagnósticas (como `is.na()`, `summary()` o `md.pattern()` en R) para cuantificar la magnitud y el patrón (monótono o general) de la ausencia.

2.  **Evaluación del Impacto:** El sesgo ocurre cuando los datos no son MCAR, ya que las estimaciones de los casos observados difieren sistemáticamente de la población real. Además, existe una pérdida de eficiencia (potencia estadística) por la reducción del tamaño muestral efectivo ($n$).

3.  **Análisis de Sensibilidad:** Especialmente ante datos NMAR, para evaluar cómo cambian las conclusiones bajo distintos supuestos sobre los datos no observados.

## Formas de Abordaje

### 🔹Métodos de Eliminación
*   **Análisis de Casos Completos (*Listwise deletion*):** Excluye cualquier unidad que tenga al menos un valor faltante. Solo produce estimadores insesgados si los datos son MCAR. Es ineficiente en modelos multivariados complejos, donde puede descartar la mayor parte de la base de datos.
*   **Análisis de Casos Disponibles:** Utiliza diferentes subconjuntos de datos para diferentes análisis (ej. correlaciones por pares), lo que genera inconsistencias entre los resultados del mismo estudio.

### 🔹Imputación Simple
Sustituye el valor faltante por una estimación única (media, mediana o el valor de un vecino cercano).
*   **Crítica Científica:** Estos métodos subestiman la varianza total y distorsionan las relaciones entre variables, ya que actúan como si el valor imputado fuera una medición cierta, ignorando la incertidumbre del error de predicción.

*   **LOCF (*Last Observation Carried Forward*):** Común en estudios longitudinales; asume que el estado del paciente permanece constante tras el abandono. Es un método obsoleto que introduce sesgos impredecibles en las tendencias temporales.

### 🔹Imputación Múltiple
La imputación multiple  MI y MICE, es el estándar de oro actual para problemas complejos bajo el supuesto MAR. Consiste en tres fases:
1.  **Imputación:** Se crean $m$ datasets (típicamente entre 5 y 50) donde los valores faltantes se reemplazan por sorteos aleatorios de una distribución predictiva.
2.  **Análisis:** Se aplica el modelo estadístico deseado a cada uno de los $m$ datasets de forma independiente.
3.  **Combinación (*Pooling*):** Se integran los resultados mediante las **Reglas de Rubin**.

**Marco Matemático de Combinación (Reglas de Rubin):**
El estimador combinado ($\hat{\beta}^{MI}$) es el promedio de las estimaciones individuales:

```math
\hat{\beta}^{MI} = \frac{1}{m} \sum_{k=1}^{m} \hat{\beta}^{(k)}
```

La varianza total ($V^{MI}$) combina la variabilidad dentro de las imputaciones ($\overline{V}$) y entre ellas ($B$):

```math
V^{MI} = \overline{V} + \left(1 + \frac{1}{m}\right)B
```

Donde:
*   $\overline{V}$: Variabilidad debida al error de muestreo habitual.
*   $B$: Variabilidad debida a la incertidumbre de los datos faltantes.

El método **MICE** (*Multivariate Imputation by Chained Equations*) o Especificación Condicional Completa (FCS) es una implementación flexible de la MI que utiliza una serie de ecuaciones de regresión univariadas (lineal para continuas, logística para binarias) para imputar variables de distinta naturaleza simultáneamente.

### 🔹Métodos Basados en Verosimilitud
Utilizan el algoritmo de **Esperanza-Maximización (EM)** para estimar parámetros poblacionales maximizando la función de verosimilitud de los datos observados, integrando los datos faltantes como parte del proceso de optimización.

El algoritmo **Esperanza-Maximización (EM)** representa el estándar de oro para obtener estimadores de máxima verosimilitud (MLE) en presencia de datos faltantes o variables latentes. Fue formalizado en 1977 por Dempster, Laird y Rubin, transformando problemas de optimización numéricamente complejos en procesos iterativos manejables.

#### Definición 
El algoritmo EM es un procedimiento iterativo que busca encontrar el valor del parámetro $\theta$ que maximiza la función de verosimilitud de los datos observados. La premisa fundamental es que, si se conocieran los datos faltantes, la maximización de la verosimilitud sería trivial; por lo tanto, el algoritmo alterna entre estimar esos datos y maximizar la verosimilitud resultante.

Definimos:
*   $X^{obs}$: El conjunto de datos realmente observados.
*   $X^{mis}$: Los datos previstos en el diseño pero no recolectados (datos faltantes).
*   $X^c = \{X^{obs}, X^{mis}\}$: Los "datos completos".

#### Fundamento Matemático: Las Dos Etapas
El rigor del algoritmo reside en su capacidad para garantizar que cada iteración aumente (o al menos no disminuya) la verosimilitud de los datos. El proceso se divide en dos pasos críticos:

#### A. Paso E (Expectation / Esperanza)
En esta fase, se calcula la esperanza de la función de log-verosimilitud de los datos completos, condicionada a los datos observados y al valor actual de los parámetros $\hat{\theta}^{(t)}$. 

Matemáticamente, se define la función $Q$:

```math
Q(\theta | \hat{\theta}^{(t)}) = E[\ln L(\theta | X^c) | X^{obs}, \hat{\theta}^{(t)}]
```

En términos prácticos, esto equivale a "rellenar" los huecos en la base de datos utilizando sus medias condicionales basadas en la información disponible. Por ejemplo, si los datos siguen una distribución normal multivariante, el paso E predice los valores faltantes mediante una regresión lineal de las variables ausentes sobre las observadas.

#### B. Paso M (Maximization / Maximización)
En esta fase, se determinan los nuevos valores de los parámetros $\hat{\theta}^{(t+1)}$ que maximizan la función $Q$ calculada en el paso anterior:

```math
\hat{\theta}^{(t+1)} = \text{arg max}_{\theta} Q(\theta | \hat{\theta}^{(t)})
```

Este nuevo estimador se convierte en el punto de partida para la siguiente iteración. El proceso se repite hasta que la diferencia entre $\hat{\theta}^{(t)}$ y $\hat{\theta}^{(t+1)}$ es menor que un umbral de convergencia predefinido (ej. $1.0 \times 10^{-5}$).

### 🔹Implementación en el Ámbito Médico
La implementación del algoritmo EM es ubicua en diversas subdisciplinas de la salud:

1.  **Genética Médica y Bioinformática (Estimación de Haplotipos):** Dado que los genotipos observados son a menudo ambiguos respecto a la fase cromosómica, el EM se utiliza para estimar las frecuencias de los haplotipos en la población. Aquí, los genotipos son $X^{obs}$ y la alineación de nucleótidos en los cromosomas (haplotipos) son $X^{mis}$. El algoritmo promedia todas las resoluciones posibles de los datos faltantes ponderándolas por su probabilidad posterior.

2.  **Modelos de Riesgos y Supervivencia:** En estudios longitudinales de cáncer o SIDA, se emplea para ajustar modelos conjuntos que vinculan el tiempo hasta un evento (muerte/recaída) con biomarcadores medidos repetidamente, tratando los efectos aleatorios como datos faltantes.

3.  **Investigación Clínica (EHR):** Se utiliza para estimar medias y matrices de covarianza en bases de datos hospitalarias con valores ausentes bajo el supuesto de que los datos son *Missing at Random* (MAR).

### 🔹Relación con Otras Metodologías
Es vital distinguir el EM de la **Imputación Múltiple (MI)**. Mientras que el EM proporciona una estimación puntual única (el MLE) y a menudo requiere métodos adicionales (como el de Louis) para calcular la varianza, la MI reconoce explícitamente la incertidumbre mediante la creación de múltiples datasets simulados. No obstante, algoritmos como el de **Aumentación de Datos (DA)** son versiones estocásticas de MCMC que actúan como un análogo bayesiano del EM.

<br />
#### 📝 Programación:
<Tabs>
<TabItem value="python" label="Pyhton" default>
```python showLineNumbers
# Implementación en Python
# ----------------------------------------------------------
# 1. Análisis de Casos Completos (Listwise Deletion)
# ----------------------------------------------------------
import pandas as pd

# Carga de datos con marcadores de valores ausentes (ej. '?')
data = pd.read_csv('clinica.csv', na_values=["?"]) # [5]

# Identificación de la magnitud de datos ausentes
print(data.isna().sum()) # [6, 7]

# Eliminación de filas con NaN en variables críticas
variables_estudio = ['edad', 'glucosa', 'presion_arterial']
df_limpio = data.dropna(subset=variables_estudio) # [8, 9]

# ----------------------------------------------------------
# 2. Imputación Simple (Media o Mediana)
# ----------------------------------------------------------

from sklearn.impute import SimpleImputer
import numpy as np

# Configuración del imputador para usar la media
imputador_media = SimpleImputer(strategy='mean') # [10, 11]

# Aplicación sobre variables numéricas
X_num = data[['colesterol', 'bmi']]
X_imputado = imputador_media.fit_transform(X_num)

# ----------------------------------------------------------
# 3. Imputación Determinística por Regresión
# ----------------------------------------------------------

import statsmodels.formula.api as smf

# Ajuste del modelo con casos completos
modelo = smf.ols(formula='glucosa ~ bmi + edad', data=data).fit() # [15]

# Predicción de valores ausentes
predicciones = modelo.predict(data[data['glucosa'].isna()])

# Sustitución determinística
data.loc[data['glucosa'].isna(), 'glucosa'] = predicciones

# ----------------------------------------------------------
# 4. Imputación Multivariada por Ecuaciones Encadenadas (MICE)
# ----------------------------------------------------------

from sklearn.experimental import enable_iterative_imputer # Requerido para IterativeImputer
from sklearn.impute import IterativeImputer

# En Python, IterativeImputer implementa la lógica de MICE/FCS
imputador_mice = IterativeImputer(max_iter=10, random_state=42) # [20, 21]

# Imputación de un dataset clínico complejo
dataset_completo = imputador_mice.fit_transform(data)

# ----------------------------------------------------------
# 5. Imputación por Vecinos Más Cercanos (KNN)
# ----------------------------------------------------------
# Este método utiliza métricas de distancia (como la distancia Euclídea) 
# para encontrar las k unidades de observación más similares ("donantes") 
# a la unidad con el valor faltante, promediando sus valores observados 
# para realizar la imputación

from sklearn.impute import KNNImputer

# Imputación basada en los 5 vecinos más similares
imputador_knn = KNNImputer(n_neighbors=5, weights="distance") # [23, 25]

# Es fundamental que los datos estén escalados previamente para KNN
dataset_knn = imputador_knn.fit_transform(data)

```
</TabItem>
<TabItem value="r" label="R" default>
```r showLineNumbers
# Implementación en R
# ----------------------------------------------------------
#1. Análisis de Casos Completos (Listwise Deletion)
# ----------------------------------------------------------
# Procedimiento por defecto en muchas funciones de modelado (como lm()), 
# donde se excluyen todas las unidades que presentan al menos un valor ausente 
# en cualquiera de sus variables. Es válido únicamente bajo el supuesto de que los 
# datos faltan de forma completamente aleatoria (MCAR)
#
# Creación de un dataset clínico hipotético
pacientes <- data.frame(
  id = 1:5,
  edad = c(45, 52, NA, 39, 61),
  glucosa = c(95, NA, 110, 105, 120),
  sexo = factor(c("M", "F", "F", "M", NA))
)

# Eliminación de filas con cualquier NA
datos_limpios <- na.omit(pacientes) 
print(datos_limpios)

# ----------------------------------------------------------
# 2. Imputación Simple Estocástica y No Estocástica
# ----------------------------------------------------------

# Imputación por la Media
media_glucosa <- mean(pacientes$glucosa, na.rm = TRUE) 
pacientes$glucosa[is.na(pacientes$glucosa)] <- media_glucosa

#  Imputación por el valor más frecuente (Moda)
library(randomForest)
pacientes_imputados <- na.roughfix(pacientes) 

# ----------------------------------------------------------
# Imputación por Regresión (Simple)
# ----------------------------------------------------------
# Se basa en la premisa de que los valores ausentes pueden ser predichos 
# a partir de otras variables observadas mediante un modelo lineal

# Estimación de edad basada en glucosa para el caso ausente
modelo_reg <- lm(edad ~ glucosa, data = pacientes, subset = !is.na(edad)) 
prediccion <- predict(modelo_reg, newdata = pacientes[is.na(pacientes$edad), ]) 

# Imputación determinística
pacientes$edad[is.na(pacientes$edad)] <- prediccion

# ----------------------------------------------------------
# ILast Observation Carried Forward (LOCF)
# ----------------------------------------------------------
# Consiste en reemplazar un dato faltante con la última observación 
# válida registrada para ese mismo paciente
# El LOCF no se basa en principios estadísticos sólidos y puede sesgar los resultados de eficacia

# Ejemplo conceptual usando la lógica de seguimiento longitudinal
# Se asume que el valor de la visita anterior se proyecta a la actual

library(zoo) # Paquete común para manejar series temporales
paciente_seguimiento <- c(120, 118, NA, 115, NA)
locf_resultado <- na.locf(paciente_seguimiento)

# ----------------------------------------------------------
# Imputación Múltiple por Ecuaciones Encadenadas (MICE)
# ----------------------------------------------------------

# Implementación con Regresión Lineal y Random Forest
library(mice)

# 1. Generación de m imputaciones (m=5 por defecto)
# El método 'pmm' (Predictive Mean Matching) es versátil para datos continuos [40-42]
imputacion_multiple <- mice(pacientes, m = 5, method = 'pmm', seed = 1234) 

# 2. Realización del análisis estadístico en cada dataset imputado
modelo_fit <- with(imputacion_multiple, lm(glucosa ~ edad + sexo)) 

# 3. Combinación (Pooling) de resultados
resultados_finales <- pool(modelo_fit) # [39, 47, 48]
summary(resultados_finales)

# 4. Extracción de un dataset completo específico (ej. el tercero)
dataset_completo <- complete(imputacion_multiple, 3)

# Para datos con estructuras complejas o interacciones no lineales, 
# se puede especificar el método de Bosques Aleatorios (rf), 
# el cual es altamente eficiente pero computacionalmente más costoso

# Imputación múltiple usando Random Forest
imp_rf <- mice(pacientes, method = "rf", ntree = 100)
```
</TabItem>
</Tabs>