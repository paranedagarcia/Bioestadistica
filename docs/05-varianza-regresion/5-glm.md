---
id: glm
title: GLM
sidebar_label: "GLM"
sidebar_position: 5
---

El **Modelo Lineal Generalizado** (conocido por sus siglas en inglés **GLM**, *Generalized Linear Model*) representa un marco estadístico unificado y flexible que permite extender las capacidades de la regresión lineal convencional para analizar variables de respuesta que no siguen una distribución normal.

Formalizado originalmente por **Nelder y Wedderburn** en 1972, el GLM subsume modelos clásicos como la regresión lineal, la regresión logística y la regresión de Poisson bajo una misma estructura matemática.

### 1. Los Tres Componentes del GLM

Para un investigador, la arquitectura de un GLM se define rigurosamente mediante tres pilares fundamentales:

1.  **El Componente Aleatorio:** Se refiere a la variable dependiente $y$. A diferencia del modelo lineal estándar, el GLM asume que $y$ proviene de una distribución de probabilidad perteneciente a la **familia exponencial** (que incluye la Normal, Binomial, Poisson, Gamma e Inversa Gaussiana).
2.  **El Componente Sistemático (Predictor Lineal):** Es la combinación lineal de las variables independientes o predictores ($X$) ponderados por sus respectivos coeficientes de regresión ($\beta$). Se denota comúnmente con la letra griega eta ($\eta$):
    $$\eta = \beta_0 + \beta_1 X_1 + \beta_2 X_2 + \dots + \beta_k X_k = X\beta$$.
3.  **La Función de Enlace ($Link$):** Es el componente más innovador. Se trata de una función monótona y diferenciable, $g(\cdot)$, que conecta la media esperada de la variable de respuesta ($\mu = E(y)$) con el predictor lineal ($\eta$).

### 2. Fundamentación Matemática

La ecuación general que gobierna un modelo lineal generalizado se expresa como:

$$g(E[y]) = X\beta$$

Donde:
*   **$E[y] = \mu$:** Es el valor esperado de la variable de respuesta (siempre en la escala original de los datos).
*   **$g(\cdot)$:** Es la función de enlace que transforma la media para que el modelo sea lineal en sus parámetros.
*   **$X\beta$:** Es la estructura lineal del modelo.

A la inversa, para obtener las predicciones en la escala original del fenómeno biológico, se utiliza la **función de enlace inversa** ($g^{-1}$):
$$E(y) = \mu = g^{-1}(X\beta)$$.

### 3. Principales Modelos y sus Funciones de Enlace

La elección de la función de enlace y la familia de distribución depende exclusivamente de la naturaleza de los datos clínicos:

| Caso Clínico | Distribución ($y$) | Función de Enlace ($g$) | Nombre del Modelo |
| :--- | :--- | :--- | :--- |
| Variable continua (ej. talla) | Normal (Gaussiana) | **Identidad:** $g(\mu) = \mu$ | Regresión Lineal Clásica |
| Evento binario (ej. vive/muere) | Binomial | **Logit:** $g(\mu) = \ln\left(\frac{\mu}{1-\mu}\right)$ | Regresión Logística |
| Conteos (ej. # de convulsiones) | Poisson | **Logarítmica:** $g(\mu) = \ln(\mu)$ | Regresión de Poisson |
| Concentraciones (ej. hormonas) | Gamma | **Recíproca:** $g(\mu) = 1/\mu$ | Regresión Gamma |

### 4. Importancia en Bioestadística

La ventaja del GLM radica en que permite manejar situaciones donde el supuesto de varianza constante y normalidad de los residuos es violado. Por ejemplo:
*   En **epidemiología**, permite modelar tasas de incidencia mediante el uso de *offsets* en modelos de Poisson.
*   En **diagnóstico clínico**, es la herramienta estándar para calcular la probabilidad de enfermedad (riesgo) ajustando por múltiples factores de confusión.
*   En **estudios ecológicos y farmacéuticos**, permite la modelación de datos inflados con ceros o distribuciones asimétricas (como la Tweedie) que no se ajustan a la campana de Gauss.

En el lenguaje de programación R, estos modelos se implementan principalmente mediante la función `glm()`, la cual utiliza algoritmos iterativos de **máxima verosimilitud** en lugar del método de mínimos cuadrados cerrados, garantizando estimaciones más precisas para modelos no lineales.

***

