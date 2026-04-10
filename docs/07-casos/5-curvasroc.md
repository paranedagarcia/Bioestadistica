---
id: caso-curvas
title: Curvas ROC
sidebar_label: "Curvas ROC"
sidebar_position: 5
---




<br />
#### 📝 Programación:
<Tabs>
<TabItem value="roc" label="Antecedentes" default>
## Evaluación de la Capacidad Discriminatoria (Análisis de Curvas ROC)

**Problema:** Validar un nuevo marcador biológico para predecir la supervivencia a un año en pacientes con cirrosis biliar primaria (CBP).

**Fundamento:** La curva ROC (*Receiver Operating Characteristic*) grafica la Sensibilidad (Tasa de Verdaderos Positivos) frente al complementario de la Especificidad (1 - Tasa de Verdaderos Negativos) para todos los posibles puntos de corte de un biomarcador.
</TabItem>
<TabItem value="python" label="Python" default>
```python showLineNumbers
# Ejemplo en Python

```

</TabItem>
<TabItem value="r" label="R">

```r showLineNumbers
# Ejemplo en R
library(survivalROC)
data(mayo) # Datos de la Clínica Mayo sobre CBP

# Generación de curva ROC para predicción a 365 días usando 'mayoscore4'
roc_mayo <- survivalROC(Stime = mayo$time, status = mayo$censor, 
                        marker = mayo$mayoscore4, predict.time = 365, method = "KM")

# Graficar la curva y mostrar el Área Bajo la Curva (AUC)
plot(roc_mayo$FP, roc_mayo$TP, type = "l", xlab = "1 - Especificidad", ylab = "Sensibilidad")
abline(0, 1, lty = 2)
text(0.6, 0.2, paste("AUC =", round(roc_mayo$AUC, 3)))
```
</TabItem>
</Tabs><br />
