---
id: markov
title: Modelo de Markov
sidebar_label: "​Modelo de Markov"
sidebar_position: 9
---

# Modelo de Markov

Este documento proporciona una descripción científica y técnica del **modelo de Markov** y las **cadenas de Markov**, integrando los fundamentos matemáticos necesarios y ejemplos prácticos en Python utilizando conjuntos de datos reales.

<br />

## El Modelo de Markov y las Cadenas de Markov

### 1. Definición y Propiedad de Markov
Una **cadena de Markov** es un proceso estocástico (una secuencia de variables aleatorias) en el que la probabilidad de que el sistema se mueva a un estado futuro depende exclusivamente del estado actual y no de la serie de eventos que le precedieron. En otras palabras, el estado futuro depende únicamente del estado presente, no de la historia completa del sistema Esta característica fundamental se conoce como la **propiedad de Markov** o la "falta de memoria" del sistema.

Matemáticamente, para una secuencia de variables aleatorias $X_0, X_1, X_2, \dots$ con un espacio de estados discreto $S$, la propiedad de Markov se expresa como:

```math
P(X_{n+1} = i_{n+1} | X_n = i_n, X_{n-1} = i_{n-1}, \dots, X_0 = i_0) = P(X_{n+1} = i_{n+1} | X_n = i_n)
```

Una cadena de Markov es un proceso de Markov con espacio de estados discreto y tiempo discreto. Es la formulación más utilizada en aplicaciones prácticas.

### 2. Fundamentos Matemáticos

```math
P\bigl(X_{t+1}=j\mid X_t=i, X_{t-1}=i_{t-1},\dots\bigr)=P\bigl(X_{t+1}=j\mid X_t=i\bigr)=p_{ij}
```

donde $p_{ij}$ son las probabilidades de transición que forman la matriz de transición $P$:


#### Matriz de Transición Estocástica
La evolución de una cadena de Markov homogénea en el tiempo se describe mediante una **matriz de transición** $P$, donde cada elemento $P_{ij}$ representa la probabilidad de pasar del estado $i$ al estado $j$ en un solo paso.
Una matriz estocástica debe cumplir que:
1.  Sus elementos son no negativos: $P_{ij} \ge 0$.

2.  La suma de cada fila es igual a 1: $\sum_{j} P_{ij} = 1$.

#### Ecuación de Chapman-Kolmogorov
Para calcular las probabilidades de transición en $n$ pasos, se utiliza la **ecuación de Chapman-Kolmogorov**, que establece que la matriz de transición para $n$ pasos es simplemente la $n$-ésima potencia de la matriz de un solo paso:

```math
P(n+m) = P(n)P(m) \implies P^{(n)} = P^n
```

#### Distribución Estacionaria
Una distribución de probabilidad $\pi$ es **estacionaria** para una cadena de Markov si el sistema permanece en esa distribución después de una transición:

```math
\pi P = \pi, \quad \text{donde} \sum_i \pi_i = 1
```


---

### 3. Implementación en Python con Datasets Reales

A continuación, se presentan dos ejemplos prácticos de análisis secuencial.


#### Ejemplo: Predicción meteorológica (dataset NOAA)

```python showLineNumbers
#

```

<br />

### 4. Clasificación de Estados y Ergodicidad
*   **Recurrencia:** Un estado es recurrente si la probabilidad de regresar a él en un tiempo finito es 1.
*   **Transitoriedad:** Un estado es transitorio si existe una probabilidad mayor a 0 de nunca regresar a él.
*   **Ergodicidad:** Una cadena es ergódica si es irreducible (todos los estados se comunican), positiva recurrente y aperiódica. En este estado, los promedios temporales convergen a las esperanzas de la distribución estacionaria.

### 5. Casos de Uso Comunes
1.  **MCMC (Monte Carlo por Cadenas de Markov):** Utilizado para obtener muestras de distribuciones posteriores complejas en estadística bayesiana mediante algoritmos como Metropolis-Hastings o el muestreo de Gibbs.
2.  **Procesamiento de Lenguaje Natural:** Modelado de secuencias de palabras para predicción de texto y reconocimiento de voz.
3.  **Economía y Finanzas:** Análisis de fluctuaciones de mercado y volatilidad de activos.
4.  **Bioinformática:** Alineación de secuencias de proteínas y análisis de genomas.


### Diferencias entre una cadena de Markov y modelo oculto de Markov

La diferencia fundamental entre una **cadena de Markov** y un **modelo oculto de Markov (HMM)** radica en la **visibilidad de los estados**: mientras que en una cadena de Markov los estados son directamente observables, en un HMM los estados internos están "ocultos" y solo pueden inferirse a través de una serie de observaciones o emisiones producidas por dicho sistema.

A continuación se detallan las diferencias principales organizadas por categorías:

### 1. Observabilidad y Estructura
*   **Cadena de Markov (MC):** Es una secuencia de variables aleatorias donde cada estado es conocido y visible para el observador. El sistema evoluciona a través de transiciones entre estos estados observables siguiendo la **propiedad de Markov**.

*   **Modelo Oculto de Markov (HMM):** Es un "modelo de mezcla dependiente" que consta de dos partes: una **cadena de Markov subyacente** (parámetro de proceso) que no se puede ver, y un **proceso dependiente del estado** que genera los datos que sí observamos. Por ejemplo, en el reconocimiento de voz, los estados son fonemas ocultos y las observaciones son las señales de audio grabadas.

### 2. Componentes Matemáticos
Para definir cada modelo, se requieren distintos conjuntos de parámetros:

| Característica | Cadena de Markov | Modelo Oculto de Markov (HMM) |
| :--- | :--- | :--- |
| **Estados** | Todos son visibles. | Existen estados ocultos y observaciones visibles. |
| **Probabilidades de Transición** | Definen el salto entre estados conocidos. | Definen el salto entre los estados ocultos. |
| **Probabilidades de Emisión** | No existen (el estado *es* la observación). | Definen la probabilidad de que un estado oculto genere una observación específica. |
| **Parámetros base** | Matriz de transición ($\Gamma$) y distribución inicial ($\delta$). | Matriz de transición, matriz de emisión (o densidades) y distribución inicial. |

### 3. Aplicación de la Propiedad de Markov
*   **Consistencia:** Una cadena de Markov siempre satisface la propiedad de que el futuro depende únicamente del presente.
*   **Deterioro en HMM:** Aunque el proceso oculto es una cadena de Markov, la secuencia de **observaciones visibles en un HMM generalmente no cumple con la propiedad de Markov**. Esto significa que conocer solo la observación actual no siempre es suficiente para predecir la siguiente sin considerar la historia del modelo.

### 4. Objetivos e Inferencia
*   **En Cadenas de Markov:** El interés suele estar en calcular las **probabilidades de transición**, el tiempo promedio en un estado o el comportamiento del sistema a largo plazo (estado estacionario).

*   **En HMM:** Los desafíos son más complejos y se dividen en tres problemas clásicos:
    1.  **Evaluación:** Calcular la probabilidad de una secuencia de observaciones.
    2.  **Decodificación:** Determinar la secuencia más probable de estados ocultos que generó las observaciones (comúnmente mediante el **algoritmo de Viterbi**).
    3.  **Aprendizaje:** Estimar los parámetros del modelo (transiciones y emisiones) a partir de los datos observados (usando el **algoritmo de Baum-Welch**).

***

**En resumen:** Una cadena de Markov es un sistema donde lo que ves es lo que sucede. Un HMM es un sistema donde lo que ves es solo el resultado (emisión) de un mecanismo interno invisible que se comporta como una cadena de Markov.


