---
id: r-basico
title: R para Bioestadística
sidebar_label: "▪️Introducción a R"
sidebar_position: 1
---

# R para Bioestadística

[R](https://www.r-project.org/) es un lenguaje de programación estadística de código abierto, ideal para estadística, bioinformática y ciencias de la salud.

El lenguaje de programación R representa, en la actualidad, el estándar de facto para la computación estadística y la visualización de datos en la investigación biomédica. R no debe considerarse meramente como un paquete estadístico, sino como un sistema integrado y coherente diseñado para el análisis crítico de datos.

### 1. Evolución Histórica

La génesis de R se encuentra profundamente ligada al lenguaje **S**, desarrollado por John Chambers y sus colaboradores en los Laboratorios Bell de AT&T en 1976.

*   **Origen y Propósito Inicial:** R fue creado en 1992 por Ross Ihaka y Robert Gentleman en la Universidad de Auckland, Nueva Zelanda,. Su intención original fue desarrollar un lenguaje didáctico para cursos introductorios de estadística, adoptando la sintaxis de S pero con una semántica interna distinta.
*   **Transición al Código Abierto:** En 1993 se realizó el primer anuncio público del software, y en 1995, por sugerencia de Martin Mächler, R adoptó la Licencia Pública General de GNU, convirtiéndose en software libre.
*   **Consolidación:** En 1997 se integró formalmente al proyecto GNU y se estableció el **R Core Team** para administrar el código fuente. La versión 1.0.0, considerada estable para producción, fue liberada el 29 de febrero de 2000.
*   **S-PLUS y R:** Mientras que S evolucionó comercialmente hacia S-PLUS, R se mantuvo como una alternativa gratuita y abierta que ha terminado por superar a su predecesor en flexibilidad y adopción comunitaria,.

### 2. Características Principales y Paradigmas

R se distingue por ser un lenguaje **interpretado**, lo que permite una interacción fluida y la ejecución de comandos línea a línea en una consola o entorno de desarrollo (IDE) como [RStudio](https://posit.co/download/rstudio-desktop/) o [Positron](https://positron.posit.co).

#### A. Naturaleza del Entorno
R se define como un "ambiente" (*environment*) porque es un sistema planificado y coherente, en contraposición a una acumulación de herramientas aisladas. Sus capacidades incluyen la manipulación de datos, el cálculo matricial y la generación de gráficos de alta calidad,.

#### B. Paradigmas de Programación
El lenguaje combina dos paradigmas fundamentales:
1.  **Programación Funcional:** La mayoría de las operaciones se realizan mediante llamadas a funciones que procesan argumentos y devuelven objetos,.
2.  **Programación Orientada a Objetos (OOP):** En R, "todo es un objeto". Implementa sistemas de clases como S3 (más informal y basado en funciones genéricas) y S4 (más riguroso y formal),,.

#### C. Vectorización y Eficiencia
Una característica distintiva es la **vectorización**, que permite aplicar operaciones a conjuntos de datos completos sin necesidad de bucles explícitos (como `for`), optimizando el rendimiento computacional,.

**Ejemplo Matemático de Operación Vectorial:**
Si se desea calcular la media aritmética ($\bar{x}$) de un vector de datos clínicos $X = \{x_1, x_2, \dots, x_n\}$, R aplica internamente:

```math
\bar{x} = \frac{1}{n} \sum_{i=1}^{n} x_i
```

*Donde:*
*   $n$: Representa la longitud del vector o número de observaciones (`length(x)`).
*   $x_i$: Es el valor de la $i$-ésima unidad estadística.
*   $\sum$: Es el operador de sumatoria implementado eficientemente en la función `sum(x)`.

#### D. Extensibilidad: El Ecosistema CRAN
La funcionalidad de R se expande mediante **paquetes**,. El repositorio oficial, **CRAN** (*Comprehensive R Archive Network*), alberga actualmente más de 20,000 paquetes especializados en áreas que van desde la genómica hasta los ensayos clínicos y el aprendizaje automático,,.

### 3. Estructura de Datos

Para la gestión de registros de salud, R utiliza estructuras específicas que permiten manejar la heterogeneidad de la información clínica:

1.  **Vectores:** Estructuras atómicas homogéneas (numéricas, caracteres o lógicas),.
2.  **Data Frames:** Estructuras bidimensionales fundamentales en bioestadística, donde cada columna (variable) puede tener un tipo de dato distinto (ej. Edad como numérico, Diagnóstico como factor),.
3.  **Factores:** Diseñados específicamente para variables categóricas (nominales u ordinales), esenciales para el modelado estadístico,.
4.  **Listas:** Colecciones de objetos que pueden ser de distinta naturaleza, permitiendo almacenar resultados complejos de análisis estadísticos,.

### 4. Interfaz de Modelado Estadístico

R utiliza una interfaz de fórmulas para especificar modelos estadísticos de manera intuitiva.
**Estructura de la Fórmula:**
$$Y \sim X_1 + X_2 + \dots + X_k$$
*   **$Y$:** Representa la variable de respuesta o dependiente,.
*   **$\sim$:** Signo tilde que separa la respuesta de los predictores.
*   **$X_k$:** Representan las variables independientes o covariables,.
*   **$+$:** Operador que añade términos al modelo estadístico.

<br />


# Positron

La elección de un **Entorno de Desarrollo Integrado (IDE)** es crítica para garantizar la eficiencia del flujo de trabajo y la reproductibilidad de los resultados.

<figure>
[![](https://positron.posit.co/images/astropy.png)]()
<small>https://positron.posit.co/images/astropy.png</small>
</figure>

:::tip Nota
El IDE Positron es un software de reciente aparición (2024). 
:::


### 1. Antecedentes e Historia de Positron

Positron es un IDE de próxima generación desarrollado por **Posit PBC** (anteriormente conocida como RStudio PBC). Su desarrollo responde a la evolución de la compañía hacia un enfoque "políglota", superando el paradigma exclusivo de R para integrar de manera nativa otros lenguajes fundamentales en la bioinformática, como **Python**.

*   **Fundación Técnica:** A diferencia de RStudio, que fue construido desde cero con Java y C++, Positron se fundamenta en la arquitectura de **Code OSS (VS Code)**. Esto le permite heredar una vasta ecosistema de extensiones y una infraestructura de edición de texto altamente optimizada.
*   **Motivación:** La necesidad de un entorno que soporte de forma equitativa a R y Python es evidente en el modelado de salud pública, donde se suelen combinar librerías de R para bioestadística con modelos de *Deep Learning* en Python.

### 2. Características Principales

Positron ofrece funcionalidades que optimizan el desarrollo de modelos econométricos y epidemiológicos similares a los descritos en la literatura técnica.
- Incluye un visor interno de PDF, sin requerir programas adicionales.

- Cuaderno integrado donde las salidas de celdas para dataframes de pandas y polars ahora se muestran como cuadrículas de datos interactivas con desplazamiento, ordenación y selección de celdas; puedes abrir cualquier dataframe directamente en el Explorador de datos con un solo clic. Esta versión también añade la posibilidad de mostrar u ocultar salidas de celdas individuales, compatibilidad con celdas sin procesar para contenido que no debe ejecutarse ni mostrarse, y comandos de división/unión de celdas con atajos de teclado que coinciden con las convenciones de Jupyter. Ahora están disponibles menús contextuales con el botón derecho del ratón en celdas y salidas para un acceso rápido a acciones comunes.

#### A. Arquitectura Políglota y LSP
Positron utiliza el **Language Server Protocol (LSP)** para proporcionar autocompletado, navegación de código y diagnósticos de errores. Su capacidad para manejar múltiples *kernels* permite que un investigador ejecute simultáneamente una sesión de R para un análisis de supervivencia y una sesión de Python para preprocesamiento de imágenes médicas.

#### B. Visualización y Gestión de Datos
Siguiendo la lógica de paneles de RStudio, Positron incluye:
*   **Data Explorer:** Una interfaz avanzada para la inspección de *data frames*, permitiendo filtrar y ordenar registros clínicos de forma interactiva.
*   **Plot Pane:** Un dispositivo gráfico integrado para la generación de histogramas, diagramas de dispersión y curvas de supervivencia.
*   **Variables Pane:** Un panel de entorno que lista los objetos almacenados en la memoria activa (Workspace), similar a la función `ls()` mencionada en los textos básicos de R.

#### C. Integración con Investigación Reproducible
Positron mantiene el compromiso con la **Programación Literaria** (*Literate Programming*). Facilita la implementación de documentos dinámicos mediante **Quarto**, la evolución de R Markdown, permitiendo que el código y la narrativa científica coexistan en un solo archivo. 


### 3. Comparativa con otros Entornos

Mientras que **RCommander** se describe como un paquete estadístico con interfaz gráfica útil para la estimación de modelos, Positron se orienta a usuarios que requieren mayor flexibilidad y extensibilidad. Su diseño basado en extensiones permite que el especialista personalice el entorno para tareas específicas, como la gestión de bases de datos SQL hospitalarias o el análisis de secuencias genéticas.

---

**Web**: https://positron.posit.co/

**Descarga**: https://positron.posit.co/download.html

**Documentación**: https://positron.posit.co/welcome.html