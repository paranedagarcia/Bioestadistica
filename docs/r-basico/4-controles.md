---
id: r-controles
title: Control de flujo
sidebar_label: "▪️​Controles de flujo"
sidebar_position: 4
---

# Sentencias de control en R


La programación en R dentro del ámbito de la informática médica no se limita al cálculo estadístico, sino que implica la orquestación de flujos de trabajo lógicos para el procesamiento de datos clínicos. Las **sentencias de control** son estructuras sintácticas que permiten dirigir el flujo de ejecución de un programa, decidiendo qué instrucciones se ejecutan y cuántas veces deben repetirse según condiciones específicas.

---

### Operadores Lógicos
Antes de implementar sentencias de control, es imperativo comprender los operadores que permiten evaluar condiciones. Estas expresiones siempre devuelven un valor booleano (`TRUE` o `FALSE`).

| Operador    | Descripción             | Ejemplo                    |
| :---------- | :---------------------- | :------------------------- |
| `==`        | Exactamente igual a     | `sexo == "F"`              |
| `!=`        | Diferente de            | `diagnostico != "Sano"`    |
| `<` , `>`   | Menor que, Mayor que    | `edad > 18`                |
| `<=` , `>=` | Menor/Mayor o igual que | `bmi >= 25`                |
| `&` , `&&`  | Operador lógico "Y"     | `(edad > 18) & (bmi > 25)` |
| `           | ` , `                   |                            | ` | Operador lógico "O" | `(fiebre == T) | (tos == T)` |

---

### Condicionales: Toma de Decisiones

#### La estructura `if` - `else`
Se utiliza para ejecutar un bloque de código solo si una condición se cumple. Si la condición es falsa, se puede optar por ejecutar un bloque alternativo mediante `else`.

**Sintaxis:**
```r
if (condicion) {
  # Código si es TRUE
} else {
  # Código si es FALSE
}
```

**Ejemplo Clínico:** Clasificación rápida de hipertensión.
```r
presion_sistolica <- 145

if (presion_sistolica >= 140) {
  print("Paciente con hipertensión")
} else {
  print("Presión dentro del rango normal")
}
```

#### La función vectorizada `ifelse()`
En informática médica se trabaja frecuentemente con vectores (listas de pacientes). La función `ifelse()` aplica una condición a cada elemento de un vector simultáneamente, lo cual es mucho más eficiente que un condicional simple.

**Fórmula conceptual:**
```math
\text{Resultado}_i = \begin{cases} \text{Valor A} & \text{si } \text{condición}_i \text{ es TRUE} \\ \text{Valor B} & \text{si } \text{condición}_i \text{ es FALSE} \end{cases}
```

**Ejemplo:**
```r
glucosa <- c(90, 130, 105, 150)
estado <- ifelse(glucosa > 126, "Diabetes", "Normal")
# Resultado: "Normal" "Diabetes" "Normal" "Diabetes"
```

---

### Bucles: Procesos Iterativos
Los bucles permiten repetir una secuencia de instrucciones múltiples veces. Son esenciales para tareas automáticas como la limpieza de bases de datos masivas.

#### El bucle `for`
Se utiliza cuando se conoce de antemano el número de iteraciones o se desea recorrer una estructura (como una columna de una tabla de pacientes).

**Ejemplo:** Calcular el cuadrado de una serie de indicadores.
```r
indicadores <- c(2, 4, 6)
for (i in indicadores) {
  print(i^2)
}
```

#### El bucle `while`
Repite las instrucciones mientras una condición lógica sea verdadera. Es útil en algoritmos de convergencia médica, donde se busca que un error sea menor a un umbral predefinido.

**Criterio de Convergencia:**
Se busca que el error relativo sea menor a una tolerancia $\epsilon$:
```math
\frac{|\text{Valor}_{\text{referencia}} - \text{Valor}_{\text{calculado}}|}{|\text{Valor}_{\text{referencia}}|} \le \epsilon
```

```r
nivel_farmaco <- 100
t <- 0
while (nivel_farmaco > 10) { # Mientras la concentración sea > 10mg
  nivel_farmaco <- nivel_farmaco * 0.8 # Eliminación del 20%
  t <- t + 1
  print(paste("Hora:", t, "Concentración:", nivel_farmaco))
}
```

---

### Control de Interrupción
*   **`break`**: Interrumpe y sale del ciclo inmediatamente (útil si se encuentra un error crítico en los datos).
*   **`next`**: Salta la iteración actual y pasa a la siguiente (útil para omitir pacientes con datos incompletos o `NA`).

---

### Vectorización vs. Bucles
En R, los bucles explícitos (`for`, `while`) suelen ser computacionalmente costosos cuando se procesan grandes volúmenes de datos clínicos. Siempre que sea posible, el informático médico debe preferir la **vectorización** o el uso de la familia de funciones `apply()`, que ejecutan ciclos de forma implícita y optimizada en la memoria.


