---
id: caso-supervivencia
title: Análisis de supervivencia
sidebar_label: "Análisis de supervivencia"
sidebar_position: 2
---

<br />
#### 📝 Programación:
<Tabs>
<TabItem value="supervivencia" label="Antecedentes" default>
## Estimación de Probabilidad de Supervivencia (Método de Kaplan-Meier)
**Problema:** Determinar la eficacia de un tratamiento de mantenimiento en pacientes con leucemia mielógena aguda (LMA) midiendo el tiempo hasta la recaída.

**Planteamiento Matemático:** El estimador de Kaplan-Meier se define como:

```math
\hat{S}(t) = \prod_{t_i \le t} \left(1 - \frac{d_i}{n_i}\right)
```

Donde $d_i$ es el número de eventos (muertes/recaídas) en el tiempo $t_i$, y $n_i$ es el número de sujetos en riesgo justo antes de $t_i$.

</TabItem>
<TabItem value="python" label="Python" default>
```python showLineNumbers
# Ejemplo de Covid-19 basado en Python

```

</TabItem>
<TabItem value="r" label="R">
**Ejemplo en R:**
```r showLineNumbers
library(survival)
data(aml) # Datos de supervivencia en leucemia

# Creación del objeto de supervivencia (tiempo, evento)
# x indica si el tratamiento se mantuvo o no
fit_km <- survfit(Surv(time, status) ~ x, data = aml)

# Visualización de la curva de supervivencia
plot(fit_km, col = c("blue", "red"), lty = 1:2, 
     xlab = "Semanas", ylab = "Probabilidad de Supervivencia")
legend("topright", legend = c("Mantenido", "No mantenido"), col = c("blue", "red"), lty = 1:2)
```

</TabItem>
</Tabs><br />



