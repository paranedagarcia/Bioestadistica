---
id: temas-cox
title: Modelo de Cox
sidebar_label: "🔸Modelo de Cox"
sidebar_position: 3
---

# El Modelo de Cox

El **Modelo de Riesgos Proporcionales de Cox**, desarrollado por el estadístico David R. Cox en 1972, constituye la piedra angular del análisis de supervivencia en la investigación biomédica contemporánea. Se define como un método de regresión que permite evaluar la relación entre el tiempo transcurrido hasta la ocurrencia de un evento (como la muerte, recaída o curación) y un conjunto de variables explicativas o predictores.

### 1. Fundamentación Matemática del Modelo

La especificación formal del modelo de Cox define la función de riesgo (*hazard function*) en el tiempo $t$ para un individuo con un vector de covariables $Z$ de la siguiente manera:

```math
h(t, Z) = h_0(t) e^{\sum_{i=1}^{p} \beta_i Z_i}
```

Donde los componentes se definen como:
*   **$h(t, Z)$:** Representa el riesgo instantáneo de experimentar el evento (ej. recaída tumoral o muerte) en el tiempo $t$, dado que el sujeto ha sobrevivido hasta ese instante.
*   **$h_0(t)$** Es el **riesgo basal**, que corresponde al riesgo cuando todos los predictores son iguales a cero; esta función depende exclusivamente del tiempo. En este modelo, $h_0(t)$ es una función de tiempo que se deja sin especificar, lo que le confiere su carácter **semiparamétrico**.
*   **$e^{\sum \beta_i Z_i}$:** Es la parte paramétrica del modelo que describe cómo los predictores afectan el riesgo de forma multiplicativa.
*   **$\beta_i$:** Son los coeficientes de regresión que cuantifican el efecto de cada variable sobre el logaritmo del riesgo.


### 2. Naturaleza Semiparamétrica

El modelo de Cox es clasificado como semiparamétrico porque combina componentes con y sin distribución asumida. Mientras que los efectos de las covariables ($\beta$) se estiman de forma paramétrica, la distribución subyacente del tiempo hasta el evento ($h_0(t)$) no requiere ser especificada (a diferencia de los modelos paramétricos como Weibull o Exponencial). Esta característica lo hace extremadamente **robusto**, permitiendo obtener estimaciones válidas incluso si se desconoce la forma exacta de la curva de supervivencia poblacional.

### 3. El Supuesto de Riesgos Proporcionales (PH)

El fundamento crítico del modelo es la premisa de que los riesgos entre individuos son proporcionales y esta proporción es **constante en el tiempo**. Matemáticamente, la razón de riesgos (*Hazard Ratio*) entre dos especificaciones de predictores $X^*$ y $X$ se expresa como:

```math
\hat{HR} = \frac{h(t, X^*)}{h(t, X)} = e^{\sum \hat{\beta}_i (X_i^* - X_i)}
```

Como se observa, el término de riesgo basal $h_0(t)$ se cancela, resultando en un valor constante ($\theta$) que no depende de $t$.

*   **Ejemplo de validación:** Si las funciones de riesgo de dos grupos (ej. tratamiento vs. placebo) se cruzan en una gráfica, el supuesto de proporcionalidad no se cumple y el modelo de Cox estándar resulta inapropiado.

### 4. Estimación mediante Verosimilitud Parcial

Dado que el riesgo basal es desconocido, los coeficientes no pueden estimarse mediante verosimilitud total. En su lugar, se utiliza la **Verosimilitud Parcial** (*Partial Likelihood*), la cual se basa en el **orden de los eventos** en lugar de su distribución temporal exacta. El modelo evalúa la probabilidad de que, en cada momento en que ocurre una falla, sea precisamente ese individuo quien falle y no otro de los que aún están "en riesgo" en ese instante.

### 5. Interpretación del Hazard Ratio (HR)

En el contexto médico, la medida de efecto principal es el *Hazard Ratio*, obtenido al aplicar la función exponencial al coeficiente ($\hat{HR} = e^{\beta}$):
*   **$HR > 1$:** Indica un incremento en el riesgo (el factor es perjudicial para la supervivencia).
*   **$HR = 1$:** Indica ausencia de efecto (valor nulo).
*   **$HR < 1$:** Indica una reducción en el riesgo (el factor es protector).

**Ejemplo Clínico:** 

En un estudio de remisión de leucemia, si el coeficiente del tratamiento es $\beta = 1.294$, el $HR = e^{1.294} = 3.65$, lo que significa que el grupo placebo tiene 3.65 veces más riesgo de salir de remisión en cualquier momento dado en comparación con el grupo tratado.

El modelo de riesgos proporcionales de Cox es una herramienta fundamental en la informática médica para el análisis de supervivencia, permitiendo evaluar la relación entre el tiempo transcurrido hasta un evento y un conjunto de variables predictoras. A diferencia de los modelos paramétricos, el modelo de Cox es **semiparamétrico**, ya que no requiere especificar la forma de la distribución del tiempo de supervivencia basal ($\lambda_0(t)$), lo que lo hace extremadamente robusto en aplicaciones clínicas.


### Ejemplo de Aplicación en R

Para implementar este modelo en R, se utiliza la biblioteca `survival`, la cual contiene las funciones esenciales `Surv()` para crear el objeto de supervivencia y `coxph()` para ajustar el modelo.

A continuación, se presenta un ejemplo utilizando el conjunto de datos `addicts`, el cual estudia la permanencia de pacientes en clínicas de tratamiento de adicciones basándose en variables como la dosis de metadona y antecedentes penales.

#### Código en R:

```r
# 1. Cargar la biblioteca necesaria
library(survival)

# 2. Cargar los datos (suponiendo que el archivo está disponible en el entorno)
# El dataset 'addicts' contiene: survt (tiempo), status (evento), 
# prison (antecedentes: 1=sí, 0=no) y dose (dosis de metadona)
load("addicts.rda") 

# 3. Creación del objeto de supervivencia
# 'survt' es el tiempo de seguimiento y 'status == 1' indica que el evento ocurrió
Y <- Surv(addicts$survt, addicts$status == 1)

# 4. Ajuste del modelo de Cox
# Evaluamos el efecto de antecedentes penales (prison), dosis (dose) y la clínica (clinic)
modelo_cox <- coxph(Y ~ prison + dose + clinic, data = addicts)

# 5. Resumen del modelo e interpretación científica
summary(modelo_cox)
```

#### Interpretación de los Resultados

Al ejecutar el comando `summary()`, el software proporciona varios componentes críticos para el análisis médico-informático:

1.  **Coeficientes ($\beta$):** Indican el cambio en el logaritmo del riesgo por cada unidad de incremento en la variable.
2.  **Hazard Ratio ($e^\beta$):** Es la medida de efecto fundamental. Si $HR > 1$, la variable aumenta el riesgo del evento (factor de riesgo); si $HR < 1$, disminuye el riesgo (factor protector).
    *   *Ejemplo:* Un coeficiente de 0.3266 para `prison` se traduce en un $HR = e^{0.3266} \approx 1.386$, lo que significa que los pacientes con antecedentes penales tienen un 38.6% más de riesgo de abandonar el tratamiento en cualquier momento dado en comparación con quienes no los tienen.
3.  **Significancia Estadística:** El valor $p$ (basado en el test de Wald) determina si el efecto observado es estadísticamente significativo (usualmente $p < 0.05$).

#### Validación del Supuesto de Riesgos Proporcionales

Una fase crítica es verificar que el efecto de las covariables sea constante en el tiempo. En R, esto se evalúa mediante los residuos de Schoenfeld con la función `cox.zph()`.

```r
# Prueba de la asunción de riesgos proporcionales
test_ph <- cox.zph(modelo_cox)
print(test_ph)

# Representación gráfica: una pendiente distinta de cero sugiere violación del supuesto
plot(test_ph)
```

Si el valor $p$ global del test es significativo, el supuesto de proporcionalidad se ha violado, y el informático médico debería considerar alternativas como el uso de variables dependientes del tiempo o un modelo de Cox estratificado.

<br />

### Ejemplo de Aplicación en Python

El ecosistema de **Python** ofrece bibliotecas robustas para este fin. A continuación, se presenta un ejemplo de aplicación utilizando la biblioteca `lifelines` (estándar de oro para análisis de supervivencia en Python) y `pandas` para la gestión de datos.

Utilizaremos el conjunto de datos **"addicts"** (comúnmente citado en las fuentes para comparar clínicas de tratamiento de adicciones). Las variables clave son `survt` (tiempo), `status` (evento) y covariables como `prison` (antecedentes) y `dose` (dosis de metadona).

```python
import pandas as pd
from lifelines import CoxPHFitter

# 1. Carga y preparación de datos (Basado en la estructura de ADDICTS)
# Supongamos un DataFrame 'df' con columnas: 'survt', 'status', 'prison', 'dose'
data = {
    'survt':, # Tiempos de seguimiento
    'status':,              # 1=Evento, 0=Censurado
    'prison':,              # Antecedentes penales
    'dose':          # Dosis de metadona
}
df = pd.DataFrame(data)

# 2. Inicialización y ajuste del modelo
cph = CoxPHFitter()
cph.fit(df, duration_col='survt', event_col='status')

# 3. Presentación de resultados estadísticos
cph.print_summary()

# 4. Predicción de curvas de supervivencia para nuevos pacientes
new_patients = pd.DataFrame({
    'prison':,
    'dose':
})
cph.predict_survival_function(new_patients).plot()
```

#### Interpretación de Resultados Médicos
Al igual que en las implementaciones de R o SPSS, el parámetro más crítico es el **Hazard Ratio (HR)**, obtenido al calcular $e^\beta$ para cada coeficiente:

1.  **Interpretación del HR:** Un $HR > 1$ indica un factor de riesgo (acorta el tiempo hasta el evento), mientras que un $HR < 1$ indica un factor protector.

2.  **Ejemplo Clínico:** Si el coeficiente para la variable `prison` fuera 0.326, el $HR$ sería $e^{0.326} \approx 1.38$. Esto significa que los pacientes con antecedentes penales tienen un 38% más de riesgo de abandonar el tratamiento en cualquier momento dado en comparación con aquellos sin antecedentes, ajustando por la dosis de metadona.

3.  **Significancia:** El modelo proporciona valores $p$ (basados en el test de Wald) para determinar si la asociación es estadísticamente significativa.

#### Validación del Supuesto de Riesgos Proporcionales
En Python, se debe verificar que el efecto de las covariables sea constante en el tiempo utilizando los residuos de Schoenfeld. La biblioteca `lifelines` permite esto con el método `cph.check_assumptions(df)`. Si el supuesto se viola (las curvas de riesgo se cruzan), se debe considerar un modelo de Cox estratificado o con variables dependientes del tiempo.


## Aplicación en genómica

En el ámbito de la informática médica y la bioinformática, el **Modelo de Riesgos Proporcionales de Cox** se ha consolidado como la metodología estándar para analizar datos de tiempo hasta un evento (*time-to-event*), permitiendo evaluar la influencia de variables genéticas y clínicas en la supervivencia o progresión de una enfermedad. A diferencia de los modelos paramétricos, el modelo de Cox es **semiparamétrico**, ya que no requiere especificar la distribución del tiempo de supervivencia basal ($h_0(t)$), lo que le confiere una robustez excepcional para tratar la variabilidad intrínseca de los sistemas biológicos.


En las investigaciones genómicas contemporáneas, el modelo de Cox se aplica para discernir el impacto de variantes moleculares sobre desenlaces clínicos.

1.  **Estudios de Asociación de Genoma Completo (GWAS):** Se utiliza para relacionar polimorfismos de un solo nucleótido (SNPs) con el tiempo hasta la aparición de patologías complejas, como enfermedades cardiovasculares o cáncer.
2.  **Firmas de Expresión Génica:** En oncología, el modelo evalúa cómo los niveles de ARN mensajero, medidos mediante microarrays o secuenciación, funcionan como predictores del tiempo de vida de los pacientes.
3.  **Análisis de Haplotipos:** Cuando la fase alélica es incierta, se pueden emplear métodos de imputación múltiple para integrar la incertidumbre haplotípica como covariable en el modelo de Cox.

### Desafíos y Soluciones en Alta Dimensionalidad
Un problema recurrente en genómica es la **alta dimensionalidad**, donde el número de predictores ($p$) supera con creces el número de observaciones ($n$), invalidando los métodos de estimación tradicionales. Para mitigar este obstáculo y evitar el sobreajuste (*overfitting*), se aplican técnicas de **regularización** o penalización.

*   **LASSO-Cox:** Introduce una penalización $L_1$ que fuerza a que muchos coeficientes sean exactamente cero, realizando simultáneamente una selección de variables críticas para la supervivencia.
*   **Ridge-Cox:** Utiliza una penalización $L_2$ que "encoge" los coeficientes hacia cero sin eliminarlos, lo cual es útil cuando existe una alta correlación (multicolinealidad) entre los marcadores genéticos.

### Interpretación y Validación
La medida de efecto fundamental es el **Hazard Ratio (HR)**, calculado como $e^{\beta}$. Un $HR > 1$ indica que la presencia de una variante o una alta expresión génica actúa como un factor de riesgo, acortando el tiempo hasta el evento; mientras que un $HR < 1$ sugiere un efecto protector.

Es imperativo validar el **supuesto de riesgos proporcionales**, el cual asume que el efecto de las covariables es constante a lo largo del tiempo. En genómica, si este supuesto se viola (por ejemplo, si un gen solo afecta el riesgo en etapas tempranas), se debe recurrir al **modelo de Cox extendido**, el cual incorpora interacciones de las variables con el tiempo mediante funciones de tipo *heaviside* o términos dependientes del tiempo.

En el entorno de programación **R**, estas tareas se ejecutan principalmente mediante la biblioteca `survival`, utilizando la función `coxph()` para el ajuste de los modelos y `cox.zph()` para la validación del supuesto de proporcionalidad.

