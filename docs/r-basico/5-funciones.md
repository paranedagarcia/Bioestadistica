---
id: r-funciones
title: Funciones en R
sidebar_label: "​Funciones"
sidebar_position: 5
---

# Funciones en R

Desde una perspectiva conceptual, una función puede visualizarse como una "caja negra" que recibe insumos (**entradas** o argumentos), los procesa sistemáticamente mediante un algoritmo definido (**cuerpo**) y entrega un resultado final (**salida**). R opera primordialmente mediante llamadas a funciones; incluso los operadores aritméticos básicos son funciones bajo el capó.

### Estructura Formal y Sintaxis
Para definir una función en R, se utiliza la palabra reservada `function` y se asigna el resultado a un símbolo o nombre descriptivo.

La sintaxis básica es:

```math
f(x_1, x_2, \dots, x_n) = \text{resultado}
```

En código de R se traduce como:

```r
nombre_de_la_funcion <- function(argumento1, argumento2) {
  # Cuerpo de la función: operaciones lógicas y matemáticas
  resultado <- argumento1 + argumento2
  
  return(resultado) # Especifica la salida
}
```

**Componentes clave:**
*   **Nombre:** Símbolo con el que invocaremos la función.
*   **Argumentos formales:** Variables que actúan como "contenedores" para los datos que el usuario proporcionará al momento de la ejecución.
*   **Cuerpo:** Bloque de código encerrado entre llaves `{ }` donde ocurre el procesamiento.
*   **Valor de retorno:** La función entrega el valor de la última expresión evaluada o lo que se indique explícitamente mediante el comando `return()`.

### Argumentos y Valores por Omisión
Las funciones pueden diseñarse para ser flexibles mediante el uso de valores por defecto o "defaults". Esto permite que la función se ejecute incluso si el usuario olvida o decide no proporcionar ciertos parámetros.

**Ejemplo aplicado: Cálculo de la Tasa Metabólica Basal (Ecuación Simplificada)**
Supongamos que deseamos calcular un factor de ajuste clínico que, por defecto, sea $1.0$ (sin cambios).

```r
ajuste_clinico <- function(valor, factor = 1.0) {
  valor_final <- valor * factor
  return(valor_final)
}

# Uso con el valor por defecto
ajuste_clinico(100) # Resultado: 100

# Uso modificando el factor
ajuste_clinico(100, 1.2) # Resultado: 120
```

### Ámbito de las Variables (Scope)
Un concepto crítico para el alumno de postgrado es el **alcance léxico**. Las variables creadas dentro de una función se denominan **locales**. Esto significa que existen únicamente mientras la función se está ejecutando y no alteran ni "ensucian" el espacio de trabajo global (Workspace) del usuario. Esta encapsulación garantiza que los cálculos internos no interfieran con otras partes del sistema.

### Ejemplo Clínico Detallado: Índice de Masa Corporal (IMC)
El IMC es un indicador antropométrico común definido por la relación entre el peso y el cuadrado de la talla.

**Fórmula Matemática:**
$$IMC = \frac{\text{Peso (kg)}}{\text{Talla (m)}^2}$$

**Implementación en R:**

```r
calcular_imc <- function(peso, talla) {
  # Validación: La talla debe estar en metros
  # Si el usuario ingresa cm (ej. 170), el programa arrojará valores ilógicos.
  
  imc <- peso / (talla^2)
  
  return(imc)
}

# Ejecución
paciente_imc <- calcular_imc(peso = 70, talla = 1.75)
print(paciente_imc) # 22.85714
```

### Flujo de Trabajo y Reproducibilidad
Para un manejo profesional de la información, se recomienda escribir las funciones en un archivo de texto plano separado (denominado **script** con extensión `.R`). Para cargar estas funciones en su sesión actual de análisis, se utiliza la función `source()`.

```r
source("mis_funciones_medicas.R") # Carga las funciones en el entorno de trabajo
```

Este enfoque permite que las herramientas desarrolladas por el informático médico puedan ser compartidas con otros colegas o reutilizadas en diferentes conjuntos de datos con total consistencia.

