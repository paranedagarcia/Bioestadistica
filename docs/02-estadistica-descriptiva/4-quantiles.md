---
id: quantiles
title: Quantiles
sidebar_label: "Quantiles"
sidebar_position: 4
---



Los **cuantiles** son valores que dividen una distribución de datos en partes iguales. Un cuantil de orden *q* (donde 0 ≤ q ≤ 1) es el valor por debajo del cual se encuentra el *q*×100% de los datos.

**Ejemplos comunes:**
- **Q1 (cuantil 0.25)**: el 25% de los datos está por debajo de este valor.
- **Q2 (cuantil 0.50)**: la mediana; el 50% de los datos está por debajo.
- **Q3 (cuantil 0.75)**: el 75% de los datos está por debajo de este valor.

**Características principales:**
- Son medidas **no paramétricas** que no asumen normalidad de los datos.
- Ideales para entender la **dispersión y posición** de los datos sin verse afectadas por valores extremos.
- Fundamentales en análisis exploratorio y en la construcción de visualizaciones como boxplots.

### (Q1/Q2/Q3), IQR, Outliers y Boxplots

**Objetivos:**  
1) Calcular **Q1, Q2 (mediana)** y **Q3**.  
2) Obtener el **IQR**.  
3) Identificar **outliers** con la regla de 1.5×IQR.  
4) Visualizar con **boxplots**.  
5) (Opcional) Repetir con **Polars** para datasets grandes.

![boxplot](img/boxplot-1.webp)

## Rango intercuartílico (IQR)

El **rango intercuartílico** (IQR, por sus siglas en inglés), es la distancia entre Q1 y Q3. Se define como una medida de dispersión estadística que cuantifica la variabilidad del 50% central de una distribución. A diferencia de la desviación estándar o el rango total, el IQR es un estimador robusto, lo que significa que su valor no se ve distorsionado por la presencia de observaciones extremas o *outliers*.

### Definición

El IQR es la diferencia numérica entre el tercer cuartil ($Q_3$) y el primer cuartil ($Q_1$) de un conjunto de datos ordenados. Representa la longitud del intervalo que contiene la mitad central de las observaciones.

```math
IQR = Q_3 - Q_1
```

**Significado de sus componentes:**
*   **$Q_1$ (Primer Cuartil o Percentil 25):** Es el valor por debajo del cual se halla el 25% de las observaciones tras ser ordenadas de menor a mayor. Matemáticamente, su posición en una muestra de tamaño $n$ se aproxima mediante la fórmula $0.25(n+1)$.
*   **$Q_3$ (Tercer Cuartil o Percentil 75):** Es el valor que supera al 75% de los datos. Su posición se determina comúnmente como $0.75(n+1)$.
*   **$Q_2$ (Segundo Cuartil o Mediana):** Aunque no interviene directamente en la resta del IQR, divide la muestra en dos mitades iguales (50% superior e inferior) y se ubica en el centro de este rango.

### Implicancia en la Distribución de Datos

El uso del IQR tiene consecuencias críticas para la interpretación clínica y técnica de los datos:

* **Resistencia a Valores Atípicos:** Mientras que el rango total es altamente sensible a un solo dato erróneo o extremo, el IQR permanece invariante ante cambios en el 25% inferior o superior de la muestra. Esto lo hace ideal para variables clínicas con distribuciones asimétricas, como los tiempos de supervivencia o niveles de ciertos biomarcadores.

* **Caracterización de la Asimetría:** La posición de la mediana dentro del IQR revela la forma de la distribución. Si la mediana está más cerca de $Q_1$, los datos presentan una asimetría positiva (hacia la derecha); si está más cerca de $Q_3$, la asimetría es negativa (hacia la izquierda).

* **Unidades de Medida:** Al ser una diferencia de valores originales, el IQR se expresa en las mismas unidades que la variable bajo estudio (ej. mg/dL, mmHg), facilitando la interpretación directa del "ruido" o variabilidad biológica central.

### Aplicaciones en Informática Médica y Visualización

#### A. Identificación Sistemática de Outliers
El IQR es el estándar para definir fronteras de detección de anomalías mediante el método de las "cercas" de Tukey:
*   **Límite Inferior (Cerca inferior):** $Q_1 - 1.5 \times IQR$.
*   **Límite Superior (Cerca superior):** $Q_3 + 1.5 \times IQR$.
Cualquier observación fuera de estos límites se clasifica como un valor atípico o *outlier*. Si la distancia supera los $3 \times IQR$, se considera un valor atípico extremo.

#### B. El Diagrama de Cajas (*Boxplot*)
En herramientas como R o SPSS, el IQR constituye el cuerpo o "caja" central del gráfico. La longitud de la caja visualiza inmediatamente la dispersión del 50% central de los pacientes, permitiendo comparaciones rápidas de variabilidad entre diferentes grupos de tratamiento (ej. grupo control vs. experimental).

#### C. Reporte de Resultados No Paramétricos
En publicaciones científicas, cuando la suposición de normalidad se viola (detectado mediante pruebas como Shapiro-Wilk), el consenso metodológico exige reportar la mediana acompañada del IQR (o de los percentiles 25 y 75) en lugar de la media y la desviación típica.



## Concepto estadístico: cuartil y cuantiles

La función quantile(q=0.25) devuelve el primer cuartil (Q1) de los datos en cada columna (o fila) del DataFrame, usando por defecto el método de interpolación lineal.

Significado: Q1 es el valor por debajo del cual se encuentra el 25% de los datos. Es una medida de posición que nos ayuda a entender la dispersión y la tendencia central de los datos, y es ampliamente usado en estadística para resumir datos y en boxplots para definir el bigote inferior.

:::tip
Si el DataFrame tiene valores faltantes (NaN), por defecto los omitirá en el cálculo, a menos que se especifique lo contrario.
:::

Formalmente:

Q(q)=el valor tal que P(X≤Q(q))=q

Esto significa que el 25% de los valores de la variable son menores o iguales a ese valor, y el 75% son mayores.
Es una medida no paramétrica de tendencia y dispersión, que no depende de supuestos de normalidad.

**En términos prácticos**

Si tienes una serie de datos numéricos, por ejemplo:

```python showLineNumbers
import pandas as pd

s = pd.Series([10, 20, 30, 40, 50])
s.quantile(q=0.25)
```

El resultado será 20.0, porque el 25% de los valores se encuentran por debajo de 20 (en este caso, entre 10 y 20, interpolando si es necesario).

### Métodos de interpolación

La función permite especificar cómo se interpola cuando el cuantil no coincide exactamente con un índice de la muestra.

Por ejemplo:
```python showLineNumbers
df.quantile(0.25, interpolation='linear')
```

Opciones comunes para interpolación:
- 'linear' (por defecto): interpola entre los dos valores más cercanos.
- 'lower': usa el valor más bajo.
- 'higher': usa el valor más alto.
- 'midpoint': promedio de ambos.
- 'nearest': el valor más cercano.

Esto es importante cuando trabajas con muestras pequeñas o datos discretos.

### En el contexto de análisis estadístico

El cuantil del 25% (Q1) es una medida clave:

- Se usa para detectar asimetrías y dispersión.
- Permite calcular el rango intercuartílico (IQR):

IQR=Q3−Q1=quantile(0.75)−quantile(0.25)

- que mide la variabilidad central sin verse afectada por valores extremos.
- En boxplots, Q1 es el límite inferior de la caja.


```python showLineNumbers
# Por columnas (axis=0 - default)
q1_columnas = df_completo.quantile(0.25, axis=0)

# Por filas (axis=1)
q1_filas = df_completo.quantile(0.25, axis=1)
print("Q1 por filas:")
print(q1_filas)
```


## Interpretación y uso analítico

- **Q1 (25%)**: valor bajo el cual cae el 25% de la distribución.  
- **Q2 (50%) / Mediana**: tendencia central robusta.  
- **Q3 (75%)**: límite superior del rango central.  
- **IQR = Q3 - Q1**: variabilidad central sin impacto de outliers.  
- **Outliers** (regla 1.5×IQR): candidatos a revisión (errores, casos especiales, segmentos premium).

### Recomendaciones prácticas (precio/ingreso/metros, etc.)
- IQR alto → alta heterogeneidad del portafolio; segmenta o normaliza.  
- Asimetría (Q3 muy alejado de Q2) → evalúa transformaciones (log) o métricas robustas (mediana, MAD).  
- Outliers frecuentes → valida calidad de datos, caps/winsorization, reglas de negocio.


<br />
#### 📝 Programación:
<Tabs>
  <TabItem value="python3" label="Python" default>
```python showLineNumbers
# Python
import matplotlib.pyplot as plt


```

  </TabItem>
  <TabItem value="r3" label="R" default>
```r showLineNumbers
# R

```

  </TabItem>
</Tabs><br />