---
id: caso-riesgo
title: Análisis de riesgo
sidebar_label: Análisis de riesgo
sidebar_position: 4
---



## Análisis de Riesgos Proporcionales (Modelo de Cox)
**Problema:** Evaluar el impacto simultáneo de múltiples covariables (ej. edad y capacidad funcional) sobre la tasa de fallo en pacientes con cáncer de ovario, manejando datos censurados.

**Planteamiento Matemático:** La función de riesgo (*hazard*) se modela como:

```math
\lambda(t|Z) = \lambda_0(t) \exp(\beta_1 Z_1 + \dots + \beta_p Z_p)
```

Donde $\lambda_0(t)$ es el riesgo basal y $\exp(\beta)$ representa el *Hazard Ratio* (HR), asumiendo que el efecto de las covariables es constante en el tiempo.

**Ejemplo en R:**
```r
library(survival)
data(ovarian)

# Ajuste del modelo de Cox ajustado por edad y ecog.ps (estado funcional)
fit_cox <- coxph(Surv(futime, fustat) ~ age + ecog.ps, data = ovarian)

# Obtención de los Hazard Ratios y su significancia
summary(fit_cox)
```
