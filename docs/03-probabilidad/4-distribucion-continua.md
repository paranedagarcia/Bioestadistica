---
id: distribucion-continua
title: "Distribuciones continua"
sidebar_label: "Distribución continua"
sidebar_position: 4
---

## Distribución normal

La **distribución de probabilidad normal**, también denominada distribución de Gauss o Gauss-Laplace, representa el modelo teórico más trascendental en la bioestadística y la informática médica. Su relevancia radica en que una vasta cantidad de variables biológicas y fenómenos naturales presentan un comportamiento empírico que puede ser modelado con precisión mediante esta función.

El primer registro histórico de la curva normal se remonta a 1733, cuando el matemático francés Abraham de Moivre buscaba una forma de simplificar el cálculo de probabilidades para la distribución binomial cuando el número de ensayos (n) era muy grande. De Moivre descubrió que, a medida que `n` aumenta, la forma de la distribución binomial se estabiliza y puede ser aproximada por una función continua. 

En 1809, Carl Friedrich Gauss derivó la distribución mientras analizaba errores en observaciones astronómicas. Propuso que los errores de medición —pequeños, independientes y aleatorios— tienden a compensarse entre sí y a agruparse alrededor de un valor central, formando la "teoría de los errores". Debido a su influyente trabajo, el modelo se conoce universalmente como la campana de Gauss.

Casi simultáneamente, Pierre-Simon Laplace amplió el concepto al formular el Teorema del Límite Central, demostrando que la suma de variables aleatorias independientes tiende a seguir una distribución normal, sin importar la distribución original de dichas variables.

A finales del siglo XIX, el estadístico inglés Karl Pearson popularizó el término "distribución normal" para referirse a este modelo, bajo la premisa de que representaba el comportamiento estándar o "típico" de la naturaleza,. No obstante, el propio Pearson admitió en sus años finales que el nombre era desafortunado, ya que sugería erróneamente que otras distribuciones eran "anormales".


### Definición y Caracterización Matemática

Se define como una distribución de probabilidad para una variable aleatoria continua $X$, cuya función de densidad de probabilidad (PDF) está determinada por la siguiente ecuación:

```math
f(x) = \frac{1}{\sigma\sqrt{2\pi}} e^{-\frac{1}{2}\left(\frac{x-\mu}{\sigma}\right)^2}
```

**Significado de sus componentes:**
*   **$x$:** El valor de la variable aleatoria (p. ej., nivel de glucemia, talla, peso).
*   **$\mu$ (Mu):** El parámetro de **localización** o centralización, que corresponde a la media aritmética de la población. Determina el centro de la "campana".
*   **$\sigma$ (Sigma):** El parámetro de **dispersión** o escala, que representa la desviación estándar poblacional. Cuanto menor sea su valor, más apuntada (leptocúrtica) será la curva; cuanto mayor sea, más aplanada (platicúrtica) se presentará.
*   **$\sigma^2$:** La varianza de la distribución.
*   **$e$:** La base de los logaritmos naturales ($\approx 2.71828$).
*   **$\pi$:** La constante matemática pi ($\approx 3.14159$).

### Propiedades Fundamentales

Para un análisis riguroso de datos clínicos, la distribución normal posee propiedades únicas:
1.  **Simetría:** La distribución es perfectamente simétrica respecto a su media $\mu$. Esto implica que el área a la derecha de la media es exactamente $0.5$ (50%) y a la izquierda es $0.5$ (50%).
2.  **Identidad de Medidas de Tendencia Central:** En un modelo puramente normal, la media, la mediana y la moda coinciden en el mismo valor central ($\mu$).
3.  **Naturaleza Asintótica:** La curva se extiende desde $-\infty$ hasta $+\infty$, aproximándose de forma continua al eje de las abscisas sin llegar nunca a tocarlo.
4.  **Puntos de Inflexión:** La curva cambia de concavidad a convexidad exactamente en los puntos $\mu - \sigma$ y $\mu + \sigma$.

### La Regla Empírica (68-95-99.7)

Uno de los mayores aportes prácticos de este modelo es la capacidad de cuantificar la proporción de la población que se encuentra a determinadas distancias de la media, medidas en unidades de desviación estándar:
*   El intervalo **$\mu \pm 1\sigma$** contiene aproximadamente el **68.26%** de las observaciones.
*   El intervalo **$\mu \pm 2\sigma$** (exactamente $1.96\sigma$) contiene aproximadamente el **95.44%** de las observaciones.
*   El intervalo **$\mu \pm 3\sigma$** contiene el **99.73%** de las observaciones.

### Estandarización y la Variable Normal Estándar ($Z$)

Dado que existe una familia infinita de distribuciones normales (una para cada combinación de $\mu$ y $\sigma$), se utiliza el proceso de **tipificación o estandarización** para convertir cualquier variable $X$ en una variable $Z$ con media $0$ y desviación estándar $1$.

```math
Z = \frac{X - \mu}{\sigma}
```

Este valor $Z$ (puntaje típico) representa la distancia de una observación respecto a la media expresada en desviaciones estándar. Un valor $Z > 2$ o $Z < -2$ suele considerarse estadísticamente "raro" o extremo en una población sana.

### Ejemplos de Aplicación

* **Valores de Laboratorio:** Los niveles de colesterol sérico en niños de 12 a 14 años se modelan mediante una distribución normal con $\mu = 162 \text{ mg/dL}$ y $\sigma = 28 \text{ mg/dL}$. Esto permite a los informáticos médicos programar alertas en sistemas de soporte de decisión para valores fuera del rango del 95%.

* **Antropometría Neonatal:** El peso al nacer de neonatos a término en EE. UU. sigue una distribución normal con $\mu = 3432 \text{ g}$ y $\sigma = 482 \text{ g}$. Si un investigador desea estudiar solo a los neonatos en el percentil 99, utilizará la distribución normal para hallar el punto de corte.

* **Fisiología Cardiovascular:** La presión sanguínea sistólica en adultos sanos se asume normal. Por ejemplo, si se conoce que $\mu = 120$ y $\sigma = 15$, la probabilidad de encontrar un sujeto con presión mayor a 150 mmHg se calcula transformando el valor a $Z = (150-120)/15 = 2$.

* **Epidemiología y Teorema del Límite Central (TLC):** Incluso si una variable original no es normal (como el tiempo de supervivencia al cáncer o la variabilidad de la frecuencia cardíaca), el promedio de muestras grandes ($n \ge 30$) de esa población tenderá a seguir una distribución normal. Esto es la base para la mayoría de las pruebas de hipótesis paramétricas (como la prueba $t$ de Student) utilizadas en ensayos clínicos.

### Diagnóstico de Normalidad

Para validar si un conjunto de datos médicos se ajusta a este modelo, se utilizan herramientas como el **Histograma**, el **Gráfico de Probabilidad Normal (Q-Q Plot)** —donde la normalidad se visualiza como una línea recta— y pruebas analíticas como el test de **Shapiro-Wilk**.

<br />
#### 📝 Programación:
<Tabs>
<TabItem value="dn" label="Antecedentes" default>
<div class="alert alert--primary">
**Distribución normal**<br />
</div>
</TabItem>
<TabItem value="dn-python" label="Pyhton" default>
```python showLineNumbers
# Implementación en Python
```
</TabItem>
<TabItem value="dn-r" label="R" default>
```r showLineNumbers
# Implementación en R
```
</TabItem>
</Tabs><br />

## Distribución t de Student

La **Distribución t de Student** es una distribución de probabilidad continua de fundamental importancia en la bioestadística, especialmente diseñada para realizar inferencias sobre la media poblacional cuando el tamaño de la muestra es reducido y la varianza de la población es desconocida.

### Contexto Histórico
La génesis de esta distribución se remonta a 1908, fruto del trabajo de **William Sealy Gosset**, un químico y matemático que laboraba para la cervecería Guinness en Dublín. Gosset buscaba mejorar los procesos de control de calidad de la cerveza mediante el examen de muestras pequeñas, observando que en estas condiciones la distribución normal no capturaba adecuadamente la variabilidad de las medias. Debido a las estrictas políticas de su empleador sobre la divulgación de secretos comerciales (como el uso de herramientas estadísticas en la producción), se vio obligado a publicar sus hallazgos bajo el seudónimo de **"Student"**. Posteriormente, el eminente estadístico **R. A. Fisher** reconoció la trascendencia del trabajo de Gosset, introdujo formalmente el concepto de "grados de libertad" y extendió su aplicación al análisis de comparación de medias.

### Definición y Formulación Matemática
Desde una perspectiva teórica, la distribución t surge al considerar el cociente entre una variable normal estándar y la raíz cuadrada de una variable chi-cuadrado independiente dividida por sus grados de libertad.

#### Función de Densidad de Probabilidad (fdp)
Para una variable aleatoria continua $x$ con $\nu$ grados de libertad, la función de densidad se expresa como:

```math
f(x; \nu) = \frac{\Gamma[(\nu+1)/2]}{\sqrt{\nu\pi}\Gamma(\nu/2)} \left(1 + \frac{x^2}{\nu}\right)^{-(\nu+1)/2}
```

Donde:
*   **$\nu$ (nu):** Representa los grados de libertad, calculados típicamente como $n-1$ para una muestra de tamaño $n$.
*   **$\Gamma$ (Gamma):** Es la función gamma, una extensión del concepto de factorial a números reales.
*   **$\pi$ (pi):** Constante matemática $(\approx 3.14159)$.

#### El Estadístico t
En la práctica clínica, para contrastar una media muestral ($\overline{X}$) contra una media poblacional hipotética ($\mu$), se utiliza la fórmula:
$$t = \frac{\overline{X} - \mu}{S / \sqrt{n}}$$

**Significado de sus componentes:**
*   **$\overline{X}$ (Media muestral):** El promedio calculado a partir de los datos observados.
*   **$\mu$ (Media poblacional):** El valor esperado o parámetro de referencia en la población.
*   **$S$ (Desviación estándar muestral):** Estimación de la variabilidad biológica dentro de la muestra; sustituye a la desviación típica poblacional $\sigma$ cuando esta es desconocida.
*   **$n$:** El tamaño de la muestra.
*   **$S / \sqrt{n}$ (Error Estándar de la Media o SEM):** Representa la precisión de la media muestral como estimador de la poblacional; cuantifica el "ruido" aleatorio en la medición.

### Fundamento y Propiedades
La distribución t se fundamenta en la necesidad de corregir la incertidumbre adicional que surge al estimar la varianza de la población a partir de una muestra pequeña.

*   **Simetría:** Al igual que la distribución normal, es simétrica respecto al valor cero y presenta una forma acampanada (unimodal).

*   **Colas Pesadas ("Heavy Tails"):** Una propiedad crítica en medicina es que la curva t es más aplanada y posee colas más gruesas que la normal. Esto implica que, en muestras pequeñas, existe una mayor probabilidad de observar valores extremos alejados de la media, lo cual es vital para no subestimar riesgos clínicos.

*   **Convergencia:** A medida que el tamaño de la muestra $n$ aumenta (y por ende los grados de libertad), la estimación de $S$ se vuelve más precisa y la distribución t converge hacia la distribución normal estándar $N(0,1)$. En la práctica de postgrado, suele considerarse que para $n > 30$ la aproximación a la normal es aceptable, aunque el rigor exige el uso de t en cualquier caso donde la varianza poblacional sea desconocida.

<br />
#### 📝 Programación:
<Tabs>
<TabItem value="mnp" label="Antecedentes" default>
<div class="alert alert--primary">
**Distribución t de Student**<br />
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
</Tabs><br />

### Usos en Salud
La aplicación de la t de Student es ubicua en la investigación biomédica para la validación de hipótesis.

- **Estimación por Intervalos de Confianza:** Permite delimitar el rango de valores donde se encuentra la verdadera media de una variable (ej. nivel de glucosa) con una confianza determinada (ej. 95%).
    ```math
    IC = \overline{x} \pm t_{\alpha/2, n-1} \cdot \frac{s}{\sqrt{n}}
    ```

- **Prueba t de una muestra:** Para determinar si la media de un grupo de pacientes difiere de un estándar clínico conocido (ej. ¿es la tensión arterial media superior a lo normal?).

- **Prueba t para muestras independientes:** Crucial en ensayos clínicos para comparar la eficacia de dos tratamientos distintos (ej. fármaco nuevo vs. placebo).

- **Prueba t para muestras apareadas:** Se utiliza cuando se mide al mismo paciente antes y después de una intervención, eliminando la variabilidad entre individuos y aumentando la eficiencia estadística.

- **Regresión Lineal:** Se emplea para testar si los coeficientes de un modelo predictivo ($\beta$) son significativamente distintos de cero, validando así la relación entre predictores y resultados de salud.

<br />

## Distribución chi-cuadrado

La **distribución chi-cuadrado ($\chi^2$)** es una de las distribuciones de probabilidad continua más trascendentales en la informática médica y la investigación clínica, siendo el pilar fundamental para el análisis de datos categóricos y la estimación de la variabilidad poblacional. Formalmente, se define como la distribución que sigue la suma de los cuadrados de $k$ variables aleatorias independientes que siguen una distribución normal estándar ($Z \sim N(0,1)$).

### Marco Conceptual y Propiedades Matemáticas

La morfología de esta distribución depende exclusivamente de un parámetro denominado **grados de libertad ($v$ o $df$)**. 
* **No negatividad:** Dado que es una suma de cuadrados, la variable $\chi^2$ solo puede tomar valores entre $0$ e $+\infty$.
* **Asimetría:** La distribución presenta un sesgo positivo (hacia la derecha). No obstante, a medida que los grados de libertad aumentan ($v \rightarrow \infty$), la distribución se vuelve más simétrica y tiende asintóticamente a la distribución normal.
* **Momentos:** La media de una distribución chi-cuadrado es igual a sus grados de libertad ($E[X] = v$) y su varianza es el doble de los mismos ($Var[X] = 2v$).

### El Estadístico de Pearson

En bioestadística, la aplicación más ubicua se realiza a través del estadístico de Pearson, que permite cuantificar la discrepancia entre las frecuencias observadas en una muestra y las esperadas bajo un modelo teórico. La fórmula general es:

```math
\chi^{2} = \sum_{i=1}^{k} \frac{(O_{i} - E_{i})^{2}}{E_{i}}
```

Donde:
* **$O_i$**: Es la frecuencia observada en la categoría $i$.
* **$E_i$**: Es la frecuencia esperada teóricamente para dicha categoría.
* **$k$**: Representa el número de clases o categorías.

### Implicancias y Aplicaciones en Bioestadística

#### A. Pruebas de Bondad de Ajuste (*Goodness-of-Fit*)
Se utiliza para determinar si los datos de una muestra se ajustan a una distribución teórica específica (como la Normal, Poisson o Binomial). Un ejemplo clásico en genética médica es verificar si las frecuencias observadas de fenotipos en una descendencia cumplen con las **Leyes de Mendel**. Si el valor calculado de $\chi^2$ es pequeño, los datos son consistentes con la teoría; si es inusualmente grande, se rechaza el modelo.

#### B. Pruebas de Independencia y Homogeneidad
Mediante el uso de **tablas de contingencia ($r \times c$)**, se evalúa si existe asociación entre dos variables categóricas (ej. relación entre el hábito de fumar y el desarrollo de cáncer). En este contexto, los grados de libertad se calculan como $gl = (r-1) \times (c-1)$, donde $r$ es el número de filas y $c$ el de columnas.

#### C. Inferencia sobre la Varianza Poblacional
A diferencia de otras pruebas, la distribución $\chi^2$ permite construir intervalos de confianza y realizar contrastes de hipótesis para la varianza ($\sigma^2$) de una población normal. El estadístico pivote utilizado es:

```math
\chi^{2} = \frac{(n - 1)s^{2}}{\sigma^{2}}
```

Donde $s^2$ es la varianza muestral y $n$ el tamaño de la muestra. Esto es vital en informática médica para el **control de calidad** de instrumentos de medición que requieren una precisión estricta.

#### D. Modelado Avanzado: Regresión Logística y Genética
En modelos de regresión logística, la distribución chi-cuadrado se emplea para evaluar la **devianza** (bondad de ajuste del modelo multivariado) y en la **prueba de Wald** para determinar la significancia de los coeficientes de regresión ($\beta$). En genética de poblaciones, es la herramienta estándar para probar el **Equilibrio de Hardy-Weinberg** y el desequilibrio de ligamiento.

### Limitaciones y Requisitos Técnicos
Para que la aproximación a la distribución chi-cuadrado sea válida, se deben cumplir criterios de tamaño muestral:
1.  Las observaciones deben ser independientes entre sí.
2.  Las frecuencias esperadas ($E_i$) deben ser, por lo general, $\ge 5$ en al menos el 80% de las celdas, y ninguna debe ser $< 1$. En muestras pequeñas que violan estos supuestos, se recomienda el uso de la **Prueba Exacta de Fisher**.


<br />


