---
id: anova
title: ANOVA
sidebar_label: "​ANOVA"
sidebar_position: 4
---

## Análisis de varianza

El **Análisis de Varianza (ANOVA)** es un conjunto de modelos estadísticos y sus procedimientos asociados en los cuales la varianza observada en una variable particular se particiona en componentes atribuibles a diferentes fuentes de variación. Se utiliza primordialmente para determinar si existen diferencias significativas entre las medias de tres o más grupos independientes, generalizando la prueba *t* de Student.

### Contexto Histórico
El desarrollo del ANOVA es obra del estadístico y genetista británico **Sir Ronald A. Fisher**, quien introdujo formalmente el método en la década de 1920. Fisher comenzó su trabajo en la Estación Experimental Agrícola de Rothamsted en 1919, donde ideó métodos de aleatorización y análisis de varianza para evaluar la eficacia de diferentes tratamientos en cultivos. 

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

<br />
#### 💻 Código:
<Tabs>
<TabItem value="cm" label="Antecedentes" default>
<div class="alert alert--primary">
**Análisis de ANOVA unifactorial**<br />
Impacto del Tratamiento en la Artritis Reumatoide

Se utilizará el conjunto de datos real Arthritis proveniente de un ensayo clínico aleatorizado de doble ciego que investigó la efectividad de una nueva terapia médica (Koch & Edwards, 1988). Este dataset se encuentra integrado en el paquete analítico de R vcd.

Modelaremos el efecto de la asignación del tratamiento (Factor independiente: Tratado vs. Placebo) sobre el estado general del paciente, mapeado aquí mediante puntuaciones clínicas estandarizadas de mejora biológica (simuladas formalmente sobre la escala de respuesta continua continua para el propósito analítico de evaluar la técnica paramétrica).
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
# ==============================================================================
# PASO 1: INSTALACIÓN Y CARGA DE LIBRERÍAS CIENTÍFICAS
# ==============================================================================
if (!require("vcd")) install.packages("vcd")
if (!require("ggplot2")) install.packages("ggplot2")
if (!require("car")) install.packages("car")

library(vcd)      # Contiene el dataset real 'Arthritis'
library(ggplot2)  # Generación de gráficos avanzados de grado de publicación
library(car)      # Pruebas estadísticas avanzadas para supuestos

# ==============================================================================
# PASO 2: PREPARACIÓN Y EXPLORACIÓN INICIAL DE LOS DATOS (EDA)
# ==============================================================================
data("Arthritis")
# Para fines estrictamente pedagógicos de un ANOVA continuo, extraeremos una métrica 
# continua o utilizaremos una variable numérica derivada de los marcadores analíticos del estudio
set.seed(42)
# Supongamos una variable clínica continua: 'Reducción del Índice de Dolor' (Escala Continua)
Arthritis$ScoreDolor <- ifelse(Arthritis$Treatment == "Treated", 
                               rnorm(nrow(Arthritis), mean = 15, sd = 3.2), 
                               rnorm(nrow(Arthritis), mean = 9, sd = 3.5))

# Visualizar la estructura matemática del dataframe
str(Arthritis)

# Análisis descriptivo por grupo de intervención médica
Descriptivos <- aggregate(ScoreDolor ~ Treatment, data = Arthritis, 
                          FUN = function(x) c(Media = mean(x), DE = sd(x), N = length(x)))
print(Descriptivos)

# ==============================================================================
# PASO 3: VISUALIZACIÓN ANALÍTICA DE LAS DISTRIBUCIONES
# ==============================================================================
# Boxplot estructural para comparar la dispersión y la tendencia central
ggplot(Arthritis, aes(x = Treatment, y = ScoreDolor, fill = Treatment)) +
  geom_boxplot(alpha = 0.7, outlier.shape = 16, outlier.size = 2) +
  stat_summary(fun = mean, geom = "point", shape = 18, size = 3, color = "black") +
  labs(title = "Distribución de la Reducción del Dolor según Grupo de Tratamiento",
       subtitle = "Ensayo Clínico de Artritis Reumatoide",
       x = "Línea de Intervención (Factor)",
       y = "Reducción del Dolor (Métrica Continua)") +
  theme_classic() +
  scale_fill_brewer(palette = "Set2")

# ==============================================================================
# PASO 4: EVALUACIÓN DE LOS SUPUESTOS DEL MODELO
# ==============================================================================
# Ajuste inicial del modelo lineal para la extracción formal de residuos
modelo_lineal <- lm(ScoreDolor ~ Treatment, data = Arthritis)

# A. Evaluación del Supuesto de Normalidad (Prueba de Shapiro-Wilk sobre los residuos)
shapiro_residuos <- shapiro.test(residuals(modelo_lineal))
print(shapiro_residuos)

# Gráfico de Normalidad Q-Q
qqPlot(modelo_lineal, main = "Gráfico Q-Q de Residuos", id = FALSE)

# B. Evaluación de Homocedasticidad (Prueba de Levene)
prueba_levene <- leveneTest(ScoreDolor ~ Treatment, data = Arthritis)
print(prueba_levene)

# ==============================================================================
# PASO 5: EJECUCIÓN FORMAL DEL ANOVA UNIFACTORIAL
# ==============================================================================
anova_resultado <- aov(ScoreDolor ~ Treatment, data = Arthritis)
summary(anova_resultado)
```
```raw
# resultado:
Df Sum Sq Mean Sq F value Pr(>F)    
Treatment    1  744.1   744.1   66.19 1.4e-12 ***
Residuals   82  921.9    11.2                   
---
Signif. codes:  0 ‘***’ 0.001 ‘**’ 0.01 ‘*’ 0.05 ‘.’ 0.1 ‘ ’ 1
```
Análisis de la Tabla ANOVA
- Grados de Libertad ($Df$): Para la fila del tratamiento, $df = k - 1 = 2 - 1 = 1$. Para los residuos, $df = N - k = 84 - 2 = 82$.
- Estadístico F de Fisher: El valor calculado de $F = 66.19$ indica de forma inequívoca que la varianza explicada entre los grupos bajo el efecto terapéutico supera drásticamente la varianza atribuible al error puramente intragrupo.
- Valor p ($Pr(>F)$): El valor de probabilidad obtenido ($1.4 \times 10^{-12}$) se sitúa muy por debajo de cualquier umbral crítico estandarizado ($\alpha = 0.05$, $\alpha = 0.01$).

Conclusión Clínica Basada en la Evidencia

Dado que el valor p es significativamente menor que nuestro nivel de significancia establecido, se rechaza la hipótesis nula ($H_0$). Se concluye con rigurosidad estadística que existen diferencias significativas en la reducción promedio del dolor entre los pacientes asignados a la terapia biológica activa en comparación con aquellos que recibieron el placebo.

</TabItem>
</Tabs><br />


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
#### 💻 Código:
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