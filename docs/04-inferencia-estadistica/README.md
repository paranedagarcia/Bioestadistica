---
id: inferencia-estadistica
title: Inferencia Estadística
sidebar_label: "​Inferencia Estadística"
sidebar_position: 1
---

# Inferencia Estadística

La **inferencia estadística** es la rama de la estadística que utiliza información de una **muestra** para realizar deducciones sobre los parámetros y características de una **población**. Permite generalizar hallazgos desde datos limitados hacia universos más amplios mediante métodos probabilísticos rigurosos.

## Componentes Principales

### 1. Estimación de Parámetros
Proceso de determinar valores aproximados de características poblacionales desconocidas:
- **Estimación puntual**: Un único valor como aproximación del parámetro (ej: media muestral como estimador de la media poblacional)
- **Estimación por intervalos**: Rango de valores que probablemente contiene el parámetro con cierto nivel de confianza

### 2. Pruebas de Hipótesis
Metodología para evaluar afirmaciones sobre parámetros poblacionales:
- Formulación de hipótesis nula (H₀) e hipótesis alternativa (H₁)
- Cálculo de estadísticos de prueba
- Determinación de p-valores y toma de decisiones estadísticas

## Fundamentos Teóricos

La inferencia se sustenta en:
- **Teoría de probabilidades**: Base matemática para cuantificar incertidumbre
- **Distribuciones muestrales**: Comportamiento de estadísticos cuando se extraen múltiples muestras
- **Teorema del Límite Central**: Permite aproximaciones normales para muestras grandes

## Supuestos y Limitaciones

- Requiere **muestras representativas** obtenidas mediante selección aleatoria
- La validez depende del cumplimiento de **supuestos distribucionales**
- Existe inherente **margen de error** expresado mediante intervalos de confianza y niveles de significancia

<br />


## Estimación Puntual

La **estimación puntual** es una rama de la inferencia estadística que tiene como objetivo asignar un único valor numérico —calculado a partir de datos muestrales— como la mejor aproximación posible para un parámetro poblacional desconocido.

![estimacion](img/estimacion.png)

### 1. Definición y Marco Conceptual

Para un investigador de postgrado, es fundamental distinguir entre el **estimador puntual** y la **estimación puntual**:

*   **Estimador puntual ($\hat{\Theta}$):** Es una estadística, es decir, una función o regla matemática aplicada a las variables aleatorias de la muestra ($X_1, X_2, \dots, X_n$). Al ser función de variables aleatorias, el estimador es, en sí mismo, una variable aleatoria con su propia distribución muestral.
*   **Estimación puntual ($\hat{\theta}$):** Es el valor numérico específico que toma el estimador una vez que se han recolectado los datos y se ha seleccionado la muestra.

**Notación general:**
Si $\theta$ es el parámetro de interés (ej. la media poblacional $\mu$), el estimador se denota comúnmente como $\hat{\theta}$.

---

### 2. Propiedades de un Buen Estimador

Dado que pueden existir múltiples estadísticos para aproximar un mismo parámetro, la teoría estadística define propiedades críticas para seleccionar el "mejor" estimador:

#### A. Insesgamiento (Unbiasedness)
Se dice que un estimador es insesgado si el valor esperado de su distribución muestral coincide con el verdadero valor del parámetro poblacional.
*   **Fórmula:** $E(\hat{\theta}) = \theta$
*   **Ejemplo:** La media muestral $\overline{X}$ es un estimador insesgado de la media poblacional $\mu$. Por el contrario, la varianza muestral calculada con divisor $n$ es sesgada; para corregirlo y obtener un estimador insesgado, se utiliza la cuasivarianza muestral ($s^2$) con divisor $n-1$.

#### B. Eficiencia (Efficiency / Variancia Mínima)
Entre dos estimadores insesgados, el más eficiente es aquel que presenta la menor varianza (dispersión) en su distribución muestral. Un estimador con varianza mínima asegura que, en muestreos repetidos, los valores estimados tiendan a agruparse más cerca del parámetro real.

#### C. Consistencia (Consistency)
Un estimador es consistente si, a medida que el tamaño de la muestra ($n$) aumenta indefinidamente, el valor estimado converge en probabilidad hacia el verdadero parámetro. Esto implica que la varianza del estimador tiende a cero cuando $n \to \infty$.

#### D. Suficiencia (Sufficiency)
Un estimador es suficiente si utiliza toda la información relevante contenida en la muestra para estimar el parámetro, sin que ningún otro estadístico pueda aportar información adicional.

---

### 3. Métodos de Estimación Puntual

Existen diversos procedimientos algorítmicos para derivar estimadores con las propiedades antes mencionadas:

#### A. Método de Máxima Verosimilitud (MLE)
Es el método más utilizado debido a sus excelentes propiedades asintóticas (consistencia y eficiencia). Consiste en encontrar el valor del parámetro $\theta$ que maximiza la **función de verosimilitud**, la cual representa la probabilidad (o densidad) de observar los datos actuales dada una distribución teórica.
*   **Lógica:** $\hat{\theta}_{MV}$ es el valor que hace que la muestra observada sea "lo más probable posible".

#### B. Método de los Momentos
Este método iguala los momentos poblacionales (valores esperados teóricos) con los correspondientes momentos muestrales calculados a partir de los datos.
*   **Ejemplo:** Para estimar $\mu$, igualamos el primer momento poblacional $E(X)$ con el primer momento muestral $\frac{1}{n} \sum X_i$, lo que resulta en $\hat{\mu} = \overline{X}$.

#### C. Método de Mínimos Cuadrados (LSE)
Ampliamente utilizado en modelos de regresión, este método busca estimar los parámetros minimizando la suma de los cuadrados de las diferencias (residuos) entre los valores observados ($y_i$) y los valores predichos por el modelo ($\hat{y}_i$).
*   **Fórmula de minimización:** $\sum_{i=1}^{n} (y_i - \hat{y}_i)^2 = \text{mínimo}$.

#### D. Enfoque Bayesiano
A diferencia de los métodos clásicos (frecuentistas), este enfoque considera al parámetro $\theta$ como una variable aleatoria e incorpora conocimiento previo (distribución *a priori*) que se actualiza con la evidencia de la muestra para obtener una distribución *a posteriori*.

