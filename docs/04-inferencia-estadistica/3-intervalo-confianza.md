---
id: intervalo-confianza
title: Intervalo de Confianza
sidebar_label: "​Intervalo de Confianza"
sidebar_position: 3
---

# Intervalo de Confianza

La **estimación por intervalos de confianza (IC)** constituye un pilar fundamental de la estadística inferencial. A diferencia de la estimación puntual, que proporciona un único valor numérico (estadístico) para aproximar un parámetro poblacional desconocido, el intervalo de confianza ofrece un rango de valores plausibles dentro del cual se espera que se encuentre dicho parámetro con un nivel de certeza cuantificable.

:::tip
El intervalo de confianza es una técnica de estimación por intervalo.
:::

## Definición

Un intervalo de confianza es una regla para calcular, a partir de datos muestrales, dos números que delimitan un rango en el que se encuentra el valor verdadero del parámetro poblacional con una probabilidad específica denominada **coeficiente de confianza** ($1-\alpha$). Los niveles de confianza más utilizados en la literatura biomédica son 90%, 95% y 99%.

La amplitud del intervalo es un indicador directo de la **precisión** de la estimación: un intervalo estrecho indica una alta precisión, mientras que un intervalo amplio refleja una gran incertidumbre sobre el valor real del parámetro.

### Fundamentación

El fundamento científico del IC reside en el **Teorema del Límite Central (TLC)**, el cual establece que la distribución de muestreo de muchos estimadores (como la media) tiende a la normalidad cuando el tamaño de la muestra ($n$) es suficientemente grande, independientemente de la distribución original de la población.

### La Interpretación Frecuentista
Bajo la perspectiva frecuentista, el parámetro poblacional es una constante fija pero desconocida. El intervalo es el componente aleatorio porque depende de la muestra seleccionada. Por tanto, decir que un IC tiene un nivel de confianza del 95% significa que, si se repitiera el experimento un número infinito de veces y se calculara un IC para cada muestra, el 95% de esos intervalos contendrían el valor real del parámetro poblacional.

#### Estructura General del Intervalo
De forma simplificada, un intervalo de confianza se construye bajo la siguiente estructura:

$$IC = \hat{\theta} \pm (\text{Coeficiente de Confiabilidad} \times \text{Error Típico})$$

Donde:
*   **$\hat{\theta}$**: Es la estimación puntual obtenida de la muestra (ej. media muestral $\bar{x}$ o proporción $\hat{p}$).
*   **Coeficiente de Confiabilidad**: Valor crítico derivado de una distribución de probabilidad (z para normal estándar o t para t-Student) que captura el área central $1-\alpha$.
*   **Error Típico (SE)**: Medida de la variabilidad del estimador, que cuantifica la incertidumbre asociada al salto de la muestra a la población.

## Modelos Específicos en Bioestadística

### A. Intervalo para la Media Poblacional ($\mu$)
Cuando se desconoce la varianza poblacional ($\sigma^2$) y la población es normal o la muestra es grande ($n \ge 30$), se utiliza la distribución **t de Student** con $n-1$ grados de libertad:

```math
\mu = \bar{X} \pm t_{\alpha/2, n-1} \cdot \frac{S}{\sqrt{n}}
```

*Significado de los componentes:*
*   **$\bar{X}$**: Media muestral.
*   **$t_{\alpha/2, n-1}$**: Valor crítico que deja un área $\alpha/2$ en las colas.
*   **$S/\sqrt{n}$**: Error estándar de la media (SEM), donde $S$ es la desviación típica muestral.

### B. Intervalo para una Proporción Poblacional ($p$)
Esencial para variables cualitativas dicotómicas (ej. presencia de enfermedad). Se basa en la aproximación de la distribución binomial a la normal. El intervalo tradicional (Wald) se expresa como:

```math
p = \hat{p} \pm z_{\alpha/2} \sqrt{\frac{\hat{p}(1-\hat{p})}{n}}
```

Investigaciones sugieren que, en muestras pequeñas, el intervalo de Agresti-Coull es más preciso.

### C. Ejemplo para la media poblacional ($\mu$):
En una muestra grande ($n \ge 30$) o con distribución normal y varianza conocida, la fórmula es:

$$\mu = \overline{x} \pm z_{\alpha/2} \cdot \frac{\sigma}{\sqrt{n}}$$

**Significado de sus componentes:**
*   **$\overline{x}$:** Media muestral, obtenida de los datos observados. Es el centro del intervalo.
*   **$z_{\alpha/2}$:** Coeficiente de confiabilidad. Es el valor de la distribución normal estándar que deja un área de $\alpha/2$ en las colas. Para un nivel de confianza del 95%, este valor es aproximadamente **1,96**.
*   **$\sigma$:** Desviación estándar poblacional (si es desconocida, se sustituye por la desviación estándar muestral $s$ en muestras grandes).
*   **$n$:** Tamaño de la muestra. Note que al aumentar $n$, el error típico disminuye, resultando en un intervalo más estrecho y preciso.

## Aplicaciones y Usos

Los intervalos de confianza son herramientas superiores a los p-valores porque integran información sobre la magnitud del efecto y la precisión de los datos. Sus usos principales incluyen:

- **Evaluación de la Significación Clínica**: Permite determinar si un resultado, además de ser estadísticamente significativo (excluir el valor nulo), es clínicamente relevante para el paciente.
 
- **Comparación de Grupos**: En ensayos clínicos, el IC de la diferencia de medias o proporciones permite evaluar si un tratamiento supera a un placebo o control. Si el IC de la diferencia incluye el valor 0, no se puede declarar una diferencia significativa.
   
- **Cálculo del Tamaño Muestral**: Antes de iniciar un estudio, el investigador puede determinar cuántos sujetos necesita para que el IC resultante tenga una precisión (amplitud) determinada.

- **Análisis de Supervivencia**: Estimación de la probabilidad de supervivencia acumulada a lo largo del tiempo mediante el método de Kaplan-Meier, incorporando bandas de confianza que reflejan la incertidumbre debida a datos censurados.

- **Modelos de Regresión**: Estimación de los coeficientes de regresión ($\beta$), proporcionando un rango para el cambio esperado en la variable dependiente ante variaciones en los predictores médicos.


## Interpretación Académica (Perspectiva Frecuentista)

Es un error común interpretar un IC del 95% como que hay un "95% de probabilidad" de que el parámetro esté dentro de ese intervalo específico una vez calculado. Dado que el parámetro poblacional es una constante fija (pero desconocida), el intervalo calculado lo contiene o no lo contiene (probabilidad 0 o 1).

La interpretación correcta es que **el nivel de confianza es una propiedad del método**: si se repitiera el experimento infinitas veces bajo las mismas condiciones y se calculara un IC para cada muestra, el 95% de esos intervalos incluirían el verdadero parámetro poblacional.

<br />
#### 📝 Programación:
<Tabs>
<TabItem value="me" label="Antecedentes" default>
<div class="alert alert--primary">
**Intervalo de confianza:**

**Escenario 1**, con varianza poblacional desconocida: Este es el caso más frecuente en medicina, donde se estima la variabilidad a partir de una muestra. En estas condiciones, se utiliza la distribución t de Student, la cual es más dispersa que la normal para compensar la incertidumbre adicional de estimar la desviación estándar.

**Escenario 2**, Varianza Poblacional Conocida.Este escenario es principalmente teórico o aplicable cuando existe un conocimiento histórico exhaustivo del parámetro de dispersión (ej. calibración de equipos de laboratorio). Se utiliza la distribución Normal Estándar (Z).

</div>
</TabItem>
<TabItem value="me-python" label="Pyhton" default>
```python showLineNumbers
# Implementación en Python
# ------------------------------------------------
# Escenario 1: Varianza Poblacional Desconocida
# ------------------------------------------------

import numpy as np
from scipy import stats

# Datos de ejemplo (ej. niveles de glucosa en mg/dL)
data = [100, 102, 98, 105, 101, 97, 103, 100, 99, 101]
conf_level = 0.95

# Cálculos preliminares
n = len(data)
mean = np.mean(data)
std_err = stats.sem(data)  # Error estándar: s / sqrt(n)

# Determinación del intervalo usando la distribución t
interval_t = stats.t.interval(conf_level, df=n-1, loc=mean, scale=std_err)

print(f"Media muestral: {mean}")
print(f"IC {conf_level*100}% (t-Student): {interval_t}")

# ------------------------------------------------
# Escenario 2: Varianza Poblacional Conocida
# ------------------------------------------------

import numpy as np
from scipy import stats

# Datos de ejemplo
data = [100, 102, 98, 105, 101, 97, 103, 100, 99, 101]
sigma = 2.5  # Desviación estándar poblacional supuesta conocida
conf_level = 0.95

# Cálculos preliminares
n = len(data)
mean = np.mean(data)
std_err_pop = sigma / np.sqrt(n)

# Determinación del intervalo usando la distribución normal (Z)
interval_z = stats.norm.interval(conf_level, loc=mean, scale=std_err_pop)

print(f"Media muestral: {mean}")
print(f"IC {conf_level*100}% (Z-Normal): {interval_z}")
```
</TabItem>
<TabItem value="me-r" label="R" default>
```r showLineNumbers
# Implementación en R
# --- Script de Bioestadística: Cálculo de Intervalos de Confianza ---
# Contexto: Niveles de glucosa en mg/dL de una muestra de pacientes

# 1. Definición del conjunto de datos (Vector)
datos <- c(100, 102, 98, 105, 101, 97, 103, 100, 99, 101)
n <- length(datos) # Tamaño muestral
media_muestral <- mean(datos) # Media aritmética (x̄) 
confianza <- 0.95
alpha <- 1 - confianza

# ------------------------------------------------
# --- ESCENARIO 1: VARIANZA POBLACIONAL DESCONOCIDA ---
# Se utiliza la distribución t de Student con (n-1) grados de libertad 
# ------------------------------------------------

# Cálculo manual paso a paso
desviacion_muestral <- sd(datos) # Desviación típica (s) 
error_estandar <- desviacion_muestral / sqrt(n) # SE = s / √n 
t_critico <- qt(1 - alpha/2, df = n - 1) # Coeficiente de fiabilidad t 

margen_error_t <- t_critico * error_estandar
ic_t_manual <- c(media_muestral - margen_error_t, media_muestral + margen_error_t)

# Implementación directa mediante función de R [14, 15]
prueba_t <- t.test(datos, conf.level = confianza)
ic_t_auto <- prueba_t$conf.int

cat("IC 95% (Varianza desconocida - t):", ic_t_manual, "\n")

# ------------------------------------------------
# --- ESCENARIO 2: VARIANZA POBLACIONAL CONOCIDA ---
# Se utiliza la distribución Normal Estándar (Z) [16-18]
# Supongamos una desviación estándar poblacional histórica (sigma) = 2.5
# ------------------------------------------------

sigma <- 2.5
error_estandar_z <- sigma / sqrt(n)
z_critico <- qnorm(1 - alpha/2) # Coeficiente de fiabilidad Z 

margen_error_z <- z_critico * error_estandar_z
ic_z <- c(media_muestral - margen_error_z, media_muestral + margen_error_z)

cat("IC 95% (Varianza conocida - Z):", ic_z, "\n")
```
</TabItem>
</Tabs><br />