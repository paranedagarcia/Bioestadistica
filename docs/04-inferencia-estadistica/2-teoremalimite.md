---
id: tlc
title: Teorema del Límite Central
sidebar_label: Teorema del Límite Central
sidebar_position: 2
---

# Teorema del Límite Central

El **Teorema del Límite Central (TLC)** es uno de los pilares fundamentales de la estadística inferencial y la teoría de la probabilidad, con una relevancia trascendental en la investigación epidemiológica. Su postulado principal establece que, bajo condiciones generales, la suma (o el promedio) de un número suficientemente grande de variables aleatorias independientes e idénticamente distribuidas (i.i.d.) tenderá a seguir una **distribución normal**, independientemente de la forma de la distribución original de la población.



### 1. Enunciado y Fundamentación

Sea $X_1, X_2, \dots, X_n$ una muestra aleatoria de tamaño $n$ extraída de una población con una media poblacional $\mu$ y una varianza finita $\sigma^2$. A medida que el tamaño de la muestra $n$ aumenta, la distribución de la media muestral $\overline{X}$ se aproxima a una distribución normal con la misma media $\mu$ y una varianza reducida de $\sigma^2/n$.

Matemáticamente, el estadístico estandarizado $Z$ converge en distribución hacia una normal estándar $N(0, 1)$ cuando $n$ tiende a infinito:

```math
Z = \frac{\overline{X} - \mu}{\sigma/\sqrt{n}} \xrightarrow{D} N(0, 1)
```

**Componentes de la fórmula:**
*   **$\overline{X}$ (Media muestral):** Es el promedio aritmético calculado a partir de las $n$ observaciones de la muestra.
*   **$\mu$ (Media poblacional):** Es el valor esperado o centro de gravedad de la distribución de la población original.
*   **$\sigma$ (Desviación estándar poblacional):** Representa la dispersión de los datos en la población original.
*   **$\sqrt{n}$:** La raíz cuadrada del tamaño de la muestra.
*   **$\sigma/\sqrt{n}$ (Error Típico o Estándar - SEM):** Cuantifica la variabilidad del estimador (la media) y disminuye a medida que $n$ aumenta, lo que incrementa la precisión de la estimación.

### 2. Condiciones de Aplicabilidad y Tamaño Muestral

El rigor del TLC reside en que permite realizar inferencias (pruebas de hipótesis y construcción de intervalos de confianza) incluso cuando la distribución madre no es normal.

*   **Población Normal:** Si la población original ya sigue una distribución normal, la media muestral será normal para cualquier tamaño de muestra, incluso si $n=1$.

*   **Población No Normal:** Como regla general o "punto de corte" práctico, se considera que un tamaño de muestra **$n \ge 30$** es suficiente para que la aproximación a la normalidad sea válida.

*   **Efecto de la Asimetría:** La velocidad de convergencia depende de la forma de la población original. Cuanto más asimétrica sea la distribución poblacional (o si tiene "colas gruesas"), mayor deberá ser el tamaño de muestra requerido para invocar el TLC con seguridad.

### 3. El TLC en Variables Dicotómicas (Proporciones)

En común trabajar con proporciones (ej. tasa de curación o prevalencia de una enfermedad). El TLC también gobierna el comportamiento de la proporción muestral ($\hat{p}$). Si el tamaño de muestra es grande y la probabilidad del evento no es extrema, la distribución de $\hat{p}$ se aproxima a una normal:

```math
Z = \frac{\hat{p} - \pi}{\sqrt{\frac{\pi(1-\pi)}{n}}} \xrightarrow{D} N(0, 1)
```

Las condiciones usuales para esta aproximación son que tanto $n\pi \ge 5$ como $n(1-\pi) \ge 5$ (algunos autores sugieren $\ge 10$ para mayor rigor).

### 4. Importancia en el Ámbito Biomédico

El TLC justifica por qué tantas variables biológicas (como la presión arterial sistólica o la talla) suelen aproximarse a una distribución normal: estas medidas son a menudo el resultado acumulativo de múltiples factores genéticos y ambientales independientes que actúan de manera aditiva.

El TLC es esencial porque:
1.  **Permite el uso de Pruebas Paramétricas:** Valida el uso de la prueba *t* de Student o el ANOVA en muestras grandes, incluso si los datos crudos no son perfectamente normales.

2.  **Facilita la Estimación por Intervalos:** Permite calcular intervalos de confianza que delimitan, con una probabilidad cuantificable (ej. 95%), dónde se encuentra el verdadero parámetro poblacional.

3.  **Estabilidad de las Estimaciones:** Demuestra que las medias calculadas de muestras grandes son estimadores más estables y confiables (menor error típico) que las de muestras pequeñas.

