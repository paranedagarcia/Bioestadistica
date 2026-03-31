---
id: intervalo-confianza
title: Intervalo de Confianza
sidebar_label: 🔹​Intervalo de Confianza
sidebar_position: 3
---

# Intervalo de Confianza

La **estimación por intervalos de confianza (IC)** constituye un pilar fundamental de la estadística inferencial. A diferencia de la estimación puntual, que proporciona un único valor numérico (estadístico) para aproximar un parámetro poblacional desconocido, el intervalo de confianza ofrece un rango de valores plausibles dentro del cual se espera que se encuentre dicho parámetro con un nivel de certeza cuantificable.

### 1. Definición

Un intervalo de confianza es una regla para calcular, a partir de datos muestrales, dos números que delimitan un rango en el que se encuentra el valor verdadero del parámetro poblacional con una probabilidad específica denominada **coeficiente de confianza** ($1-\alpha$). Los niveles de confianza más utilizados en la literatura biomédica son 90%, 95% y 99%.

La amplitud del intervalo es un indicador directo de la **precisión** de la estimación: un intervalo estrecho indica una alta precisión, mientras que un intervalo amplio refleja una gran incertidumbre sobre el valor real del parámetro.

### 2. Fundamentación

El fundamento científico del IC reside en el **Teorema del Límite Central (TLC)**, el cual establece que la distribución de muestreo de muchos estimadores (como la media) tiende a la normalidad cuando el tamaño de la muestra ($n$) es suficientemente grande, independientemente de la distribución original de la población.

#### La Interpretación Frecuentista
Bajo la perspectiva frecuentista, el parámetro poblacional es una constante fija pero desconocida. El intervalo es el componente aleatorio porque depende de la muestra seleccionada. Por tanto, decir que un IC tiene un nivel de confianza del 95% significa que, si se repitiera el experimento un número infinito de veces y se calculara un IC para cada muestra, el 95% de esos intervalos contendrían el valor real del parámetro poblacional.

#### Estructura General del Intervalo
De forma simplificada, un intervalo de confianza se construye bajo la siguiente estructura:

$$IC = \hat{\theta} \pm (\text{Coeficiente de Confiabilidad} \times \text{Error Típico})$$

Donde:
*   **$\hat{\theta}$**: Es la estimación puntual obtenida de la muestra (ej. media muestral $\bar{x}$ o proporción $\hat{p}$).
*   **Coeficiente de Confiabilidad**: Valor crítico derivado de una distribución de probabilidad (z para normal estándar o t para t-Student) que captura el área central $1-\alpha$.
*   **Error Típico (SE)**: Medida de la variabilidad del estimador, que cuantifica la incertidumbre asociada al salto de la muestra a la población.

### 3. Modelos Específicos en Bioestadística

#### A. Intervalo para la Media Poblacional ($\mu$)
Cuando se desconoce la varianza poblacional ($\sigma^2$) y la población es normal o la muestra es grande ($n \ge 30$), se utiliza la distribución **t de Student** con $n-1$ grados de libertad:

```math
\mu = \bar{X} \pm t_{\alpha/2, n-1} \cdot \frac{S}{\sqrt{n}}
```

*Significado de los componentes:*
*   **$\bar{X}$**: Media muestral.
*   **$t_{\alpha/2, n-1}$**: Valor crítico que deja un área $\alpha/2$ en las colas.
*   **$S/\sqrt{n}$**: Error estándar de la media (SEM), donde $S$ es la desviación típica muestral.

#### B. Intervalo para una Proporción Poblacional ($p$)
Esencial para variables cualitativas dicotómicas (ej. presencia de enfermedad). Se basa en la aproximación de la distribución binomial a la normal. El intervalo tradicional (Wald) se expresa como:

```math
p = \hat{p} \pm z_{\alpha/2} \sqrt{\frac{\hat{p}(1-\hat{p})}{n}}
```

Investigaciones sugieren que, en muestras pequeñas, el intervalo de Agresti-Coull es más preciso.

### 4. Aplicaciones y Usos en Informática Médica

Los intervalos de confianza son herramientas superiores a los p-valores porque integran información sobre la magnitud del efecto y la precisión de los datos. Sus usos principales incluyen:

**Evaluación de la Significación Clínica**: Permite determinar si un resultado, además de ser estadísticamente significativo (excluir el valor nulo), es clínicamente relevante para el paciente.
 
**Comparación de Grupos**: En ensayos clínicos, el IC de la diferencia de medias o proporciones permite evaluar si un tratamiento supera a un placebo o control. Si el IC de la diferencia incluye el valor 0, no se puede declarar una diferencia significativa.
   
**Cálculo del Tamaño Muestral**: Antes de iniciar un estudio, el investigador puede determinar cuántos sujetos necesita para que el IC resultante tenga una precisión (amplitud) determinada.

**Análisis de Supervivencia**: Estimación de la probabilidad de supervivencia acumulada a lo largo del tiempo mediante el método de Kaplan-Meier, incorporando bandas de confianza que reflejan la incertidumbre debida a datos censurados.

**Modelos de Regresión**: Estimación de los coeficientes de regresión ($\beta$), proporcionando un rango para el cambio esperado en la variable dependiente ante variaciones en los predictores médicos.

***

## Distribución normal

### Varianza conocida

### Intervalo para media

### Intervalo de confianza para varianza

### Estimación del tamaño muestral

## Variables dicotómicas