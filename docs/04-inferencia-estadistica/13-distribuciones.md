---
id: distribuciones
title: Distribuciones estadísticas
sidebar_label: Distribuciones estadísticas
sidebar_position: 13
---


# Distribuciones estadísticas

## Distribución Binomial

La **Distribución Binomial** es uno de los modelos de probabilidad discretas más fundamentales en la bioestadística y la informática médica. Se utiliza para modelar el número de "éxitos" observados en una serie de ensayos independientes que tienen una probabilidad constante de ocurrencia.

A continuación, se desarrolla este concepto bajo el rigor académico requerido para programas de postgrado en salud.

### 1. Contexto Histórico
El desarrollo de esta distribución se atribuye al matemático suizo **Jacob Bernoulli** (1654-1705), quien formalizó el estudio de procesos con dos resultados posibles en su obra póstuma *Ars Conjectandi*, publicada en 1713. Los coeficientes utilizados en su expansión matemática, conocidos como el "Triángulo de Pascal", tienen antecedentes que se remontan al siglo XIII.

Posteriormente, en el siglo XVIII, **Abraham de Moivre** introdujo la aproximación de la distribución binomial a la normal. Su motivación fue puramente práctica: el cálculo manual de términos binomiales para muestras grandes (por ejemplo, $n > 50$) resultaba extremadamente tedioso antes de la existencia de la computación moderna.

### 2. Definición y Formulación
Una variable aleatoria discreta $X$ sigue una distribución binomial si representa el número de éxitos en $n$ ensayos de Bernoulli independientes.

#### Función de Masa de Probabilidad (PMF)
La probabilidad de observar exactamente $x$ éxitos en $n$ intentos se define como:
```math
P(X = x) = \binom{n}{x} p^x (1-p)^{n-x}
```

**Significado de sus componentes:**
*   **$n$**: Número total de ensayos o intentos fijos en el experimento.
*   **$x$**: Número de éxitos observados (donde $x = 0, 1, 2, \dots, n$).
*   **$p$**: Probabilidad de "éxito" en cada ensayo individual, la cual debe permanecer constante.
*   **$q$ (o $1-p$)**: Probabilidad de "fracaso" en cada ensayo.
*   **$\binom{n}{x}$**: Coeficiente binomial, calculado como $\frac{n!}{x!(n-x)!}$, que representa el número de combinaciones posibles de $n$ elementos tomados de $x$ en $x$.

#### Momentos de la Distribución
*   **Esperanza Matemática (Media, $\mu$):** Indica el número promedio de éxitos esperado a largo plazo.
    ```math
    \mu = np
    ```
*   **Varianza ($\sigma^2$):** Cuantifica la dispersión de los resultados en torno a la media.
    
    ```math
    \sigma^2 = npq
    ```

### 3. Fundamentos Científicos y Supuestos
Para que un fenómeno biológico o médico pueda ser modelado rigurosamente mediante una distribución binomial, debe cumplir con las condiciones **BInS**:
- **B**inario: Cada ensayo tiene solo dos resultados posibles (ej. positivo/negativo, sobrevive/muere).
- **I**ndependencia: El resultado de un ensayo no afecta la probabilidad del siguiente.
- **n** constante: El número de ensayos se fija de antemano.
- **S**uccess (éxito): La probabilidad $p$ es la misma en cada ensayo.

**Nota sobre el muestreo:** En informática médica, a menudo se muestrea de poblaciones finitas sin reemplazo (lo que técnicamente sugeriría una distribución hipergeométrica). Sin embargo, se acepta el uso de la binomial si el tamaño de la muestra $n$ es menor al 5% del tamaño de la población $N$, ya que la probabilidad $p$ se mantiene virtualmente constante.

### 4. Usos en el Ámbito de la Salud
La distribución binomial es la piedra angular para el análisis de variables cualitativas dicotómicas:

*   **Epidemiología:** Estimar la prevalencia de una enfermedad en una comunidad (ej. casos positivos de influenza H1N1 en una muestra de 500 sujetos).
*   **Diagnóstico Clínico:** Calcular la probabilidad de obtener un número específico de resultados positivos en pruebas serológicas (como el VIH).
*   **Genética:** Modelar la proporción de una población que posee un gen vinculado a enfermedades complejas como el Alzheimer.
*   **Farmacología:** Evaluar la tasa de éxito de un nuevo tratamiento quirúrgico o medicamento en ensayos clínicos.

### 5. Implementación en el Entorno R
El software R proporciona funciones nativas para gestionar esta distribución sin necesidad de cálculos manuales complejos:
*   `dbinom(x, n, p)`: Calcula la probabilidad exacta de $x$ éxitos.
*   `pbinom(x, n, p)`: Calcula la probabilidad acumulada (útil para pruebas de hipótesis).
*   `rbinom(m, n, p)`: Genera $m$ valores aleatorios siguiendo una distribución binomial.

<br />

## Distribución de Poisson

La **Distribución de Poisson** constituye uno de los pilares de la probabilidad discreta en la informática médica, siendo esencial para modelar fenómenos biológicos y operativos caracterizados por el recuento de eventos aleatorios que ocurren con una tasa constante en un intervalo continuo de tiempo o espacio.

### 1. Contexto Histórico
Esta distribución debe su nombre al matemático y físico francés **Siméon-Denis Poisson** (1781-1840), quien desarrolló el concepto a partir de sus investigaciones en mecánica celeste y teoría de números. Fue formalmente introducida en su obra de 1837 como una forma límite de la distribución binomial para casos donde el número de ensayos es muy grande y la probabilidad de éxito es sumamente pequeña. Históricamente, también se le ha denominado la "ley de los sucesos raros".

### 2. Definición y Formulación Matemática
La distribución de Poisson describe la probabilidad de observar exactamente $k$ eventos en un intervalo determinado, dado que se conoce el número promedio de ocurrencias.

La **Función de Masa de Probabilidad (PMF)** se define como:
```math
P(X=k) = \frac{e^{-\lambda} \lambda^k}{k!}
```

Donde los componentes son:
*   **$X$**: Variable aleatoria discreta que representa el número de éxitos o casos (e.g., número de admisiones a urgencias).
*   **$k$**: El número de ocurrencias observado, que toma valores enteros desde 0 hasta el infinito ($0, 1, 2, \dots$).
*   **$\lambda$ (Lambda)**: El parámetro de la distribución, que indica el número promedio esperado de eventos por unidad de tiempo, área o volumen.
*   **$e$**: Base de los logaritmos naturales o número de Euler (aproximadamente 2.71828).
*   **$!$**: Operador factorial.

En el marco de los modelos estadísticos avanzados, la distribución de Poisson pertenece a la **familia exponencial** de distribuciones, donde su parámetro natural se define como $\theta = \ln(\lambda)$.

### 3. Fundamentos: El Proceso de Poisson
Para que un fenómeno se considere un experimento o **proceso de Poisson**, deben satisfacerse las siguientes condiciones de rigor científico:
- **Independencia**: La ocurrencia de un evento en un intervalo no influye en la probabilidad de que ocurra en otro intervalo distinto.
- **Proporcionalidad**: La probabilidad de que ocurra un solo evento en un subintervalo muy pequeño es proporcional a la longitud de dicho intervalo ($\lambda \Delta t$).
- **Exclusividad**: La probabilidad de que ocurra más de un evento en un subintervalo infinitesimal tiende a cero.
- **Tasa Constante**: El promedio de ocurrencias ($\lambda$) permanece invariable durante todo el periodo de observación.

#### Propiedades Críticas
*   **Igualdad de Momentos**: Una propiedad distintiva y diagnóstica es que la **media ($E[X]$)** y la **varianza ($V[X]$)** son idénticas y equivalen a $\lambda$.
*   **Relación con la Distribución Exponencial**: Si el número de eventos sigue una distribución de Poisson, el tiempo transcurrido entre dos eventos sucesivos sigue una **distribución exponencial** con parámetro $\lambda$.
*   **Convergencia**: A medida que $\lambda$ aumenta (típicamente $\lambda \ge 10$ o $\ge 100$ para mayor rigor), la distribución de Poisson se vuelve simétrica y puede ser aproximada satisfactoriamente por la **distribución normal**.

### 4. Aplicaciones en Salud
En la práctica clínica y la gestión sanitaria, la distribución de Poisson es indispensable para:
*   **Análisis de Datos Clínicos**: Modelado del conteo de glóbulos blancos en una muestra de sangre, eosinófilos en un campo microscópico o desintegraciones radiactivas en medicina nuclear.
*   **Epidemiología**: Estimación de la incidencia de enfermedades raras, como casos de cáncer en una comunidad específica o mortalidad materna.
*   **Gestión Hospitalaria**: Predicción de la llegada de pacientes a servicios de urgencias o admisiones diarias para optimizar el personal de turno.
*   **Informática Médica y Bioinformática**: Análisis del flujo de paquetes en redes de telemedicina, número de solicitudes a servidores web de salud o errores en secuencias genéticas.
*   **Seguridad del Paciente**: Registro de accidentes laborales, fallas de equipos médicos por unidad de tiempo o errores de medicación en farmacia hospitalaria.

<br />

## Distribución t de Student

La **Distribución t de Student** es una distribución de probabilidad continua de fundamental importancia en la bioestadística y la informática médica, especialmente diseñada para realizar inferencias sobre la media poblacional cuando el tamaño de la muestra es reducido y la varianza de la población es desconocida.

### 1. Contexto Histórico
La génesis de esta distribución se remonta a 1908, fruto del trabajo de **William Sealy Gosset**, un químico y matemático que laboraba para la cervecería Guinness en Dublín. Gosset buscaba mejorar los procesos de control de calidad de la cerveza mediante el examen de muestras pequeñas, observando que en estas condiciones la distribución normal no capturaba adecuadamente la variabilidad de las medias. Debido a las estrictas políticas de su empleador sobre la divulgación de secretos comerciales (como el uso de herramientas estadísticas en la producción), se vio obligado a publicar sus hallazgos bajo el seudónimo de **"Student"**. Posteriormente, el eminente estadístico **R. A. Fisher** reconoció la trascendencia del trabajo de Gosset, introdujo formalmente el concepto de "grados de libertad" y extendió su aplicación al análisis de comparación de medias.

### 2. Definición y Formulación Matemática
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

### 3. Fundamento y Propiedades
La distribución t se fundamenta en la necesidad de corregir la incertidumbre adicional que surge al estimar la varianza de la población a partir de una muestra pequeña.

*   **Simetría:** Al igual que la distribución normal, es simétrica respecto al valor cero y presenta una forma acampanada (unimodal).

*   **Colas Pesadas ("Heavy Tails"):** Una propiedad crítica en medicina es que la curva t es más aplanada y posee colas más gruesas que la normal. Esto implica que, en muestras pequeñas, existe una mayor probabilidad de observar valores extremos alejados de la media, lo cual es vital para no subestimar riesgos clínicos.

*   **Convergencia:** A medida que el tamaño de la muestra $n$ aumenta (y por ende los grados de libertad), la estimación de $S$ se vuelve más precisa y la distribución t converge hacia la distribución normal estándar $N(0,1)$. En la práctica de postgrado, suele considerarse que para $n > 30$ la aproximación a la normal es aceptable, aunque el rigor exige el uso de t en cualquier caso donde la varianza poblacional sea desconocida.

### 4. Usos en Salud
La aplicación de la t de Student es ubicua en la investigación biomédica para la validación de hipótesis.

- **Estimación por Intervalos de Confianza:** Permite delimitar el rango de valores donde se encuentra la verdadera media de una variable (ej. nivel de glucosa) con una confianza determinada (ej. 95%).
    ```math
    IC = \overline{x} \pm t_{\alpha/2, n-1} \cdot \frac{s}{\sqrt{n}}
    ```

- **Prueba t de una muestra:** Para determinar si la media de un grupo de pacientes difiere de un estándar clínico conocido (ej. ¿es la tensión arterial media superior a lo normal?).

- **Prueba t para muestras independientes:** Crucial en ensayos clínicos para comparar la eficacia de dos tratamientos distintos (ej. fármaco nuevo vs. placebo).

- **Prueba t para muestras apareadas:** Se utiliza cuando se mide al mismo paciente antes y después de una intervención, eliminando la variabilidad entre individuos y aumentando la eficiencia estadística.

- **Regresión Lineal:** En informática médica, se emplea para testar si los coeficientes de un modelo predictivo ($\beta$) son significativamente distintos de cero, validando así la relación entre predictores y resultados de salud.

<br />

## Distribución de Bernoulli
La **distribución de Bernoulli** constituye el modelo de probabilidad más elemental en la estadística, sirviendo como la unidad fundamental para la construcción de distribuciones más complejas como la binomial, la geométrica y la binomial negativa. Representa un experimento aleatorio único con exactamente dos resultados posibles, mutuamente excluyentes, denominados tradicionalmente como "éxito" y "fracaso".

### 1. Contexto Histórico
Esta distribución debe su nombre al eminente matemático suizo **Jacob Bernoulli** (1654–1705), quien realizó aportes pioneros a la teoría de la probabilidad en el siglo XVII. Bernoulli formalizó el estudio de las pruebas independientes con probabilidades constantes de éxito, conceptos que fueron publicados póstumamente en su obra *Ars Conjectandi* en 1713.

### 2. Definición y Formulación Matemática
Desde una perspectiva teórica, una variable aleatoria $X$ sigue una distribución de Bernoulli si puede tomar únicamente dos valores: $X=1$ (éxito) y $X=0$ (fracaso).

#### Función de Masa de Probabilidad (PMF)
La probabilidad de observar un resultado $x$ se define matemáticamente como:
```math
P(X=x) = p^x(1-p)^{1-x}, \quad \text{para } x \in \{0, 1\}
```

Donde sus componentes significan:
*   **$x$**: El valor observado de la variable (1 para éxito, 0 para fracaso).
*   **$p$**: El parámetro que define la probabilidad de éxito en el ensayo ($0 \le p \le 1$).
*   **$q$ (o $1-p$)**: La probabilidad de fracaso, cumpliéndose que $p + q = 1$.

#### Momentos de la Distribución
*   **Esperanza Matemática (Media, $\mu$):** Es idéntica a la probabilidad de éxito.
    ```math
    E(X) = p
    ```
*   **Varianza ($\sigma^2$):** Cuantifica la dispersión de los datos alrededor de la media.
    ```math
    Var(X) = p \cdot (1 - p)
    ```
*   **Desviación Estándar ($\sigma$):**
    ```math
    \sigma = \sqrt{p \cdot q}
    ```

### 3. Fundamento Científico
El rigor de la distribución de Bernoulli se sustenta en el cumplimiento de los **ensayos de Bernoulli**, que poseen tres propiedades críticas:
1.  **Dicotomía:** El ensayo solo admite dos categorías (p. ej., sano/enfermo, positivo/negativo).

2.  **Independencia:** El resultado de un ensayo no afecta la probabilidad de éxito de cualquier observación subsiguiente.

3.  **Probabilidad Constante:** El parámetro $p$ permanece invariable en cada ejecución del experimento.

En informática médica, la suma de $n$ ensayos de Bernoulli independientes da lugar a la **distribución binomial**, permitiendo modelar el número total de éxitos en una muestra clínica.

### 4. Usos en Salud
En el ámbito biomédico, la distribución de Bernoulli es indispensable para caracterizar variables cualitativas y procesos de clasificación:
*   **Diagnóstico Clínico:** El resultado de una prueba serológica (ej. VIH) donde el resultado es reactivo (éxito) o no reactivo (fracaso).
*   **Epidemiología:** El estado de un individuo respecto a una patología, como ser diabético o no.
*   **Ensayos Clínicos:** La respuesta dicotómica a un tratamiento médico, clasificada como recuperación satisfactoria o ausencia de la misma.
*   **Genética:** La presencia o ausencia de un alelo específico vinculado a enfermedades como el Alzheimer.
*   **Informática Médica:** El análisis de errores en el procesamiento de datos por software hospitalario (presencia de error = 1, ausencia = 0).

<br />


