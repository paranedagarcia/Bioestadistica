---
id: estadistica-descriptiva
title: Principios estadísticos 
sidebar_label: "🔸Principios estadísticos"
sidebar_position: 1
---


## La Estadística Descriptiva
*Conociendo tus datos*

Antes de poder realizar análisis complejos o construir modelos sofisticados, se debe comenzar por comprender y describir las características de los datos con los que trabaja. Esta tarea inicial es abordada por la **estadística descriptiva**, una rama de la estadística enfocada en la recopilación, organización, resumen y presentación de datos numéricos para identificar sus rasgos principales. 

Su propósito fundamental es simplificar grandes volúmenes de información en un conjunto de métricas y representaciones gráficas manejables que revelen patrones, tendencias y anomalías. En el contexto de la ciencia de datos, este primer paso es crucial porque un modelo entrenado sobre datos mal comprendidos producirá resultados erróneos, independientemente de su complejidad. La estadística descriptiva no busca hacer inferencias sobre una población más grande; simplemente describe los datos disponibles.


Para el investigador, este proceso permite transformar registros crudos de bases de datos hospitalarias en información estructurada, facilitando la detección de patrones clínicos, errores de captura (*outliers*) y la caracterización de cohortes de pacientes.

### 1. Marco Conceptual: Población, Muestra y Unidades
En estadística descriptiva, el análisis recae sobre una **población** (conjunto total de interés, denotado por $N$) o una **muestra** (subconjunto representativo, denotado por $n$). La entidad mínima de información es la **unidad experimental** (o caso), que en nuestro ámbito suele ser el paciente, pero también puede ser un registro de laboratorio, una imagen médica o un evento vital.

### 2. Taxonomía de las Variables
La naturaleza del análisis descriptivo está rígidamente determinada por el tipo de variable en estudio:

*   **Variables Cualitativas (Categóricas):** Representan atributos o cualidades. Pueden ser **nominales** (sin orden intrínseco, como el grupo sanguíneo) u **ordinales** (con jerarquía clínica, como los estadios de una neoplasia).
*   **Variables Cuantitativas (Numéricas):** Representan cantidades. Se dividen en **discretas** (conteos enteros, como el número de cirugías) y **continuas** (mediciones en un intervalo real, como la concentración de creatinina).

### 3. Organización Tabular: Distribuciones de Frecuencia
El primer paso para reducir la complejidad de los datos es la **Tabla de Distribución de Frecuencias (TDF)**. Esto permite resumir grandes volúmenes de datos en estructuras compactas que incluyen,,,:
*   **Frecuencia Absoluta ($f_i$):** Número de veces que aparece un valor.
*   **Frecuencia Relativa ($h_i$):** Proporción del total ($f_i / n$).
*   **Frecuencia Acumulada ($F_i$):** Suma progresiva de frecuencias, vital para determinar percentiles clínicos.

### 4. Medidas de Tendencia Central
Buscan identificar el valor "típico" o el centro de gravedad de la distribución.
*   **Media Aritmética ($\overline{x}$):** Es el promedio calculado como:
    ```math
    \overline{x} = \frac{\sum_{i=1}^{n} x_i}{n}
    ```
    *Donde $x_i$ representa cada observación individual y $n$ el tamaño de la muestra.*
*   **Mediana ($Me$):** El valor que divide al conjunto de datos ordenados en dos partes iguales (percentil 50).
*   **Moda ($Mo$):** El valor o categoría clínica con mayor frecuencia.

### 5. Medidas de Dispersión o Variabilidad
En salud, la media por sí sola es insuficiente; necesitamos cuantificar cuán diversos son los pacientes entre sí (el "ruido" biológico).
*   **Varianza Muestral ($s^2$):** Promedio de las desviaciones al cuadrado respecto a la media.
    ```math
    s^2 = \frac{\sum_{i=1}^{n} (x_i - \overline{x})^2}{n - 1}
    ```
    *El uso de $n-1$ (grados de libertad) corrige la subestimación de la variabilidad poblacional.*
*   **Desviación Estándar ($s$):** Raíz cuadrada de la varianza, que devuelve la medida a las unidades originales de la variable (ej. mg/dL).
*   **Coeficiente de Variación ($CV$):** Medida adimensional de dispersión relativa:
    $$CV = \frac{s}{|\overline{x}|} \times 100$$
    *Permite comparar la variabilidad de magnitudes diferentes, como peso vs. altura.*

### 6. Medidas de Forma: Asimetría y Curtosis
Permiten describir la morfología de la distribución en comparación con el modelo normal (Gaussiano),,.
*   **Sesgo (Skewness):** Indica si los datos se concentran en valores bajos (sesgo positivo) o altos (sesgo negativo).
*   **Curtosis (Kurtosis):** Mide el grado de apuntamiento o "achatamiento" de la curva (leptocúrtica, mesocúrtica o platicúrtica).

### 7. Representación Gráfica e Informática
En la era de la visualización de datos, las gráficas no solo ilustran, sino que diagnostican la calidad de la información,. Los elementos esenciales incluyen:
*   **Histogramas:** Para evaluar la distribución de variables continuas.
*   **Gráficos de Cajas (Box-plots):** Herramienta fundamental para visualizar la mediana, los cuartiles y detectar **outliers** (valores atípicos que pueden indicar errores de sensor o casos clínicos raros).
