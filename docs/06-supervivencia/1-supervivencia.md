---
id: supervivencia
title: Análisis de supervivencia
sidebar_label: "Análisis de supervivencia"
sidebar_position: 1
---
Manejo de datos censurados. Estimador de Kaplan-Meier y modelo de riesgos proporcionales de Cox



### Introducción y Definición

En el ámbito de la investigación biomédica, nos encontramos frecuentemente con datos cuya característica definitoria no es solo "si ocurre" un fenómeno, sino "**cuándo ocurre**". El análisis de supervivencia se define formalmente como un conjunto de procedimientos estadísticos diseñados para modelar variables de respuesta cuya naturaleza es el tiempo transcurrido hasta la aparición de un evento de interés. En el rigor académico, este tiempo se denomina **tiempo de falla** o tiempo de supervivencia, y el suceso terminal se identifica genéricamente como **falla**, aunque este pueda representar desenlaces positivos como la recuperación clínica o el alta hospitalaria.

A diferencia de la regresión lineal convencional, donde la variable dependiente es continua y completamente observada, el análisis de supervivencia enfrenta un desafío estocástico único: la **censura**. La censura ocurre cuando disponemos de información parcial sobre el tiempo de supervivencia de un sujeto, pero desconocemos el momento exacto del evento. El escenario más común es la **censura a la derecha**, la cual se manifiesta cuando el estudio concluye antes de que el paciente experimente el evento, cuando el sujeto se retira del protocolo o cuando se pierde el seguimiento clínico.

### Fundamentación Matemática: Funciones de Supervivencia y Riesgo

Para capturar la dinámica temporal de una cohorte, el investigador debe dominar dos funciones matemáticas interrelacionadas:

1.  **Función de Supervivencia ($S(t)$):** Representa la probabilidad de que un individuo sobreviva más allá de un tiempo específico $t$. Matemáticamente se expresa como:
    ```math
    S(t) = P(T > t)
    ```
    *Donde:*
    *   $T$: Variable aleatoria que denota el tiempo de supervivencia del sujeto.
    *   $t$: Valor específico de tiempo de interés.
    *   $P$: Probabilidad condicional.
    En el tiempo inicial ($t=0$), la función es siempre igual a 1, y decrece teóricamente hacia 0 conforme el tiempo tiende al infinito.

2.  **Función de Riesgo o Hazard ($h(t)$):** Describe el potencial instantáneo por unidad de tiempo para que ocurra el evento, dado que el individuo ha sobrevivido hasta el instante $t$. Su fórmula se define mediante el límite:
    $$h(t) = \lim_{\Delta t \to 0} \frac{P(t \le T < t + \Delta t | T \ge t)}{\Delta t}$$
    Mientras que $S(t)$ se enfoca en la "permanencia" en el estado inicial, $h(t)$ cuantifica la "fuerza de mortalidad" o velocidad del cambio en un punto dado del tiempo.

### Importancia en Salud Pública

La relevancia de este análisis radica en su capacidad para transformar datos hospitalarios crudos en inteligencia predictiva. Es la herramienta estándar para:

*   **Evaluación de Eficacia Terapéutica:** Comparar curvas de supervivencia entre grupos de tratamiento y placebo en ensayos clínicos fase III.

*   **Investigación de Pronóstico:** Determinar cómo variables basales (biomarcadores, edad, genómica) influyen en el tiempo hasta la progresión de una patología.

*   **Gestión de Recursos:** Optimizar el flujo de pacientes mediante el modelado de tiempos de estancia hospitalaria.

### Metodologías de Estimación

Para resolver estas funciones, se utilizan principalmente dos modelos:

*   **Estimador de Kaplan-Meier:** Un método no paramétrico que genera una función escalonada de la supervivencia basada en el producto de probabilidades condicionales en cada tiempo de falla observado. Su fórmula recursiva es: 

```math
\hat{S}(t_j) = \hat{S}(t_{j-1})(1 - \frac{d_j}{n_j})
```
, donde $d_j$ son los eventos y $n_j$ los sujetos en riesgo.

*   **Modelo de Riesgos Proporcionales de Cox:** Un enfoque semiparamétrico extremadamente popular que permite evaluar el efecto de múltiples predictores simultáneamente sin especificar la distribución de base del tiempo de supervivencia. Se define como:
    
    ```math
    h(t, X) = h_0(t) e^{\sum \beta_i X_i}
    ```

    Donde $h_0(t)$ es el riesgo basal y el componente exponencial contiene los coeficientes de regresión ($\beta$) que estiman el **Hazard Ratio (HR)**.

### Ejemplos Prácticos de Aplicación

1.  **Oncología (Leucemia):** Modelar el tiempo de remisión en pacientes tratados con 6-mercaptopurina frente a un grupo control. Aquí, el evento es la recaída y la censura ocurre con los pacientes que permanecen en remisión al cerrar el estudio.

2.  **Cardiología (Trasplante de Corazón):** Análisis de la supervivencia de pacientes desde el momento en que entran en lista de espera hasta el fallecimiento, permitiendo evaluar el beneficio real de la intervención quirúrgica ajustando por la "variable de tiempo de espera".

3.  **Investigación Epidemiológica (SIDA):** Seguimiento de cohortes para determinar el tiempo hasta la seroconversión tras la exposición al virus, utilizando modelos de Cox para identificar factores de riesgo como la carga viral o mutaciones genéticas.

El análisis de supervivencia no es simplemente una técnica descriptiva, sino un marco inferencial robusto que permite a la informática médica capturar la esencia misma de los procesos biológicos: su evolución irreversible a través del tiempo.

<br />
#### 💻 Código:
<Tabs>
<TabItem value="mnp" label="Antecedentes" default>
<div class="alert alert--primary">
**Análisis de supervivencia: Ensayo de Cáncer de Pulmón (Dataset "Veteran")**<br />
Utilizaremos el dataset real Veteran's Administration Lung Cancer Trial. Este estudio analizó a 137 pacientes con cáncer de pulmón avanzado, comparando un tratamiento estándar frente a uno experimental.

- Variable de tiempo (T): Días de supervivencia.
- Evento (d): Muerte (1 = muerte, 0 = censurado).
- Predictores: Tipo de tratamiento, edad, tipo de célula tumoral y estado funcional (Karnofsky score)

En Python, el estándar para investigación biomédica incluye las librerías lifelines y scikit-survival.

En R, la librería survival es el estándar de oro para este tipo de inferencia
</div>
</TabItem>
<TabItem value="mnp-python" label="Pyhton" default>
```python showLineNumbers
# Implementación en Python
# pip install scikit-survival

import pandas as pd
import matplotlib.pyplot as plt
from lifelines import KaplanMeierFitter, CoxPHFitter
from sksurv.datasets import load_veterans_lung_cancer

# 1. Carga de datos reales
data_x, data_y = load_veterans_lung_cancer()
df = data_x.copy()
df['Status'] = [x for x in data_y]  # Evento (Muerte)
df['Time'] = [x[21] for x in data_y]    # Días

# 2. Estimación de Kaplan-Meier por grupo de Tratamiento
kmf = KaplanMeierFitter()
for name, grouped_df in df.groupby('Treatment'):
    kmf.fit(grouped_df['Time'], grouped_df['Status'], label=name)
    kmf.plot_survival_function()

plt.title("Curvas de Supervivencia KM: Tratamiento Estándar vs Test")
plt.xlabel("Tiempo (Días)")
plt.ylabel("Probabilidad de Supervivencia S(t)")
plt.show()

# 3. Modelo de Regresión de Cox (Multivariante)
# Convertimos variables categóricas a dummies
df_numeric = pd.get_dummies(df, drop_first=True)
cph = CoxPHFitter()
cph.fit(df_numeric, duration_col='Time', event_col='Status')
cph.print_summary()  # Muestra los Hazard Ratios (exp(coef))

```
</TabItem>
<TabItem value="mnp-r" label="R" default>
```r showLineNumbers
# Implementación en R
library(survival)

# 1. Carga del dataset integrado
data(veteran)

# 2. Creación del objeto de supervivencia (Surv)
# t = time, d = status
Y <- Surv(veteran$time, veteran$status == 1) 

# 3. Estimación de Kaplan-Meier y Gráfico
km_fit <- survfit(Y ~ trt, data = veteran)
plot(km_fit, col = c("black", "red"), lty = 1:2,
     main = "Análisis de Supervivencia: Veteran Study",
     xlab = "Días", ylab = "S(t)")
legend("topright", legend = c("Estándar", "Test"), col = c("black", "red"), lty = 1:2)

# 4. Test de Log-rank (Comparación estadística de curvas)
surv_diff <- survdiff(Y ~ trt, data = veteran)
print(surv_diff) # Evalúa si las curvas son significativamente distintas

# 5. Modelo de Riesgos Proporcionales de Cox
cox_mod <- coxph(Y ~ trt + age + karno + celltype, data = veteran)
summary(cox_mod) # Proporciona Coeficientes, Hazard Ratios y p-valores

```
</TabItem>
</Tabs>
<br />
 **Interpretación Técnica de Resultados**

- **Curvas de Kaplan-Meier:** El gráfico resultante (descendente en forma de escalera) muestra cómo la probabilidad de supervivencia disminuye en cada evento de muerte observado. Si las curvas de ambos tratamientos se superponen o cruzan frecuentemente, es probable que no haya un beneficio clínico superior de un fármaco sobre otro en la muestra global.

- **Log-rank Test:** Proporciona un valor p. Si $p<0.05$, rechazamos la hipótesis nula de igualdad, concluyendo que existe una diferencia significativa en la supervivencia entre los grupos.

- **Hazard Ratio (HR):** En el modelo de Cox, un HR de 1.33 para el tratamiento experimental (test) sugeriría que este grupo tiene un 33% más de riesgo de muerte instantánea que el grupo estándar, tras ajustar por edad y estado funcional. Por el contrario, un $HR <1$ (como suele ocurrir con el Karnofsky score) indica un factor protector: a mayor puntuación funcional, menor riesgo de fallecimiento