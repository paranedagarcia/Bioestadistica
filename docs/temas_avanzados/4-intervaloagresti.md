---
id: temas-agresti
title: Intervalo Agresti-Coull
sidebar_label: Intervalo Agresti-Coull
sidebar_position: 4
---

El **intervalo de Agresti-Coull** es un método de estimación por intervalo para una proporción poblacional ($p$) que surge como una optimización técnica frente al intervalo tradicional de Wald. En la investigación clínica, este intervalo es altamente valorado debido a que su **probabilidad de cobertura** (el porcentaje de veces que el intervalo contiene el parámetro real) es mucho más cercano al nivel de confianza nominal (ej. 95%), especialmente cuando se trabaja con muestras pequeñas o proporciones extremas.

### 1. Fundamento y Limitaciones del Intervalo de Wald
Tradicionalmente, el intervalo para una proporción se calcula mediante la fórmula de Wald:
```math
p = \hat{p} \pm z_{\alpha/2} \sqrt{\frac{\hat{p}(1-\hat{p})}{n}}
```

Donde $\hat{p} = X/n$ es la proporción muestral. Sin embargo, la investigación ha demostrado que este método es poco fiable cuando el supuesto de normalidad no se cumple estrictamente, resultando en intervalos "demasiado estrechos" que no contienen el parámetro real con la frecuencia declarada. Para mitigar esto, se suelen imponer requisitos como $n\hat{p} \ge 10$ y $n(1-\hat{p}) \ge 10$, los cuales no siempre son posibles en estudios clínicos de enfermedades raras o pilotos informáticos.

### 2. Formulación Matemática de Agresti-Coull
Alan Agresti y Brent Coull propusieron en 1998 un "intervalo de Wald modificado" que utiliza estimadores transformados de la proporción y del tamaño muestral.

Se definen los componentes ajustados como:
*   **$\tilde{n}$ (Tamaño de muestra ajustado):** $\tilde{n} = n + z_{\alpha/2}^2$.
*   **$\tilde{X}$ (Éxitos ajustados):** $\tilde{X} = X + \frac{z_{\alpha/2}^2}{2}$.
*   **$\tilde{p}$ (Proporción ajustada):** $\tilde{p} = \frac{\tilde{X}}{\tilde{n}}$.

El intervalo de confianza de Agresti-Coull se expresa formalmente como:

```math
IC_{(1-\alpha)} = \tilde{p} \pm z_{\alpha/2} \sqrt{\frac{\tilde{p}(1-\tilde{p})}{\tilde{n}}}
```

#### El caso del 95% de confianza ("Regla de añadir 4")
Para un nivel de confianza del 95%, el valor crítico $z_{\alpha/2}$ es aproximadamente **2**. Al sustituir este valor en las fórmulas anteriores, el método se simplifica a la famosa regla de **"añadir dos éxitos y dos fracasos"**:
*   $\tilde{n} \approx n + 4$
*   $\tilde{X} \approx X + 2$
*   $\tilde{p} \approx \frac{X+2}{n+4}$

Este ajuste desplaza la proporción estimada hacia $0.5$, lo que actúa como un mecanismo de regularización que estabiliza el intervalo.

### 3. Ventajas y Aplicación Clínica
1.  **Robustez en muestras pequeñas:** Puede utilizarse con casi cualquier tamaño de muestra sin necesidad de verificar las condiciones de $n\hat{p} \ge 10$.

2.  **Precisión de cobertura:** El nivel de confianza real se mantiene mucho más cerca del publicitado (nominal) en comparación con el método de Wald.

3.  **Implementación en Software:** Es una opción estándar en módulos bioestadísticos como EPITABLE de Epi Info 7, donde se denomina "Modified Wald (Agresti-Coull)".

**Ejemplo comparativo:**
Si en un estudio de usabilidad de un software médico se observan **5 éxitos en 25 pruebas** ($n=25, X=5$):
*   El intervalo de **Wald** (Aproximación Normal) daría un rango de **4.32% a 35.68%**.
*   El intervalo de **Agresti-Coull** daría un rango de **8.41% a 39.58%**.
Nótese que el intervalo de Agresti-Coull es ligeramente más conservador y se desplaza hacia el centro, proporcionando una estimación más realista de la incertidumbre clínica.

***

