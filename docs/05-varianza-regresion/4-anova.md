---
id: anova
title: ANOVA
sidebar_label: "​ANOVA"
sidebar_position: 4
---

## Análisis de varianza

El **Análisis de Varianza (ANOVA)** es un conjunto de modelos estadísticos y sus procedimientos asociados en los cuales la varianza observada en una variable particular se particiona en componentes atribuibles a diferentes fuentes de variación. Se utiliza primordialmente para determinar si existen diferencias significativas entre las medias de tres o más grupos independientes, generalizando la prueba *t* de Student.

### Contexto Histórico
El desarrollo del ANOVA es obra del eminente estadístico y genetista británico **Sir Ronald A. Fisher**, quien introdujo formalmente el método en la década de 1920. Fisher comenzó su trabajo en la Estación Experimental Agrícola de Rothamsted en 1919, donde ideó métodos de aleatorización y análisis de varianza para evaluar la eficacia de diferentes tratamientos en cultivos. 

Aunque el ANOVA nació en la agricultura, Fisher extendió sus aplicaciones a la medicina y la biología. El nombre del estadístico de prueba principal, **F**, se otorgó en su honor (distribución F de Fisher-Snedecor). El método se consolidó como una herramienta para el diseño de experimentos controlados, permitiendo a los investigadores separar el "ruido" o error experimental de los efectos reales de los tratamientos.

### Definición y Concepto
El ANOVA se define como una técnica que analiza la estructura de las observaciones dividiendo la variabilidad total en partes explicadas por factores específicos y una parte residual debida al azar. A diferencia de realizar múltiples pruebas *t* entre pares de grupos —lo cual aumentaría drásticamente la probabilidad de cometer un **error de tipo I** (falsos positivos)— el ANOVA permite una evaluación global de la hipótesis nula.

*   **Hipótesis Nula ($H_0$):** $\mu_1 = \mu_2 = \dots = \mu_k$ (Todas las medias poblacionales son iguales).
*   **Hipótesis Alternativa ($H_a$):** Al menos una media es diferente de las demás.

### Fundamento Matemático
La lógica del ANOVA reside en la propiedad de aditividad de la varianza. Se descompone la **Suma Total de Cuadrados (STC)** en componentes que reflejan la variación entre los grupos y la variación dentro de los grupos.

#### La Identidad Fundamental del ANOVA:

```math
STC = STCr + SCE
```
Donde:
*   **$STC$ (Suma Total de Cuadrados):** Representa la variabilidad total de los datos respecto a la gran media ($\overline{\overline{x}}$).
*   **$STCr$ (Suma de Cuadrados de Tratamientos o "Entre" grupos):** Mide la variación inducida por los diferentes niveles del factor en estudio.
*   **$SCE$ (Suma de Cuadrados del Error o "Dentro" de los grupos):** Cuantifica la variación residual que no se explica por los tratamientos (ruido aleatorio).

#### El Estadístico F de Fisher:
Para decidir si el efecto de un tratamiento es significativo, se comparan los **Cuadrados Medios (MS)**, que son las sumas de cuadrados divididas por sus respectivos **grados de libertad (gl)**.

```math
F = \frac{MSTr}{MSE} = \frac{STCr / (k-1)}{SCE / (N-k)}
```
*   **$k-1$:** Grados de libertad del tratamiento ($k$ = número de grupos).
*   **$N-k$:** Grados de libertad del error ($N$ = número total de observaciones).

Si el valor de **F** es significativamente mayor que 1, indica que la variabilidad entre las medias de los grupos es mucho mayor que la variabilidad interna esperada por el azar, lo que lleva al rechazo de $H_0$.

### Supuestos Críticos para la Validez
Para que los resultados del ANOVA sean rigurosos en la investigación biomédica, deben satisfacerse tres premisas fundamentales:
1.  **Independencia:** Las observaciones deben ser independientes entre sí. Se viola si se toman medidas repetidas en el mismo paciente sin un diseño específico para ello.
2.  **Normalidad:** Los datos dentro de cada grupo deben seguir una distribución normal o gaussiana. El ANOVA es robusto ante ligeras desviaciones si los tamaños de muestra son grandes ($n \ge 30$).
3.  **Homocedasticidad (Homogeneidad de Varianza):** Las varianzas de los grupos deben ser aproximadamente iguales. Se puede verificar mediante pruebas como la de Bartlett o Levene.

### Tipos de Diseño y Usos en Salud
El ANOVA se adapta a diversas estructuras de investigación en biomedicina:

*   **ANOVA Unifactorial (One-Way):** Compara el efecto de un solo factor con múltiples niveles. *Ejemplo:* Evaluar la reducción de presión arterial media usando cuatro marcas distintas de fármacos antihipertensivos.

*   **ANOVA Bifactorial (Two-Way):** Analiza dos factores simultáneamente y su **interacción**. *Ejemplo:* Estudiar la recuperación muscular considerando el tipo de dieta (Factor A) y el género del paciente (Factor B). Si hay interacción, el efecto de la dieta depende de si el paciente es hombre o mujer.

*   **ANOVA de Medidas Repetidas:** Se utiliza cuando los mismos sujetos pasan por todos los tratamientos (estudios longitudinales o cruzados). *Ejemplo:* Medir los niveles de glucosa en un mismo grupo de pacientes antes del tratamiento, al mes y a los tres meses.



## Análisis Post-Hoc

El **análisis post-hoc** (del latín "después de esto") se refiere a un conjunto de procedimientos estadísticos de comparación múltiple que se ejecutan únicamente tras haber obtenido un resultado estadísticamente significativo en una prueba global u "ómnibus", como el Análisis de Varianza (ANOVA).

Su función primordial es discernir cuáles son las diferencias específicas entre los pares de grupos, una vez que la prueba global ha rechazado la hipótesis nula de igualdad de todas las medias.

### Justificación

Cuando un investigador evalúa, por ejemplo, tres tipos de fármacos contra un placebo, el ANOVA determina si existe alguna diferencia en el conjunto. Sin embargo, el ANOVA por sí solo no identifica qué tratamiento es superior a otro. 

Surge entonces la tentación de realizar múltiples pruebas *t* de Student independientes. No obstante, esto conlleva el problema de la **inflación del error de Tipo I** (falsos positivos). Si se realizan $c$ comparaciones independientes con un nivel de significancia $\alpha = 0.05$, la probabilidad global de cometer al menos un error de Tipo I aumenta según la fórmula:

$$1 - (1 - \alpha)^c$$

Por ejemplo, al comparar 5 grupos se requieren 10 comparaciones de pares; sin un ajuste post-hoc, la probabilidad de encontrar al menos una diferencia "significativa" por puro azar asciende a aproximadamente un 40%. Los métodos post-hoc corrigen este umbral de significancia para mantener el error de Tipo I bajo control en todo el experimento.

### Principales Métodos Post-hoc

Existen diversos algoritmos dependiendo de la rigurosidad y el diseño del estudio:

*   **Test de Tukey (HSD - Honestly Significant Difference):** Es uno de los más utilizados en bioestadística clínica debido a su equilibrio entre potencia y control del error. Se basa en la **distribución de rango estudentizado ($q$)** y utiliza la siguiente medida para determinar diferencias significativas:

    $$\omega = q_{\alpha}(k, df) \sqrt{\frac{MSE}{n_t}}$$
    *Donde:*
    *   $k$: Número de tratamientos comparados.
    *   $df$: Grados de libertad del error.
    *   $MSE$: Media de los cuadrados del error del ANOVA global.
    *   $n_t$: Tamaño de la muestra por grupo.


*   **Corrección de Bonferroni:** Es un método conservador donde el nivel $\alpha$ global se divide por el número de comparaciones ($c$). Por ejemplo, para tres comparaciones, el nuevo nivel de significación para cada par sería $0.05 / 3 = 0.0167$.

*   **Test de Dunnett:** Específicamente diseñado para situaciones donde se comparan varios tratamientos nuevos exclusivamente contra un grupo control, evitando comparaciones innecesarias entre los tratamientos nuevos.

*   **Método de Scheffé:** Es el más conservador de todos, permitiendo cualquier tipo de comparación (no solo por pares), pero con una pérdida significativa de potencia estadística.

### 3. Aplicación

En el desarrollo de **Sistemas de Soporte a la Decisión Clínica (CDSS)**, la automatización del análisis post-hoc permite que el sistema no solo alerte sobre la existencia de variabilidad en la respuesta del paciente, sino que identifique con rigor científico qué esquema terapéutico específico está generando el beneficio clínico observado. 

Es imperativo verificar que se cumplan los supuestos del ANOVA (normalidad y homocedasticidad) antes de interpretar estos tests, pues su validez depende de la estimación de la varianza residual agrupada del modelo original.

<br />
#### 📝 Programación:
<Tabs>
<TabItem value="cm" label="Antecedentes" default>
<div class="alert alert--primary">
**Análisis de ANOVA**<br />
</div>
</TabItem>
<TabItem value="cm-python" label="Pyhton" default>
```python showLineNumbers
# Implementación en Python
```
</TabItem>
<TabItem value="cm-r" label="R" default>
```r showLineNumbers
# Implementación en R
```
</TabItem>
</Tabs><br />