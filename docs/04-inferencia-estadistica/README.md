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

Para un investigador, es fundamental distinguir entre el **estimador puntual** y la **estimación puntual**:

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

En el marco de la bioestadística avanzada, la **estimación puntual bayesiana** representa un cambio de paradigma respecto a la inferencia frecuentista tradicional. Mientras que el enfoque clásico asume que los parámetros poblacionales ($\theta$) son constantes fijas y desconocidas, el enfoque bayesiano los trata como **variables aleatorias**. Esta metodología permite integrar formalmente el conocimiento clínico previo o la evidencia histórica con los datos observados actualmente para reducir la incertidumbre en la toma de decisiones.

#### Fundamentación Teórica: El Teorema de Bayes

La base de la estimación bayesiana es la obtención de la **distribución a posteriori**, la cual actualiza nuestras creencias iniciales tras observar la evidencia empírica. Matemáticamente, se expresa mediante el Teorema de Bayes:

```math
P(\theta|y) = \frac{L(y|\theta) \cdot P(\theta)}{P(y)} \propto L(y|\theta) \cdot P(\theta)
```

**Significado de sus componentes:**
*   **$P(\theta|y)$ (Posteriori):** Representa la distribución de probabilidad del parámetro $\theta$ condicionada a los datos observados $y$.
*   **$L(y|\theta)$ (Verosimilitud o Likelihood):** Es la probabilidad de observar los datos $y$ bajo un valor específico de $\theta$.
*   **$P(\theta)$ (Prior o Probabilidad a Priori):** Cuantifica el conocimiento o incertidumbre sobre el parámetro antes de recolectar nuevos datos (ej. prevalencia conocida o resultados de ensayos previos).
*   **$P(y)$ (Probabilidad Marginal):** Actúa como una constante de normalización para asegurar que la integral de la posteriori sea igual a 1.

#### Métodos de Estimación Puntual con Bayes

En la inferencia bayesiana, una "estimación puntual" consiste en extraer un único valor representativo de la distribución a posteriori. Los estimadores más utilizados son:

##### Media a Posteriori (Esperanza Matemática)
Es el estimador más común y representa el centro de gravedad de la distribución. Se calcula como:

```math
E[\theta|y] = \int \theta \cdot p(\theta|y) d\theta
```

En la práctica, este estimador suele comportarse como un **promedio ponderado** entre la información previa y la media observada en la muestra.

##### Moda a Posteriori o Máximo a Posteriori (MAP)
Representa el valor más probable dentro de la distribución a posteriori. Es el valor que maximiza la función de densidad posterior:

```math
\hat{\theta}_{MAP} = \text{arg max}_{\theta} [L(y|\theta) \cdot P(\theta)]
```

Es particularmente útil cuando se trabaja con distribuciones asimétricas donde la media no representa el pico de probabilidad.

##### Mediana a Posteriori
Es el valor que divide la masa de probabilidad de la posteriori en dos partes iguales (50% de cada lado). Se prefiere cuando la distribución tiene "colas pesadas" o valores extremos que podrían sesgar la media.

---

#### Ejemplo Aplicado: Estimación de la Media Poblacional

Supongamos que un informático médico desea estimar la media de un parámetro fisiológico ($\mu$) basándose en una muestra pequeña ($n=10$) donde se observó un promedio de $\bar{y} = 0.75$. Se conoce por estudios previos que la varianza poblacional es $\sigma^2 = 4$.

**Configuración del modelo:**
*   **Prior:** Se asume una distribución normal con media $\mu_0 = 0$ y varianza $\sigma_0^2 = 1$ (basado en literatura previa).
*   **Datos:** $n=10$, $\bar{y} = 0.75$, $\sigma^2 = 4$.

La **Estimación Puntual (Media Bayesiana)** se calcula ponderando la precisión (el inverso de la varianza):
```math
\hat{\mu}_{Bayes} = \frac{(\frac{n}{\sigma^2})\bar{y} + (\frac{1}{\sigma_0^2})\mu_0}{\frac{n}{\sigma^2} + \frac{1}{\sigma_0^2}} = \frac{(\frac{10}{4}) \cdot 0.75 + (1) \cdot 0}{\frac{10}{4} + 1} = \frac{1.875}{3.5} \approx 0.536
```

**Interpretación Técnica:** El estimador bayesiano (0.536) se sitúa entre el valor a priori (0) y el valor observado (0.75). A medida que el tamaño de la muestra ($n$) aumenta, el peso de la información previa disminuye y la estimación converge hacia el resultado empírico (verosimilitud).

#### Consideraciones Computacionales (MCMC)

En modelos médicos complejos (como la genética estadística o ensayos multicéntricos), las integrales necesarias para obtener la media a posteriori no tienen una solución analítica sencilla. En estos casos, la informática recurre a algoritmos de **Cadenas de Markov Monte Carlo (MCMC)** y **muestreo de Gibbs**. Estos métodos generan miles de muestras simuladas de la posteriori, permitiendo obtener la estimación puntual simplemente calculando el promedio o la moda de los valores simulados.

