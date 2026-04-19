---
id: distribucion-discreta
title: "Distribución discreta"
sidebar_label: "Distribución discreta"
sidebar_position: 3
---


## Distribución de Bernoulli
La **distribución de Bernoulli** constituye el modelo de probabilidad más elemental en la estadística, sirviendo como la unidad fundamental para la construcción de distribuciones más complejas como la binomial, la geométrica y la binomial negativa. Representa un experimento aleatorio único con exactamente dos resultados posibles, mutuamente excluyentes, denominados tradicionalmente como "éxito" y "fracaso".

### Contexto Histórico
Esta distribución debe su nombre al eminente matemático suizo **Jacob Bernoulli** (1654–1705), quien realizó aportes pioneros a la teoría de la probabilidad en el siglo XVII. Bernoulli formalizó el estudio de las pruebas independientes con probabilidades constantes de éxito, conceptos que fueron publicados póstumamente en su obra *Ars Conjectandi* en 1713.

### Definición y Formulación Matemática
Desde una perspectiva teórica, una variable aleatoria $X$ sigue una distribución de Bernoulli si puede tomar únicamente dos valores: $X=1$ (éxito) y $X=0$ (fracaso).

#### Función de Masa de Probabilidad (PMF)
La probabilidad de observar un resultado $x$ se define matemáticamente como:
```math
P(X=x) = p^x(1-p)^{1-x}, \quad \text{para } x \in \{0, 1\}
```

Donde sus componentes significan:
* **$x$**: El valor observado de la variable (1 para éxito, 0 para fracaso).
* **$p$**: El parámetro que define la probabilidad de éxito en el ensayo ($0 \le p \le 1$).
* **$q$ (o $1-p$)**: La probabilidad de fracaso, cumpliéndose que $p + q = 1$.

#### Momentos de la Distribución
* **Esperanza Matemática (Media, $\mu$):** Es idéntica a la probabilidad de éxito.
    ```math
    E(X) = p
    ```
* **Varianza ($\sigma^2$):** Cuantifica la dispersión de los datos alrededor de la media.
    ```math
    Var(X) = p \cdot (1 - p)
    ```
* **Desviación Estándar ($\sigma$):**
    ```math
    \sigma = \sqrt{p \cdot q}
    ```

### Fundamento
El rigor de la distribución de Bernoulli se sustenta en el cumplimiento de los **ensayos de Bernoulli**, que poseen tres propiedades críticas:
1. **Dicotomía:** El ensayo solo admite dos categorías (p. ej., sano/enfermo, positivo/negativo).

2. **Independencia:** El resultado de un ensayo no afecta la probabilidad de éxito de cualquier observación subsiguiente.

3. **Probabilidad Constante:** El parámetro $p$ permanece invariable en cada ejecución del experimento.

La suma de $n$ ensayos de Bernoulli independientes da lugar a la **distribución binomial**, permitiendo modelar el número total de éxitos en una muestra clínica.

### Usos en Salud
En el ámbito biomédico, la distribución de Bernoulli es indispensable para caracterizar variables cualitativas y procesos de clasificación:
* **Diagnóstico Clínico:** El resultado de una prueba serológica (ej. VIH) donde el resultado es reactivo (éxito) o no reactivo (fracaso).
* **Epidemiología:** El estado de un individuo respecto a una patología, como ser diabético o no.
* **Ensayos Clínicos:** La respuesta dicotómica a un tratamiento médico, clasificada como recuperación satisfactoria o ausencia de la misma.
* **Genética:** La presencia o ausencia de un alelo específico vinculado a enfermedades como el Alzheimer.
* **Informática Médica:** El análisis de errores en el procesamiento de datos por software hospitalario (presencia de error = 1, ausencia = 0).

### Determinación

La detección de un problema que requiere un modelado mediante una **distribución de Bernoulli** se fundamenta en la identificación de procesos estocásticos elementales donde la incertidumbre se reduce a una respuesta binaria. Este modelo es el "átomo" de las distribuciones discretas y sirve como base para estructuras más complejas como la binomial y la geométrica.

Para determinar si un fenómeno clínico debe abordarse bajo este esquema, se deben verificar los siguientes criterios operativos y estructurales:

#### 1. Naturaleza Dicotómica del Resultado
La característica primordial es que el experimento o proceso de observación solo puede resultar en uno de dos resultados posibles y mutuamente excluyentes. Estos resultados se denominan arbitrariamente como "éxito" ($X=1$) y "fracaso" ($X=0$).

*   **Detección práctica:** El investigador debe preguntarse si la variable objetivo responde a una clasificación binaria pura.
*   **Ejemplos médicos:** Un test serológico de VIH (positivo o negativo), la supervivencia de un paciente a 30 días (vivo o fallecido), o la presencia de una mutación genética específica en una secuencia de ADN (presente o ausente).

#### 2. Estructura Unitaria del Ensayo
A diferencia de la distribución binomial, que contabiliza éxitos en varios intentos, la distribución de Bernoulli se aplica estrictamente cuando el experimento se ejecuta **una sola vez** ($n=1$). Si el problema implica una serie de eventos, estamos ante un proceso de Bernoulli, pero la distribución de Bernoulli *per se* solo describe el resultado de un único ensayo individual.

#### 3. Independencia y Probabilidad Constante
Para que un fenómeno sea tratado como un ensayo de Bernoulli dentro de un modelo mayor, se debe asumir que la probabilidad de éxito ($p$) es un parámetro fijo y que el resultado de un ensayo no afecta a otros potenciales ensayos (independencia).


El informático médico detecta la necesidad de este modelo cuando diseña sistemas de soporte a la decisión clínica (CDSS) que operan sobre variables de estado. Por ejemplo, al modelar la probabilidad de que un algoritmo de inteligencia artificial clasifique correctamente una imagen radiológica como "patológica", el resultado de cada clasificación individual es una variable de Bernoulli.


<br />
#### 📝 Programación:
<Tabs>
<TabItem value="db" label="Antecedentes" default>
<div class="alert alert--primary">
**Distribución de Bernoulli**<br />
</div>
</TabItem>
<TabItem value="db-python" label="Pyhton" default>
```python showLineNumbers
# Implementación en Python
```
</TabItem>
<TabItem value="db-r" label="R" default>
```r showLineNumbers
# Implementación en R
```
</TabItem>
</Tabs><br />


## Distribución Binomial

La **Distribución Binomial** es uno de los modelos de probabilidad discretas más fundamentales en la bioestadística. Se utiliza para modelar el número de "éxitos" observados en una serie de ensayos independientes que tienen una probabilidad constante de ocurrencia.


### Contexto
El desarrollo de esta distribución se atribuye al matemático suizo **Jacob Bernoulli** (1654-1705), quien formalizó el estudio de procesos con dos resultados posibles en su obra póstuma *Ars Conjectandi*, publicada en 1713. Los coeficientes utilizados en su expansión matemática, conocidos como el "Triángulo de Pascal", tienen antecedentes que se remontan al siglo XIII.

Posteriormente, en el siglo XVIII, **Abraham de Moivre** introdujo la aproximación de la distribución binomial a la normal. Su motivación fue puramente práctica: el cálculo manual de términos binomiales para muestras grandes (por ejemplo, $n > 50$) resultaba extremadamente tedioso antes de la existencia de la computación moderna.

### Definición y Formulación
Una variable aleatoria discreta $X$ sigue una distribución binomial si representa el número de éxitos en $n$ ensayos de Bernoulli independientes.

#### Función de Masa de Probabilidad (PMF)
La distribución binomial modela la variable aleatoria $X$, definida como el **número total de éxitos** obtenidos tras ejecutar los $n$ ensayos de Bernoulli. La probabilidad de observar exactamente $p$ éxitos se calcula mediante la función masa de probabilidad (PMF):

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

### Fundamentos Científicos y Supuestos
Para que un fenómeno biológico o médico pueda ser modelado rigurosamente mediante una distribución binomial, debe cumplir con las condiciones **BInS**:
- **B**inario: Cada ensayo tiene solo dos resultados posibles (ej. positivo/negativo, sobrevive/muere).
- **I**ndependencia: El resultado de un ensayo no afecta la probabilidad del siguiente.
- **n** constante: El número de ensayos se fija de antemano.
- **S**uccess (éxito): La probabilidad $p$ es la misma en cada ensayo.

**Nota sobre el muestreo:** A menudo se muestrea de poblaciones finitas sin reemplazo (lo que técnicamente sugeriría una distribución hipergeométrica). Sin embargo, se acepta el uso de la binomial si el tamaño de la muestra $n$ es menor al 5% del tamaño de la población $N$, ya que la probabilidad $p$ se mantiene virtualmente constante.


#### Implementación en el Entorno R
El software R proporciona funciones nativas para gestionar esta distribución sin necesidad de cálculos manuales complejos:
*   `dbinom(x, n, p)`: Calcula la probabilidad exacta de $x$ éxitos.
*   `pbinom(x, n, p)`: Calcula la probabilidad acumulada (útil para pruebas de hipótesis).
*   `rbinom(m, n, p)`: Genera $m$ valores aleatorios siguiendo una distribución binomial.


### Determinación

Para identificar si un fenómeno en el ámbito de la investigación clínica debe ser abordado mediante una **distribución binomial**, es imperativo verificar que la estructura del problema satisfaga rigurosamente cuatro criterios fundamentales, conocidos técnicamente como el modelo de ensayos independientes.

#### Criterios de Detección (Propiedades Estructurales)

Un problema se rige por una ley binomial cuando presenta las siguientes características esenciales:

1.  **Naturaleza Dicotómica:** Cada observación o "ensayo" debe dar como resultado únicamente una de dos categorías mutuamente excluyentes y exhaustivas. En medicina, estas suelen ser éxito/fracaso, enfermo/sano, positivo/negativo o fallecido/vivo.

2.  **Número de Ensayos Fijo ($n$):** El experimento consiste en una secuencia de $n$ ensayos, donde este número total de observaciones se determina de forma previa a la recolección de los datos.

3.  **Independencia de los Ensayos:** El resultado de una observación no debe influir ni estar condicionado por el resultado de otra. Por ejemplo, en un muestreo aleatorio de pacientes independientes, el estado de salud de uno no aporta información sobre el estado del siguiente.

4.  **Probabilidad de Éxito Constante ($p$):** La probabilidad de que ocurra el evento de interés (éxito) debe permanecer invariable en cada uno de los ensayos.



#### Reglas de Decisión Metodológica

Se debe prestar atención a dos escenarios críticos que podrían desviar el modelo hacia otras distribuciones:

*   **Población Finita vs. Infinita:** Si el muestreo se realiza **sin reemplazo** en una población pequeña, la probabilidad $p$ cambia en cada ensayo, violando el supuesto de independencia. En este caso, debería usarse la **distribución hipergeométrica**. No obstante, se puede utilizar la aproximación binomial si el tamaño de la muestra es insignificante respecto a la población (regla empírica: $n/N \le 0.05$).
*   **Aproximación de Poisson:** Cuando $n$ es muy grande y $p$ es muy pequeña (generalmente $np < 7$), se puede optar por la **distribución de Poisson** para simplificar el análisis de "eventos raros".

### Ejemplos
La distribución binomial es la piedra angular para el análisis de variables cualitativas dicotómicas:
*   **Pruebas diagnósticas:** Determinar la probabilidad de encontrar 2 resultados positivos en una muestra de 20 sujetos elegidos al azar, dada una prevalencia conocida.
*   **Eficacia de tratamientos:** Estimar el número de pacientes que experimentarán mejoría tras la administración de un fármaco en una cohorte fija.
*   **Complicaciones clínicas:** Modelar el número de mujeres embarazadas que presentan complicaciones durante el parto de un total de 100 pacientes.
*   **Epidemiología:** Estimar la prevalencia de una enfermedad en una comunidad (ej. casos positivos de influenza H1N1 en una muestra de 500 sujetos).
*   **Diagnóstico Clínico:** Calcular la probabilidad de obtener un número específico de resultados positivos en pruebas serológicas (como el VIH).
*   **Genética:** Modelar la proporción de una población que posee un gen vinculado a enfermedades complejas como el Alzheimer.
*   **Farmacología:** Evaluar la tasa de éxito de un nuevo tratamiento quirúrgico o medicamento en ensayos clínicos.


<br />
#### 📝 Programación:
<Tabs>
<TabItem value="db" label="Antecedentes" default>
<div class="alert alert--primary">
**Distribución binomial**<br />
Supongamos que un investigador desea estudiar la presencia de una enfermedad cuya prevalencia en la población es del 10% (p=0.1) en una cohorte de 20 pacientes (n=20). El siguiente script utiliza las funciones nativas de R para calcular probabilidades específicas y generar visualizaciones.
</div>
</TabItem>
<TabItem value="dbp" label="Python" default>
```python showLineNumbers
# Implementación en Python
# -*- coding: utf-8 -*-
"""
Análisis de Distribución Binomial: Estudio de Prevalencia de Enfermedad
========================================================================
Escenario: 
  - Prevalencia poblacional: p = 0.1 (10%)
  - Tamaño de cohorte: n = 20 pacientes
  
Este script calcula probabilidades clave y genera visualizaciones 
para apoyar la toma de decisiones en investigación epidemiológica.
"""

import numpy as np
import matplotlib.pyplot as plt
from scipy.stats import binom
import seaborn as sns

# Configuración de estilo para gráficos
sns.set_style("whitegrid")
plt.rcParams['font.size'] = 10

def calcular_probabilidades(n, p):
    """Calcula probabilidades clave para la distribución binomial."""
    
    # Crear objeto de distribución binomial
    distribucion = binom(n, p)
    
    print("=" * 60)
    print(f"ANÁLISIS BINOMIAL: n={n}, p={p}")
    print("=" * 60)
    
    # Estadísticos descriptivos
    print(f"\n📊 ESTADÍSTICOS TEÓRICOS:")
    print(f"   Media (μ)     : {distribucion.mean():.3f} pacientes")
    print(f"   Varianza (σ²) : {distribucion.var():.3f}")
    print(f"   Desv. Est. (σ): {distribucion.std():.3f}")
    
    # Probabilidades puntuales: P(X = k)
    print(f"\n🎯 PROBABILIDADES PUNTUALES P(X = k):")
    for k in [0, 1, 2, 3, 5]:
        prob = distribucion.pmf(k)
        print(f"   P(X = {k:2d}) = {prob:.4f}  ({prob*100:.2f}%)")
    
    # Probabilidades acumuladas: P(X ≤ k)
    print(f"\n📈 PROBABILIDADES ACUMULADAS P(X ≤ k):")
    for k in [1, 2, 3, 4]:
        prob = distribucion.cdf(k)
        print(f"   P(X ≤ {k:2d}) = {prob:.4f}  ({prob*100:.2f}%)")
    
    # Probabilidades de cola: P(X ≥ k)
    print(f"\n⚠️  PROBABILIDADES DE COLA P(X ≥ k):")
    for k in [3, 4, 5]:
        prob = distribucion.sf(k-1)  # sf = 1 - cdf, más estable numéricamente
        print(f"   P(X ≥ {k:2d}) = {prob:.4f}  ({prob*100:.2f}%)")
    
    # Probabilidad de rango: P(a ≤ X ≤ b)
    a, b = 1, 3
    prob_rango = distribucion.cdf(b) - distribucion.cdf(a-1)
    print(f"\n🔍 PROBABILIDAD DE RANGO P({a} ≤ X ≤ {b}):")
    print(f"   P({a} ≤ X ≤ {b}) = {prob_rango:.4f}  ({prob_rango*100:.2f}%)")
    
    print("=" * 60)
    
    return distribucion


def generar_visualizaciones(distribucion, n, p):
    """Genera gráficos informativos de la distribución binomial."""
    
    x = np.arange(0, n + 1)
    pmf = distribucion.pmf(x)
    cdf = distribucion.cdf(x)
    
    # Crear figura con 3 subgráficos
    fig, axes = plt.subplots(2, 2, figsize=(14, 10))
    fig.suptitle(f'Distribución Binomial: n={n}, p={p}', fontsize=16, fontweight='bold')
    
    # 1. PMF - Función de Masa de Probabilidad
    ax1 = axes[0, 0]
    barras = ax1.bar(x, pmf, color='steelblue', edgecolor='navy', alpha=0.8)
    # Resaltar barra más alta (moda)
    moda = np.argmax(pmf)
    barras[moda].set_color('crimson')
    ax1.axvline(x=distribucion.mean(), color='green', linestyle='--', 
                label=f'Media = {distribucion.mean():.2f}')
    ax1.set_xlabel('Número de pacientes enfermos (k)')
    ax1.set_ylabel('Probabilidad P(X = k)')
    ax1.set_title('📊 Función de Masa de Probabilidad (PMF)')
    ax1.legend()
    ax1.grid(axis='y', alpha=0.3)
    
    # 2. CDF - Función de Distribución Acumulada
    ax2 = axes[0, 1]
    ax2.step(x, cdf, where='post', color='darkorange', linewidth=2, label='CDF')
    ax2.fill_between(x, cdf, step='post', alpha=0.2, color='darkorange')
    ax2.axhline(y=0.95, color='red', linestyle=':', label='Umbral 95%')
    ax2.set_xlabel('Número de pacientes enfermos (k)')
    ax2.set_ylabel('Probabilidad Acumulada P(X ≤ k)')
    ax2.set_title('📈 Función de Distribución Acumulada (CDF)')
    ax2.legend()
    ax2.grid(alpha=0.3)
    
    # 3. Simulación: Comparación Teórica vs Empírica
    ax3 = axes[1, 0]
    np.random.seed(42)  # Reproducibilidad
    simulacion = np.random.binomial(n, p, size=10000)
    
    # Histograma de la simulación
    ax3.hist(simulacion, bins=np.arange(-0.5, n+1.5, 1), 
             density=True, alpha=0.7, color='lightgreen', 
             edgecolor='black', label='Simulación (10,000 iteraciones)')
    # Superponer PMF teórica
    ax3.plot(x, pmf, 'ro-', label='Teórica (Binomial)', linewidth=2)
    ax3.set_xlabel('Número de pacientes enfermos')
    ax3.set_ylabel('Densidad de Probabilidad')
    ax3.set_title('🔁 Validación: Teórica vs Simulación')
    ax3.legend()
    ax3.grid(alpha=0.3)
    
    # 4. Intervalo de confianza empírico (95%)
    ax4 = axes[1, 1]
    ic_inferior = distribucion.ppf(0.025)  # Percentil 2.5%
    ic_superior = distribucion.ppf(0.975)  # Percentil 97.5%
    
    # Colorear región del intervalo de confianza
    for i, prob in enumerate(pmf):
        color = 'lightcoral' if ic_inferior <= i <= ic_superior else 'lightgray'
        ax4.bar(i, prob, color=color, edgecolor='black', alpha=0.7)
    
    ax4.axvline(x=ic_inferior, color='red', linestyle='--', 
                label=f'IC 95%: [{int(ic_inferior)}, {int(ic_superior)}]')
    ax4.axvline(x=ic_superior, color='red', linestyle='--')
    ax4.set_xlabel('Número de pacientes enfermos (k)')
    ax4.set_ylabel('Probabilidad P(X = k)')
    ax4.set_title('🎯 Intervalo de Confianza del 95%')
    ax4.legend()
    ax4.grid(axis='y', alpha=0.3)
    
    plt.tight_layout()
    plt.show()
    
    # Imprimir intervalo de confianza
    print(f"\n🔐 INTERVALO DE CONFIANZA 95%:")
    print(f"   [{int(ic_inferior)}, {int(ic_superior)}] pacientes")
    print(f"   Interpretación: En el 95% de cohortes similares,")
    print(f"   esperaríamos entre {int(ic_inferior)} y {int(ic_superior)} casos.")


def escenario_aplicado(distribucion, n, p):
    """Ejemplos de preguntas de investigación respondidas con el modelo."""
    
    print("\n" + "💡".center(60, "─"))
    print("ESCENARIOS DE APLICACIÓN PRÁCTICA")
    print("💡".center(60, "─"))
    
    # Escenario 1: ¿Es inusual encontrar 5 o más casos?
    k = 5
    prob_inusual = distribucion.sf(k-1)
    print(f"\n❓ ¿Es inusual observar ≥ {k} casos enfermos?")
    print(f"   P(X ≥ {k}) = {prob_inusual:.4f} ({prob_inusual*100:.2f}%)")
    if prob_inusual < 0.05:
        print("   ✅ SÍ: Es estadísticamente inusual (p < 0.05)")
    else:
        print("   ❌ NO: Está dentro de lo esperado por azar")
    
    # Escenario 2: Poder estadístico para detectar aumento de prevalencia
    print(f"\n❓ Si la verdadera prevalencia fuera 20% (p=0.2),")
    print(f"   ¿cuál es la probabilidad de observar ≤ {int(distribucion.mean())} casos?")
    dist_alt = binom(n, 0.2)
    prob_tipo2 = dist_alt.cdf(int(distribucion.mean()))
    print(f"   P(X ≤ {int(distribucion.mean())} | p=0.2) = {prob_tipo2:.4f}")
    print(f"   → Esto representa un error Tipo II potencial")
    
    # Escenario 3: Tamaño muestral para precisión
    print(f"\n❓ ¿Cuántos pacientes necesito para que la media esperada sea 10 casos?")
    n_necesario = int(np.ceil(10 / p))
    print(f"   Con p={p}, se requieren n ≥ {n_necesario} pacientes")
    
    print("\n" + "─".center(60, "💡"))


def main():
    """Función principal que ejecuta todo el análisis."""
    
    # Parámetros del estudio
    n = 20   # Tamaño de la cohorte
    p = 0.1  # Prevalencia de la enfermedad
    
    # 1. Calcular probabilidades clave
    distribucion = calcular_probabilidades(n, p)
    
    # 2. Generar visualizaciones informativas
    generar_visualizaciones(distribucion, n, p)
    
    # 3. Aplicar a escenarios de investigación reales
    escenario_aplicado(distribucion, n, p)
    
    print("\n✨ Análisis completado. ¡Listo para la toma de decisiones!")


if __name__ == "__main__":
    main()
```
```raw
============================================================
ANÁLISIS BINOMIAL: n=20, p=0.1
============================================================

📊 ESTADÍSTICOS TEÓRICOS:
   Media (μ)     : 2.000 pacientes
   Varianza (σ²) : 1.800
   Desv. Est. (σ): 1.342

🎯 PROBABILIDADES PUNTUALES P(X = k):
   P(X =  0) = 0.1216  (12.16%)
   P(X =  1) = 0.2702  (27.02%)
   P(X =  2) = 0.2852  (28.52%)
   P(X =  3) = 0.1901  (19.01%)
   P(X =  5) = 0.0319  (3.19%)

📈 PROBABILIDADES ACUMULADAS P(X ≤ k):
   P(X ≤  1) = 0.3917  (39.17%)
   P(X ≤  2) = 0.6769  (67.69%)
   P(X ≤  3) = 0.8670  (86.70%)
   P(X ≤  4) = 0.9568  (95.68%)

⚠️  PROBABILIDADES DE COLA P(X ≥ k):
   P(X ≥  3) = 0.3231  (32.31%)
   P(X ≥  4) = 0.1330  (13.30%)
...

🔍 PROBABILIDAD DE RANGO P(1 ≤ X ≤ 3):
   P(1 ≤ X ≤ 3) = 0.7455  (74.55%)
```
![binomial](img/python-binomial.png)

📊 Visualizaciones Generadas
- **PMF**: Muestra la probabilidad de cada posible número de casos
- **CDF**: Ilustra cómo se acumula la probabilidad
- **Validación**: Compara teoría con simulación de Monte Carlo
- **Intervalo de Confianza**: Resalta el rango donde esperamos el 95% de resultados

🔐 INTERVALO DE CONFIANZA 95%:
   [0, 5] pacientes
   Interpretación: En el 95% de cohortes similares,
   esperaríamos entre 0 y 5 casos.

─────────────────────────────💡─────────────────────────────
ESCENARIOS DE APLICACIÓN PRÁCTICA
─────────────────────────────💡─────────────────────────────

❓ ¿Es inusual observar ≥ 5 casos enfermos?
   P(X ≥ 5) = 0.0432 (4.32%)
   ✅ SÍ: Es estadísticamente inusual (p < 0.05)

❓ Si la verdadera prevalencia fuera 20% (p=0.2),
   ¿cuál es la probabilidad de observar ≤ 2 casos?
   P(X ≤ 2 | p=0.2) = 0.2061
   → Esto representa un error Tipo II potencial

❓ ¿Cuántos pacientes necesito para que la media esperada sea 10 casos?
   Con p=0.1, se requieren n ≥ 100 pacientes
</TabItem>
<TabItem value="dbr" label="R">
```r showLineNumbers
# Implementación en en R
# -*- coding: utf-8 -*-
# ============================================================================
# ANÁLISIS DE DISTRIBUCIÓN BINOMIAL EN R
# Estudio de Prevalencia de Enfermedad
# ============================================================================
# Escenario:
#   • Prevalencia poblacional: p = 0.1 (10%)
#   • Tamaño de cohorte: n = 20 pacientes
#
# Este script calcula probabilidades clave y genera visualizaciones
# para apoyar la toma de decisiones en investigación epidemiológica.
# ============================================================================

# Instalar paquetes si es necesario (descomentar la primera vez)
# install.packages(c("ggplot2", "gridExtra", "scales"))

library(ggplot2)
library(gridExtra)
library(scales)

# Configuración global de temas para ggplot2
theme_set(theme_minimal(base_size = 11))
colors <- list(
    primary = "#2E86AB",
    secondary = "#A23B72",
    highlight = "#F18F01",
    success = "#06A77D",
    danger = "#C73E1D"
)

# ============================================================================
# FUNCIÓN 1: Calcular probabilidades clave
# ============================================================================
calcular_probabilidades <- function(n, p) {
    cat("\n", rep("=", 60), "\n", sep = "")
    cat(sprintf("ANÁLISIS BINOMIAL: n = %d, p = %.2f\n", n, p))
    cat(rep("=", 60), "\n", sep = "")

    # Estadísticos descriptivos
    media <- n * p
    varianza <- n * p * (1 - p)
    desv_std <- sqrt(varianza)

    cat("\n📊 ESTADÍSTICOS TEÓRICOS:\n")
    cat(sprintf("   Media (μ)     : %.3f pacientes\n", media))
    cat(sprintf("   Varianza (σ²) : %.3f\n", varianza))
    cat(sprintf("   Desv. Est. (σ): %.3f\n", desv_std))

    # Probabilidades puntuales: P(X = k) usando dbinom()
    cat("\n🎯 PROBABILIDADES PUNTUALES P(X = k) [dbinom()]:\n")
    valores_k <- c(0, 1, 2, 3, 5)
    for (k in valores_k) {
        prob <- dbinom(k, size = n, prob = p)
        cat(sprintf("   P(X = %2d) = %.4f  (%.2f%%)\n", k, prob, prob * 100))
    }

    # Probabilidades acumuladas: P(X ≤ k) usando pbinom()
    cat("\n📈 PROBABILIDADES ACUMULADAS P(X ≤ k) [pbinom()]:\n")
    for (k in c(1, 2, 3, 4)) {
        prob <- pbinom(k, size = n, prob = p)
        cat(sprintf("   P(X ≤ %2d) = %.4f  (%.2f%%)\n", k, prob, prob * 100))
    }

    # Probabilidades de cola superior: P(X ≥ k) = 1 - P(X ≤ k-1)
    cat("\n⚠️  PROBABILIDADES DE COLA P(X ≥ k):\n")
    for (k in c(3, 4, 5)) {
        # Usar lower.tail = FALSE es más estable numéricamente
        prob <- pbinom(k - 1, size = n, prob = p, lower.tail = FALSE)
        cat(sprintf("   P(X ≥ %2d) = %.4f  (%.2f%%)\n", k, prob, prob * 100))
    }

    # Probabilidad de rango: P(a ≤ X ≤ b)
    a <- 1
    b <- 3
    prob_rango <- pbinom(b, size = n, prob = p) - pbinom(a - 1, size = n, prob = p)
    cat(sprintf("\n🔍 PROBABILIDAD DE RANGO P(%d ≤ X ≤ %d):\n", a, b))
    cat(sprintf("   P(%d ≤ X ≤ %d) = %.4f  (%.2f%%)\n", a, b, prob_rango, prob_rango * 100))

    cat(rep("=", 60), "\n", sep = "")

    # Retornar lista con resultados para uso en visualizaciones
    return(list(
        n = n,
        p = p,
        media = media,
        varianza = varianza,
        desv_std = desv_std,
        moda = which.max(dbinom(0:n, size = n, prob = p)) - 1 # -1 porque índices empiezan en 1
    ))
}

# ============================================================================
# FUNCIÓN 2: Generar visualizaciones con ggplot2
# ============================================================================
generar_visualizaciones <- function(n, p, stats) {
    x <- 0:n
    pmf <- dbinom(x, size = n, prob = p)
    cdf <- pbinom(x, size = n, prob = p)

    # --------------------------------------------------------------------------
    # Gráfico 1: PMF - Función de Masa de Probabilidad
    # --------------------------------------------------------------------------
    df_pmf <- data.frame(k = x, prob = pmf)

    p1 <- ggplot(df_pmf, aes(x = factor(k), y = prob)) +
        geom_col(aes(fill = k == stats$moda),
            color = "black", alpha = 0.8, show.legend = FALSE
        ) +
        scale_fill_manual(values = c("FALSE" = colors$primary, "TRUE" = colors$danger)) +
        geom_vline(
            xintercept = stats$media + 1, # +1 porque factor
            color = colors$success, linetype = "dashed", linewidth = 0.8
        ) +
        annotate("text",
            x = stats$media + 1.5, y = max(pmf) * 0.9,
            label = sprintf("μ = %.2f", stats$media),
            color = colors$success, fontface = "bold", size = 3.5
        ) +
        labs(
            title = "📊 Función de Masa de Probabilidad (PMF)",
            subtitle = sprintf("Distribución Binomial: n = %d, p = %.2f", n, p),
            x = "Número de pacientes enfermos (k)",
            y = "Probabilidad P(X = k)"
        ) +
        scale_y_continuous(labels = label_percent(accuracy = 1)) +
        theme(panel.grid.minor = element_blank())

    # --------------------------------------------------------------------------
    # Gráfico 2: CDF - Función de Distribución Acumulada
    # --------------------------------------------------------------------------
    df_cdf <- data.frame(k = x, prob_acum = cdf)

    p2 <- ggplot(df_cdf, aes(x = k, y = prob_acum)) +
        geom_step(color = colors$highlight, linewidth = 1.2, direction = "hv") +
        geom_point(color = colors$highlight, size = 2) +
        geom_ribbon(aes(ymin = 0, ymax = prob_acum),
            fill = colors$highlight, alpha = 0.15
        ) +
        geom_hline(
            yintercept = 0.95, color = colors$danger,
            linetype = "dotted", linewidth = 0.8
        ) +
        annotate("text",
            x = n * 0.7, y = 0.97, label = "Umbral 95%",
            color = colors$danger, fontface = "italic", size = 3
        ) +
        labs(
            title = "📈 Función de Distribución Acumulada (CDF)",
            subtitle = "Probabilidad acumulada P(X ≤ k)",
            x = "Número de pacientes enfermos (k)",
            y = "Probabilidad Acumulada"
        ) +
        scale_y_continuous(labels = label_percent(accuracy = 1), limits = c(0, 1)) +
        theme(panel.grid.minor = element_blank())

    # --------------------------------------------------------------------------
    # Gráfico 3: Validación - Teórica vs Simulación Monte Carlo
    # --------------------------------------------------------------------------
    set.seed(42) # Reproducibilidad
    simulacion <- rbinom(n = 10000, size = n, prob = p)

    # Preparar datos para comparación
    df_sim <- data.frame(
        k = factor(0:n),
        teorica = pmf,
        simulada = as.numeric(table(factor(simulacion, levels = 0:n))) / length(simulacion)
    )

    p3 <- ggplot(df_sim, aes(x = k)) +
        geom_col(aes(y = simulada),
            fill = "lightgreen",
            color = "black", alpha = 0.6, width = 0.7,
            position = position_nudge(x = -0.15)
        ) +
        geom_point(aes(y = teorica),
            color = colors$danger, size = 3,
            position = position_nudge(x = 0.15)
        ) +
        geom_line(aes(y = teorica, group = 1),
            color = colors$danger,
            linewidth = 1, position = position_nudge(x = 0.15)
        ) +
        labs(
            title = "🔁 Validación: Teórica vs Simulación Monte Carlo",
            subtitle = "10,000 iteraciones de rbinom()",
            x = "Número de pacientes enfermos",
            y = "Probabilidad / Densidad"
        ) +
        scale_y_continuous(labels = label_percent(accuracy = 1)) +
        annotate("text",
            x = 3, y = max(pmf) * 0.9,
            label = "● Teórica", color = colors$danger, size = 3, hjust = 0
        ) +
        annotate("text",
            x = 3, y = max(pmf) * 0.75,
            label = "▮ Simulada", color = "darkgreen", size = 3, hjust = 0
        ) +
        theme(panel.grid.minor = element_blank(), legend.position = "none")

    # --------------------------------------------------------------------------
    # Gráfico 4: Intervalo de Confianza del 95%
    # --------------------------------------------------------------------------
    # Calcular percentiles usando qbinom()
    ic_inferior <- qbinom(0.025, size = n, prob = p)
    ic_superior <- qbinom(0.975, size = n, prob = p)

    df_ic <- data.frame(
        k = factor(x),
        prob = pmf,
        en_ic = x >= ic_inferior & x <= ic_superior
    )

    p4 <- ggplot(df_ic, aes(x = k, y = prob)) +
        geom_col(aes(fill = en_ic), color = "black", alpha = 0.75) +
        scale_fill_manual(
            values = c("FALSE" = "lightgray", "TRUE" = colors$primary),
            guide = "none"
        ) +
        geom_vline(
            xintercept = ic_inferior + 1, color = colors$danger,
            linetype = "dashed", linewidth = 0.8
        ) +
        geom_vline(
            xintercept = ic_superior + 1, color = colors$danger,
            linetype = "dashed", linewidth = 0.8
        ) +
        annotate("rect",
            xmin = ic_inferior + 0.5, xmax = ic_superior + 1.5,
            ymin = -Inf, ymax = Inf, fill = colors$primary, alpha = 0.08
        ) +
        labs(
            title = sprintf(
                "🎯 Intervalo de Confianza del 95%% [%d, %d]",
                ic_inferior, ic_superior
            ),
            subtitle = "Rango donde esperamos el 95% de los resultados",
            x = "Número de pacientes enfermos (k)",
            y = "Probabilidad P(X = k)"
        ) +
        scale_y_continuous(labels = label_percent(accuracy = 1)) +
        theme(panel.grid.minor = element_blank())

    # --------------------------------------------------------------------------
    # Mostrar todos los gráficos en una cuadrícula 2x2
    # --------------------------------------------------------------------------
    print(grid.arrange(p1, p2, p3, p4,
        ncol = 2,
        top = grid::textGrob(
            sprintf("Análisis de Distribución Binomial: n = %d, p = %.2f", n, p),
            gp = grid::gpar(fontsize = 14, fontface = "bold")
        )
    ))

    # Retornar valores del IC para impresión
    return(list(ic_inferior = ic_inferior, ic_superior = ic_superior))
}

# ============================================================================
# FUNCIÓN 3: Escenarios de aplicación práctica
# ============================================================================
escenario_aplicado <- function(n, p) {
    cat("\n", paste(rep("💡", 30), collapse = ""), "\n", sep = "")
    cat("ESCENARIOS DE APLICACIÓN PRÁCTICA\n")
    cat(paste(rep("💡", 30), collapse = ""), "\n", sep = "")

    # Escenario 1: ¿Es inusual encontrar 5 o más casos?
    k <- 5
    prob_inusual <- pbinom(k - 1, size = n, prob = p, lower.tail = FALSE)
    cat(sprintf("\n❓ ¿Es inusual observar ≥ %d casos enfermos?\n", k))
    cat(sprintf("   P(X ≥ %d) = %.4f (%.2f%%)\n", k, prob_inusual, prob_inusual * 100))
    if (prob_inusual < 0.05) {
        cat("   ✅ SÍ: Es estadísticamente inusual (p < 0.05)\n")
    } else {
        cat("   ❌ NO: Está dentro de lo esperado por azar\n")
    }

    # Escenario 2: Poder estadístico con prevalencia alternativa
    p_alt <- 0.2
    cat(sprintf(
        "\n❓ Si la verdadera prevalencia fuera %.0f%% (p = %.2f),\n",
        p_alt * 100, p_alt
    ))
    cat(sprintf("   ¿cuál es la probabilidad de observar ≤ %d casos?\n", round(n * p)))
    prob_tipo2 <- pbinom(round(n * p), size = n, prob = p_alt)
    cat(sprintf("   P(X ≤ %d | p = %.2f) = %.4f\n", round(n * p), p_alt, prob_tipo2))
    cat("   → Esto representa un error Tipo II potencial (β)\n")

    # Escenario 3: Cálculo de tamaño muestral
    casos_deseados <- 10
    n_necesario <- ceiling(casos_deseados / p)
    cat(sprintf("\n❓ ¿Cuántos pacientes necesito para esperar ~%d casos?\n", casos_deseados))
    cat(sprintf("   Con p = %.2f, se requieren n ≥ %d pacientes\n", p, n_necesario))

    cat("\n", paste(rep("💡", 30), collapse = ""), "\n", sep = "")
}

# ============================================================================
# FUNCIÓN PRINCIPAL
# ============================================================================
main <- function() {
    # Parámetros del estudio
    n <- 20 # Tamaño de la cohorte
    p <- 0.1 # Prevalencia de la enfermedad

    # 1. Calcular probabilidades clave
    stats <- calcular_probabilidades(n, p)

    # 2. Generar visualizaciones
    ic <- generar_visualizaciones(n, p, stats)

    # Imprimir intervalo de confianza en consola
    cat(sprintf(
        "\n🔐 INTERVALO DE CONFIANZA 95%%: [%d, %d] pacientes\n",
        ic$ic_inferior, ic$ic_superior
    ))
    cat("   Interpretación: En el 95%% de cohortes similares,\n")
    cat(sprintf(
        "   esperaríamos entre %d y %d casos.\n",
        ic$ic_inferior, ic$ic_superior
    ))

    # 3. Aplicar a escenarios de investigación
    escenario_aplicado(n, p)

    cat("\n✨ Análisis completado. ¡Listo para la toma de decisiones!\n\n")
}

# ============================================================================
# EJECUTAR SCRIPT
# ============================================================================
if (!interactive()) {
    # Si se ejecuta como script desde línea de comandos
    main()
} else {
    # Si se ejecuta en RStudio o consola interactiva
    cat("🚀 Iniciando análisis de distribución binomial...\n")
    cat("   Presiona Enter para continuar o ejecuta main() manualmente.\n")

    # Para ejecución automática en modo interactivo, descomentar:
    # main()
}

```
```raw
============================================================
ANÁLISIS BINOMIAL: n = 20, p = 0.10
============================================================

📊 ESTADÍSTICOS TEÓRICOS:
   Media (μ)     : 2.000 pacientes
   Varianza (σ²) : 1.800
   Desv. Est. (σ): 1.342

🎯 PROBABILIDADES PUNTUALES P(X = k) [dbinom()]:
   P(X =  0) = 0.1216  (12.16%)
   P(X =  1) = 0.2702  (27.02%)
   P(X =  2) = 0.2852  (28.52%)
   P(X =  3) = 0.1901  (19.01%)
   P(X =  5) = 0.0319  (3.19%)

📈 PROBABILIDADES ACUMULADAS P(X ≤ k) [pbinom()]:
   P(X ≤  1) = 0.3917  (39.17%)
   P(X ≤  2) = 0.6769  (67.69%)
   P(X ≤  3) = 0.8670  (86.70%)
   P(X ≤  4) = 0.9568  (95.68%)

⚠️  PROBABILIDADES DE COLA P(X ≥ k):
   P(X ≥  3) = 0.3231  (32.31%)
```
![binomial](img/r-binomial.png)

📊 Visualizaciones Generadas
- **PMF** - Función de Masa de Probabilidad
Muestra la probabilidad exacta para cada número posible de casos (0 a 20)
Resalta en rojo la moda (valor más probable)
Línea verde punteada indica la media teórica
- **CDF** - Función de Distribución Acumulada
Gráfico escalonado que muestra P(X ≤ k)
Línea punteada roja marca el umbral del 95%
Área sombreada facilita la interpretación visual
- **Validación Monte Carlo**
Compara la distribución teórica (puntos rojos) con simulación empírica (barras verdes)
Demuestra que rbinom() reproduce fielmente la teoría binomial
- **Intervalo de Confianza 95%**
Resalta en azul el rango [ic_inferior, ic_superior] donde cae el 95% de resultados esperados
Líneas verticales punteadas marcan los límites exactos

</TabItem>
</Tabs><br />


<br />

## Distribución de Poisson

La **Distribución de Poisson** constituye uno de los pilares de la probabilidad discreta, siendo esencial para modelar fenómenos biológicos y operativos caracterizados por el recuento de eventos aleatorios que ocurren con una tasa constante en un intervalo continuo de tiempo o espacio.

### Contexto Histórico
Esta distribución debe su nombre al matemático y físico francés **Siméon-Denis Poisson** (1781-1840), quien desarrolló el concepto a partir de sus investigaciones en mecánica celeste y teoría de números. Fue formalmente introducida en su obra de 1837 como una forma límite de la distribución binomial para casos donde el número de ensayos es muy grande y la probabilidad de éxito es sumamente pequeña. Históricamente, también se le ha denominado la "ley de los sucesos raros".

### Definición y Formulación Matemática
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

### Fundamentos: El Proceso de Poisson
Para que un fenómeno se considere un experimento o **proceso de Poisson**, deben satisfacerse las siguientes condiciones de rigor científico:
- **Independencia**: La ocurrencia de un evento en un intervalo no influye en la probabilidad de que ocurra en otro intervalo distinto.
- **Proporcionalidad**: La probabilidad de que ocurra un solo evento en un subintervalo muy pequeño es proporcional a la longitud de dicho intervalo ($\lambda \Delta t$).
- **Exclusividad**: La probabilidad de que ocurra más de un evento en un subintervalo infinitesimal tiende a cero.
- **Tasa Constante**: El promedio de ocurrencias ($\lambda$) permanece invariable durante todo el periodo de observación.

#### Propiedades Críticas
*   **Igualdad de Momentos**: Una propiedad distintiva y diagnóstica es que la **media ($E[X]$)** y la **varianza ($V[X]$)** son idénticas y equivalen a $\lambda$.
*   **Relación con la Distribución Exponencial**: Si el número de eventos sigue una distribución de Poisson, el tiempo transcurrido entre dos eventos sucesivos sigue una **distribución exponencial** con parámetro $\lambda$.
*   **Convergencia**: A medida que $\lambda$ aumenta (típicamente $\lambda \ge 10$ o $\ge 100$ para mayor rigor), la distribución de Poisson se vuelve simétrica y puede ser aproximada satisfactoriamente por la **distribución normal**.

### Aplicaciones en Salud
En la práctica clínica y la gestión sanitaria, la distribución de Poisson es indispensable para:
*   **Análisis de Datos Clínicos**: Modelado del conteo de glóbulos blancos en una muestra de sangre, eosinófilos en un campo microscópico o desintegraciones radiactivas en medicina nuclear.
*   **Epidemiología**: Estimación de la incidencia de enfermedades raras, como casos de cáncer en una comunidad específica o mortalidad materna.
*   **Gestión Hospitalaria**: Predicción de la llegada de pacientes a servicios de urgencias o admisiones diarias para optimizar el personal de turno.
*   **Informática y Bioinformática**: Análisis del flujo de paquetes en redes de telemedicina, número de solicitudes a servidores web de salud o errores en secuencias genéticas.
*   **Seguridad del Paciente**: Registro de accidentes laborales, fallas de equipos médicos por unidad de tiempo o errores de medicación en farmacia hospitalaria.

**Validación de supuestos**: Al trabajar con grandes bases de datos (como el ACL o registros hospitalarios), es común realizar pruebas de bondad de ajuste para verificar si los conteos clínicos siguen realmente una distribución de Poisson o si presentan sobre-dispersión (donde la varianza supera a la media), caso en el cual se preferiría una distribución binomial negativa.

**Uso de la aproximación**: La distribución de Poisson es útil para aproximar la binomial cuando el tamaño de la muestra (n) es muy grande y la probabilidad del evento (p) es muy pequeña (menor a 7).

**Análisis de Tasas**: En epidemiología, el modelo de Poisson es la base para la Regresión de Poisson, la cual permite modelar la densidad de incidencia (casos por persona-tiempo) ajustando por covariables como edad, sexo o exposición a factores de riesgo.
<br />
#### 📝 Programación:
<Tabs>
<TabItem value="dpa" label="Antecedentes" default>
<div class="alert alert--primary">
**Distribución de Poisson**<br />
Supongamos que un administrador hospitalario determina que el promedio de admisiones diarias por una patología específica en la unidad de cuidados intensivos es de 3 pacientes (λ=3). El siguiente script implementa las funciones nativas de R para el análisis de este escenario.
</div>
</TabItem>
<TabItem value="dp-python" label="Pyhton" default>
```python showLineNumbers
# Implementación en Python
```
</TabItem>
<TabItem value="dp-r" label="R" default>
```r showLineNumbers
# Implementación en R
# --- Script de R: Distribución de Poisson en Entorno Clínico ---

# 1. Configuración de parámetros
set.seed(1234) # Garantiza la reproductibilidad del experimento 
lambda_diaria <- 3  # Promedio de admisiones (parámetro lambda) 
k_eventos <- 0:10   # Rango de posibles ingresos a evaluar

# 2. Cálculo de la Función de Masa de Probabilidad (dpois)
# Determina la probabilidad de observar exactamente k ingresos 
prob_exactas <- dpois(k_eventos, lambda = lambda_diaria)

# 3. Cálculo de la Función de Distribución Acumulada (ppois)
# Probabilidad de recibir 2 o menos pacientes: P(X <= 2)
prob_acum_2 <- ppois(2, lambda = lambda_diaria)

# 4. Generación de datos simulados (rpois)
# Simulación del número de ingresos diarios durante un año (365 días)
simulacion_anual <- rpois(365, lambda = lambda_diaria)

# 5. Visualización científica del modelo teórico
# Representación mediante gráfico de bastones para variable discreta
barplot(prob_exactas, 
        names.arg = k_eventos, 
        main = expression(paste("Distribución de Poisson (", lambda, " = 3 admissions/día)")),
        xlab = "Número de pacientes admitidos (k)", 
        ylab = "Probabilidad P(X = k)",
        col = "darkseagreen",
        border = "white")

# 6. Reporte de resultados clave
cat("Probabilidad de recibir exactamente 3 pacientes:", dpois(3, lambda_diaria), "\n")
cat("Probabilidad de recibir 2 o menos pacientes:", prob_acum_2, "\n")
cat("Media de la simulación anual:", mean(simulacion_anual), "\n")

# resultado
Probabilidad de recibir exactamente 3 pacientes: 0.2240418 
Probabilidad de recibir 2 o menos pacientes: 0.4231901 
Media de la simulación anual: 2.983562 
```
![poisson](img/poisson.png)

</TabItem>
</Tabs><br />
<br />
