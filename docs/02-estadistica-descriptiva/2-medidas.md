---
id: medidas-central
title: Medidas
sidebar_label: "🔸Medidas descriptivas"
sidebar_position: 2
---


## Medidas de Tendencia Central

El núcleo de la estadística descriptiva reside en dos tipos de medidas: las de **tendencia central** y las de **dispersión**. Las medidas de tendencia central buscan identificar un valor "típico" o central alrededor del cual se agrupan los datos. Las tres más importantes son la media, la mediana y la moda.

<figure>
![](https://aprendiendoadministracion.com/wp-content/uploads/2016/02/graf21.png)
<small>Fuente: https://aprendiendoadministracion.com/medidas-de-tendencia-central-media-mediana-moda-rango-y-eje-medio/</small>
</figure>

### Media
**Media** Es el promedio aritmético, calculado sumando todos los valores y dividiendo por la cantidad total de ellos. 

Por ejemplo, si las calificaciones de un estudiante son 85, 90, 78 y 92, la media es (85+90+78+92)/4 = 86.25. La media actúa como un punto de equilibrio o centro de gravedad del conjunto de datos.

### Mediana
**Mediana** Es el valor que se encuentra en el centro de un conjunto de datos ordenados de menor a mayor. Si el número de datos es par, la mediana es el promedio de los dos valores centrales. 

Por ejemplo, en la lista [1, 3, 3, 6, 7, 8, 9], la mediana es 6. 

En la lista [1, 2, 3, 4, 5, 6, 7, 8], la mediana es (4+5)/2 = 4.5. 

Una característica clave de la mediana es su resistencia al sesgo causado por valores atípicos o extremos, lo que la hace preferible en distribuciones asimétricas.

### Moda
**Moda** Es el valor que aparece con mayor frecuencia en un conjunto de datos. Puede haber más de una moda si varios valores tienen la misma frecuencia máxima, o ninguna moda si todos los valores son únicos. Es especialmente útil para datos categóricos nominales.

| Característica | Media | Mediana | Moda |
| :--- | :--- | :--- | :--- |
| **Definición** | Promedio aritmético | Valor central en datos ordenados | Valor más frecuente |
| **Sensibilidad a Outliers** | Alta | Baja (Resistente) | No aplica (categórico) |
| **Aplicación** | Cuantitativa continua/skewness | Cuantitativa/skewed data | Cualitativa/categórica |
| **Ejemplo** | (2+4+6+8)/4 = 5 | Lista impar: [1,3,5] → 3; <br/>Par: [1,2,3,4] → 2.5 | [1,1,2,2,2,3] → Moda = 2 |


<Tabs>
  <TabItem value="python" label="Python" default>
    ```python
    # Medidas de tendencia central en Python...
    import statistics

# 1. Definición del conjunto de datos (mismas edades que en el ejemplo de R)
datos = [22, 25, 22, 30, 25, 22, 40, 35, 25, 22, 28, 22]

# 2. Cálculo de la Media (Promedio)
media = statistics.mean(datos)

# 3. Cálculo de la Mediana
mediana = statistics.median(datos)

# 4. Cálculo de la Moda
try:
    moda = statistics.mode(datos)
except statistics.StatisticsError:
    moda = "No hay una moda única"

# 5. Mostrar los resultados
print("--- Medidas de Tendencia Central (Python) ---")
print(f"Datos: {datos}")
print(f"Media: {media:.2f}")
print(f"Mediana: {mediana}")
print(f"Moda: {moda}")

# Extra: Usando una librería más avanzada (NumPy) para análisis masivo
import numpy as np
print("\n--- Resultados con NumPy ---")
print(f"Media: {np.mean(datos):.2f}")
print(f"Mediana: {np.median(datos)}")
    ```
  </TabItem>
  <TabItem value="r" label="R">
    ```r
    # Medidas de tendencia central en R....

    # 1. Definición del conjunto de datos (ejemplo: edades de un grupo)
datos <- c(22, 25, 22, 30, 25, 22, 40, 35, 25, 22, 28, 22)

# 2. Cálculo de la Media (Promedio aritmético)
# Se utiliza la función mean()
media <- mean(datos)

# 3. Cálculo de la Mediana (Valor central tras ordenar los datos)
# Se utiliza la función median()
mediana <- median(datos)

# 4. Cálculo de la Moda (El valor con mayor frecuencia)
# Creamos una función personalizada para encontrar el valor más frecuente
calcular_moda <- function(v) {
  tab <- table(v)                # Crea una tabla de frecuencias
  indice_max <- which.max(tab)    # Encuentra la posición del valor máximo
  moda <- names(tab)[indice_max]  # Obtiene el nombre (valor) de esa posición
  return(as.numeric(moda))        # Lo devuelve como número
}

moda <- calcular_moda(datos)

# 5. Mostrar los resultados en la consola
cat("--- Medidas de Tendencia Central ---\n")
cat("Datos analizados:", datos, "\n")
cat("Media:", media, "\n")
cat("Mediana:", mediana, "\n")
cat("Moda:", moda, "\n")

# Extra: Resumen estadístico rápido
cat("\n--- Resumen General ---\n")
print(summary(datos))
    ```
  </TabItem>
</Tabs>

<!-- <details>
    <summary>Código Python</summary>

    ```python

    ```

</details>

<details>
    <summary>Código R</summary>
    ```r
    # 1. Definición del conjunto de datos (ejemplo: edades de un grupo)
datos <- c(22, 25, 22, 30, 25, 22, 40, 35, 25, 22, 28, 22)

# 2. Cálculo de la Media (Promedio aritmético)
# Se utiliza la función mean()
media <- mean(datos)

# 3. Cálculo de la Mediana (Valor central tras ordenar los datos)
# Se utiliza la función median()
mediana <- median(datos)

# 4. Cálculo de la Moda (El valor con mayor frecuencia)
# Creamos una función personalizada para encontrar el valor más frecuente
calcular_moda <- function(v) {
  tab <- table(v)                # Crea una tabla de frecuencias
  indice_max <- which.max(tab)    # Encuentra la posición del valor máximo
  moda <- names(tab)[indice_max]  # Obtiene el nombre (valor) de esa posición
  return(as.numeric(moda))        # Lo devuelve como número
}

moda <- calcular_moda(datos)

# 5. Mostrar los resultados en la consola
cat("--- Medidas de Tendencia Central ---\n")
cat("Datos analizados:", datos, "\n")
cat("Media:", media, "\n")
cat("Mediana:", mediana, "\n")
cat("Moda:", moda, "\n")

# Extra: Resumen estadístico rápido
cat("\n--- Resumen General ---\n")
print(summary(datos))
    ```

</details> -->

<br />

<object data="/bioestadistica/files/data_medidas.pdf" type="application/pdf" width="100%" height="600px">
    <p>Parece que no tienes un visor de PDF integrado. 
    Puedes <a href="/files/data_medidas.pdf">descargar el archivo</a> aquí.</p>
</object>
