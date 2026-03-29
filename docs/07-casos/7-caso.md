---
id: casos-potencia
title: Cálculo de Potencia
sidebar_label: Cálculo de Potencia
sidebar_position: 7
---


<Tabs>
<TabItem value="potencia" label="Antecedentes" default>
## 6. Diseño de Estudios y Cálculo de Potencia (Power Analysis)
**Problema:** Determinar el tamaño muestral necesario para detectar una diferencia clínicamente relevante en la media de una variable continua (ej. presión arterial) entre dos grupos, evitando errores tipo II.

**Planteamiento Matemático:** El cálculo del tamaño de muestra $n$ para comparar dos medias con una potencia $1-\beta$ y nivel de significancia $\alpha$ se basa en:

```math
n = \frac{2\sigma^2(z_{1-\alpha/2} + z_{1-\beta})^2}{\Delta^2}
```

Donde $\sigma$ es la desviación estándar común y $\Delta$ es la diferencia mínima que se desea detectar.
</TabItem>
  <TabItem value="python" label="Python" default>
```python
# Ejemplo de Covid-19 basado en Python

```

</TabItem>
<TabItem value="r" label="R">
**Ejemplo en R:**
```r
# Cálculo de potencia para un test t de dos muestras
# Diferencia esperada (d) de 0.5 desviaciones estándar
library(pwr)

pwr.t.test(d = 0.5, sig.level = 0.05, power = 0.8, 
           type = "two.sample", alternative = "two.sided")

# El resultado indicará el 'n' necesario por cada grupo
```
</TabItem>
</Tabs>