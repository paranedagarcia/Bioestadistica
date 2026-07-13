---
id: regresion-logistica
title: Regresión logística
sidebar_label: "Regresión logística"
sidebar_position: 2
description: Predicción de desenlaces dicotómicos (ej. vive/muere) mediante el cálculo de Odds Ratios (OR)
---

La **Regresión Logística Binaria** es un modelo estadístico perteneciente a la familia de los **Modelos Lineales Generalizados (GLM)**, diseñado específicamente para modelar la probabilidad de ocurrencia de un evento dicotómico (como presencia/ausencia de enfermedad, éxito/fracaso o vida/muerte) en función de uno o más predictores. A diferencia de la regresión lineal, que asume una respuesta continua y normal, la regresión logística maneja una variable dependiente que sigue una distribución binomial y utiliza una transformación no lineal para garantizar que las predicciones se mantengan dentro del rango estrictamente probabilístico.

### Fundamentación Matemática y Conceptual

En la investigación biomédica, cuando la respuesta $Y$ es binaria ($Y \in \{0, 1\}$), el valor esperado de $Y$ dado un conjunto de predictores $X$ equivale a la probabilidad del evento, denotada habitualmente como $\pi$. El uso de Mínimos Cuadrados Ordinarios (**MCO**) en este escenario es inadecuado porque violaría los supuestos de normalidad y homocedasticidad, pudiendo predecir "probabilidades" imposibles (menores a 0 o mayores a 1).

#### A. La Función de Enlace Logit
Para linealizar la relación entre la probabilidad y los predictores, se utiliza la **función de enlace logit**, que es el logaritmo natural de la ventaja o *odds* ($\frac{\pi}{1-\pi}$):

```math
\text{logit}(\pi) = \ln\left( \frac{\pi}{1 - \pi} \right) = \beta_0 + \beta_1 X_1 + \beta_2 X_2 + \dots + \beta_k X_k
```

**Significado de sus componentes:**
*   **$\pi$**: Probabilidad de ocurrencia del evento de interés ($Y=1$).
*   **$\frac{\pi}{1-\pi}$**: ***Odds*** o razón de momios; representa cuántas veces es más probable que el evento ocurra frente a que no ocurra.
*   **$\beta_0$**: Intercepto o log-*odds* basal cuando todos los predictores son cero.
*   **$\beta_j$**: Coeficiente de regresión parcial que cuantifica el cambio en el log-*odds* por cada unidad de incremento en $X_j$, manteniendo constantes las demás variables.

#### B. La Función Logística (Sigmoide)
Para recuperar la probabilidad $\pi$ en su escala original, se aplica la función inversa del logit, lo que genera una curva en forma de "S" característica:

```math
\pi = \frac{e^{\beta_0 + \sum \beta_j X_j}}{1 + e^{\beta_0 + \sum \beta_j X_j}} = \frac{1}{1 + e^{-(\beta_0 + \sum \beta_j X_j)}}
```

### Estimación e Interpretación de Parámetros

Los parámetros $\beta$ no se estiman por MCO, sino mediante **Estimación por Máxima Verosimilitud (MLE)**, un procedimiento iterativo que busca los valores de los parámetros que maximizan la probabilidad de haber observado los datos de la muestra.

Dado que la escala de log-*odds* es poco intuitiva para la clínica, se reportan habitualmente los **Odds Ratios (OR)**, calculados como $e^{\beta_j}$:
*   **$OR > 1$**: El predictor se asocia con un incremento en la probabilidad del evento (factor de riesgo).
*   **$OR < 1$**: El predictor se asocia con una disminución en la probabilidad (factor protector).
*   **$OR = 1$**: No existe asociación detectable.

---

### Implementación en R: Ejemplos Prácticos

En R, la función estándar para ajustar estos modelos es `glm()`, especificando el argumento `family = binomial(link = "logit")`.

#### Ejemplo 1: Determinantes del Bajo Peso al Nacer
Utilizaremos el dataset **`birthwt`** (paquete `MASS`), que registra factores de riesgo en 189 nacimientos.
**Objetivo:** Predecir el bajo peso (`low`: 1=Sí, 0=No) basado en el peso materno previo (`lwt`) y el tabaquismo (`smoke`).

```R
# 1. Carga de librerías y datos de salud reales
if(!require(MASS)) install.packages("MASS")
library(MASS)

data("birthwt")
df <- birthwt

# 2. Análisis Exploratorio de Datos (EDA) y Preparación
# Convertimos las variables categóricas a factores para su correcto modelado
df$low   <- factor(df$low, levels = c(0, 1), labels = c("Normal", "BajoPeso"))
df$smoke <- factor(df$smoke, levels = c(0, 1), labels = c("No", "Si"))

summary(df[, c("low", "age", "lwt", "smoke")])

# 3. Ajuste del Modelo de Regresión Logística Múltiple
# La función glm() requiere especificar family = binomial para invocar el enlace logit
modelo_log <- glm(low ~ age + lwt + smoke, data = df, family = binomial(link = "logit"))

# 4. Inspección de Resultados Estadísticos Esenciales
summary(modelo_log)

# 5. Extracción de Coeficientes y Cálculo de Odds Ratios (OR) con sus IC 95%
coef_regresion <- coef(modelo_log)
intervalos_ic  <- confint.default(modelo_log) # IC basados en el error estándar asintótico (Wald)

# Construcción de la tabla de estimadores epidemiológicos (exponenciando los betas)
tabla_or <- exp(cbind(OR = coef_regresion, intervalos_ic))
print(tabla_or)
```
```raw
# resultado
Loading required package: MASS
                   OR     2.5 %     97.5 %
(Intercept) 3.9283727 0.5381107 28.6783220
age         0.9617559 0.9020038  1.0254663
lwt         0.9879348 0.9761269  0.9998856
smokeSi     1.9557304 1.0325744  3.7042189
```

*Interpretación típica:* Un OR para `smokeSi` de 1.96 indica que las madres fumadoras tienen aproximadamente 1.96 veces más probabilidades de tener un neonato con bajo peso que las no fumadoras, ajustando por el peso materno.

#### Ejemplo 2: Diagnóstico de Diabetes (Población Pima)
Utilizando el dataset **`pima`** (paquete `faraway`), que analiza 768 sujetos para predecir diabetes (`f`) según su Índice de Masa Corporal (`bmi`).

```R
library(faraway)
data(pima)

# Modelo para predecir diabetes según IMC
modelo_diabetes <- glm(test ~ bmi + age, data = pima, family = binomial)

# Probabilidades predichas para nuevos casos
nuevos_datos <- data.frame(bmi = c(25, 35), age = c(30, 45))
predict(modelo_diabetes, nuevos_datos, type = "response")
```
```raw
# resultado
        1         2 
0.1708942 0.5218144
```
El uso de `type = "response"` devuelve el resultado en la escala de probabilidad ($$), permitiendo una aplicación clínica directa del modelo para el triage o evaluación de riesgo.

### 4. Evaluación de la Validez y Diagnóstico

El análisis no termina en el ajuste; es imperativo validar el modelo:
1.  **Significancia de los Coeficientes:** Se utiliza la **prueba de Wald ($z$)**; un valor $p < 0.05$ permite rechazar $H_0: \beta_j = 0$.
2.  **Bondad de Ajuste Global:** Se compara la **Devianza Nula** (modelo sin predictores) contra la **Devianza Residual**. Una reducción significativa sugiere que los predictores aportan información valiosa.
3.  **Parsimonia (AIC):** El **Criterio de Información de Akaike** ayuda a comparar modelos; valores menores indican un mejor equilibrio entre precisión y simplicidad.
4.  **Capacidad Discriminativa:** Se recomienda el uso de la **Curva ROC** y el cálculo del área bajo la curva (**AUC**), donde valores cercanos a 1 indican una clasificación perfecta entre sujetos sanos y enfermos.

<br />
#### 💻 Código:
<Tabs>
<TabItem value="mnp" label="Antecedentes" default>
<div class="alert alert--primary">
**Regresión Logística Binaria**<br />
En este ejemplo se utilizará el conjunto de datos Pima Indians Diabetes, ampliamente utilizado para clasificación binaria en salud. El objetivo es predecir si una paciente presenta diabetes (Outcome) a partir de variables clínicas.

La variable respuesta será:

* Outcome = 1: diabetes.
* Outcome = 0: no diabetes.
</div>
</TabItem>
<TabItem value="mnp-python" label="Pyhton" default>
```python showLineNumbers
# Implementación en Python
```
</TabItem>
<TabItem value="mnp-r" label="R" default>
```r showLineNumbers
# Implementación en R
```
</TabItem>
</Tabs>
<br />