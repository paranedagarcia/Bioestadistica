---
id: r-laboratorios
title: Laboratorios
sidebar_label: "▪️​Laboratorios"
sidebar_position: 6
---


```r
# ==============================================================================
# Laboratorio 1: Matrices - Script Final con Dataframe de Resultados
# ==============================================================================

# 0. Creación de los datos (Basado en la Tabla 1 del documento)
# ------------------------------------------------------------------------------
datos <- data.frame(
  nombre = c("Juan", "Pedro", "Pablo", "Juan", "María", "Felipe", "Oscar", "Eliana", "Camila", "Constanza"),
  apellido = c("Pérez", "Pereira", "Gómez", "Romero", "Silva", "Ruiz", "Díaz", "Quiroga", "Sosa", "Fernández"),
  rut = c("11111111-1", "22222222-2", "33333333-3", "44444444-4", "55555555-5", 
          "66666666-6", "77777777-7", "88888888-8", "99999999-9", "00000000-0"),
  altura = c(1.63, 1.53, 1.90, 1.80, 1.45, 1.80, 1.71, 1.75, 1.68, 1.66),
  peso = c(77, 78, 91, 138, 52, 40, 75, 90, 123, 60),
  circunf_abdominal = c(0.65, 0.88, 0.83, 1.20, 0.63, 0.67, 1.12, 0.90, 0.70, 0.88)
)

# ==============================================================================
# ACTIVIDAD 1: Matriz de mediciones antropométricas
# ==============================================================================
matriz_antropometrica <- as.matrix(datos[, c("altura", "peso", "circunf_abdominal")])

# ==============================================================================
# ACTIVIDAD 2: Matriz de datos personales
# ==============================================================================
matriz_personales <- as.matrix(datos[, c("nombre", "apellido", "rut")])

# ==============================================================================
# ACTIVIDAD 3: Cálculo del Índice de Masa Corporal (IMC)
# ==============================================================================
vector_imc <- datos$peso / (datos$altura^2)

# ==============================================================================
# ACTIVIDAD 4: Subconjunto de datos personales
# ==============================================================================
subconjunto_personales <- matriz_personales[, c(1, 2)]

# ==============================================================================
# ACTIVIDAD 5: Columna Estado según IMC
# ==============================================================================
# "N" si IMC está entre 18.5 y 25, "AN" si está fuera del rango
vector_estado <- ifelse(vector_imc >= 18.5 & vector_imc <= 25, "N", "AN")

# ==============================================================================
# DATOS FINALES COMO DATAFRAME
# ==============================================================================
# Se crea un dataframe final con toda la información consolidada

datos_finales <- data.frame(
  nombre = datos$nombre,
  apellido = datos$apellido,
  rut = datos$rut,
  altura = datos$altura,
  peso = datos$peso,
  circunf_abdominal = datos$circunf_abdominal,
  IMC = round(vector_imc, 2),
  Estado = vector_estado
)

# ==============================================================================
# MOSTRAR RESULTADOS
# ==============================================================================

print("==========================================================")
print("           DATOS FINALES COMO DATAFRAME")
print("==========================================================")
print("")
print("Leyenda: Estado 'N' = Peso Normal (IMC 18.5-25)")
print("         Estado 'AN' = Peso Anormal (IMC < 18.5 o > 25)")
print("")
print("----------------------------------------------------------")
print(datos_finales)
print("----------------------------------------------------------")
print("")

# Resumen estadístico del Estado
print("=== Resumen de Estados ===")
print(table(datos_finales$Estado))
print("")

# Conteo de pacientes por estado
print("=== Conteo de Pacientes ===")
print(paste("Total pacientes:", nrow(datos_finales)))
print(paste("Peso Normal (N):", sum(datos_finales$Estado == "N")))
print(paste("Peso Anormal (AN):", sum(datos_finales$Estado == "AN")))
```