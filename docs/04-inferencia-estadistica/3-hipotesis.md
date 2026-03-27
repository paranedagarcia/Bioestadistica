---
id: inferencia-hipotesis
title: Hipótesis
sidebar_label: Prueba de hipótesis
sidebar_position: 3
---



# 📌 Pruebas de Hipótesis

### Hipótesis, Hipótesis Nula y p-value

Las hipótesis y sus pruebas son características del método cientifico con que se han desarrollado los nuevos conocimientos a lo largo de la historia. Iniciando con la observación de los fenomenos que nos rodean, estos han planteado problemas a resolver, que generan una pregunta o problema de investigación.

<br />

## 1. Hipótesis

Una **hipótesis estadística** es una afirmación o suposición formal sobre una característica de la población que queremos evaluar a partir de datos muestrales.

**Ejemplos de hipótesis:**

* “El promedio de ingresos de un cliente supera $1.000.000.”
* “La tasa de clics de la nueva versión de una campaña es mayor que la de la versión antigua.”
* “La media de la presión arterial después de un tratamiento disminuye.”

**Rol dentro del análisis:**

* Es el **planteamiento científico** o analítico que se quiere contrastar.
* Se formula antes de ver los resultados.

<br />

## 2. Hipótesis Nula (H₀)

La **hipótesis nula** es la afirmación que se asume como cierta inicialmente.
Representa la **situación base**, el **no cambio**, la **ausencia de efecto** o la **igualdad**. Esta la generalidad de nuestra hipótesis inicial y se establece en un formato neutro respecto de ella. No niega ni afirma.

En pruebas estadísticas:

* Es el punto de comparación.
* Es la hipótesis que se intenta rechazar mediante evidencia.

**Ejemplos típicos:**

* H₀: el promedio de ingresos **es igual** a $1.000.000.
* H₀: la tasa de clics nueva **es igual** a la antigua.
* H₀: la presión arterial promedio **no cambia** tras el tratamiento.

**Idea clave:**

:::note
No se busca demostrar la hipótesis nula; se busca evaluar si los datos proveen evidencia suficiente para descartarla.
:::

<br />

## 3. Hipótesis Alternativa (H₀)

<br />

## 4. p-value (valor-p)

El **p-value** es la probabilidad de observar un estadístico igual o más extremo que el obtenido en los datos **asumiendo que la hipótesis nula H₀ es verdadera**.

Formalmente:

> Es una medida de la evidencia contra la hipótesis nula.

Decisión típica con α = 0.05:
- p ≤ 0.05 → Rechazar H₀  
- p > 0.05 → No rechazar H₀  

Interpretación correcta:

* **p-value pequeño** → datos muy improbables bajo H₀ → evidencia contra H₀.
* **p-value grande** → datos compatibles con H₀ → no hay evidencia suficiente para rechazarla.

**NO significa:**

* No es la probabilidad de que H₀ sea verdadera.
* No mide tamaño del efecto.
* No reemplaza el razonamiento científico.

<br />

## 🔗 Relación entre los tres conceptos

1. **Planteamos una hipótesis (científica):** queremos evaluar un supuesto sobre la población.

2. **Formulamos H₀ (hipótesis nula):** especifica que *no hay diferencia* o *no hay efecto*.

3. **Calculamos el p-value:** para medir si los datos entregan evidencia suficiente para rechazar H₀.

**Decisión típica (con nivel de significancia α = 0.05):**

* Si **p ≤ 0.05** → se **rechaza H₀** → hay evidencia estadística del efecto.

* Si **p > 0.05** → **no se rechaza H₀** → no hay evidencia suficiente.

<br />

## 💡 Ejemplo sencillo aplicado (A/B Testing)

Supongamos que queremos saber si la nueva campaña (B) tiene mayor tasa de clics que la versión anterior (A).

#### 1. Hipótesis científica:

> “La campaña B aumenta la tasa de clics.”

#### 2. Hipótesis nula:

> H₀: CTR-B = CTR-A (no hay diferencia)

#### 3. Prueba estadística:

Se calcula el **p-value** en base a las tasas de clics observadas.

#### 4. Interpretación:

* Si *p-value = 0.01* → probabilidad de observar esta diferencia si H₀ fuera cierta es 1% → **rechazamos H₀** (B es significativamente mejor).

* Si *p-value = 0.22* → datos compatibles con que no hay diferencia → **no se rechaza H₀**.

#### Ejemplo en Python:
```python
import numpy as np
from scipy import stats

# Grupo A y Grupo B simulados
group_A = np.random.normal(10, 2, 100)
group_B = np.random.normal(11, 2, 100)

# Prueba t independiente
t_stat_ab, p_value_ab = stats.ttest_ind(group_A, group_B)

t_stat_ab, p_value_ab
````
Si el p-value es pequeño, concluimos que la diferencia entre A y B es estadísticamente significativa.

<br />

## 📘 Cuándo se usan en Ciencia de Datos

* Validación de modelos (supuestos de normalidad, independencia, homocedasticidad).
* Pruebas A/B para productos digitales.

* Experimentos clínicos.

* Manufactura y control estadístico de calidad.

* Estudios socioeconómicos.

* Modelos causales.

* Evaluación de features o comparaciones entre grupos.

<br />

### ✔️ Resumen Tabular

| Concepto                | Definición                                                                | Función                                   |
| ----------------------- | ------------------------------------------------------------------------- | ----------------------------------------- |
| **Hipótesis**           | Afirmación a evaluar con datos                                            | Plantea el supuesto científico            |
| **Hipótesis nula (H₀)** | Afirmación base que representa “sin efecto” o “igualdad”                  | Punto de comparación; se intenta rechazar |
| **p-value**             | Probabilidad de obtener datos tan extremos suponiendo que H₀ es verdadera | Mide evidencia contra H₀                  |

---