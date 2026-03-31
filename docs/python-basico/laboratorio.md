---
id: lab-1
title: Ejercicios
sidebar_label: "▪️​Ejercicios"
sidebar_position: 3
---

```python
# ==============================================================================
# Laboratorio 1: Matrices - Script de Solución en Python
# ==============================================================================

import pandas as pd
import numpy as np

# ==============================================================================
# 0. Creación de los datos (Basado en la Tabla 1 del documento)
# ==============================================================================
datos = pd.DataFrame({
    'nombre': ['Juan', 'Pedro', 'Pablo', 'Juan', 'María', 'Felipe', 'Oscar', 'Eliana', 'Camila', 'Constanza'],
    'apellido': ['Pérez', 'Pereira', 'Gómez', 'Romero', 'Silva', 'Ruiz', 'Díaz', 'Quiroga', 'Sosa', 'Fernández'],
    'rut': ['11111111-1', '22222222-2', '33333333-3', '44444444-4', '55555555-5', 
            '66666666-6', '77777777-7', '88888888-8', '99999999-9', '00000000-0'],
    'altura': [1.63, 1.53, 1.90, 1.80, 1.45, 1.80, 1.71, 1.75, 1.68, 1.66],
    'peso': [77, 78, 91, 138, 52, 40, 75, 90, 123, 60],
    'circunferencia': [0.65, 0.88, 0.83, 1.20, 0.63, 0.67, 1.12, 0.90, 0.70, 0.88]
})

print("Datos cargados:")
print(datos)
print("")

# ==============================================================================
# ACTIVIDAD 1: Matriz de mediciones antropométricas
# ==============================================================================
matriz_antropometrica = datos[['altura', 'peso', 'circunferencia']].values

print("=" * 60)
print("Actividad 1: Matriz Antropométrica")
print("=" * 60)
print(matriz_antropometrica)
print("")

# ==============================================================================
# ACTIVIDAD 2: Matriz de datos personales
# ==============================================================================
matriz_personales = datos[['nombre', 'apellido', 'rut']].values

print("=" * 60)
print("Actividad 2: Matriz Datos Personales")
print("=" * 60)
print(matriz_personales)
print("")

# ==============================================================================
# ACTIVIDAD 3: Cálculo del Índice de Masa Corporal (IMC)
# ==============================================================================
# Fórmula: IMC = peso / (altura^2)
vector_imc = datos['peso'] / (datos['altura'] ** 2)

print("=" * 60)
print("Actividad 3: Vector IMC")
print("=" * 60)
print(vector_imc.values)
print("")

# ==============================================================================
# ACTIVIDAD 4: Subconjunto de datos personales
# ==============================================================================
subconjunto_personales = matriz_personales[:, 0:2]

print("=" * 60)
print("Actividad 4: Subconjunto (Nombre y Apellido)")
print("=" * 60)
print(subconjunto_personales)
print("")

# ==============================================================================
# ACTIVIDAD 5: Columna Estado según IMC
# ==============================================================================
# "N" si IMC está entre 18.5 y 25, "A" si está fuera del rango
vector_estado = np.where((vector_imc >= 18.5) & (vector_imc <= 25), 'N', 'A')

print("=" * 60)
print("Actividad 5: Vector Estado (N = Normal, A = Anormal)")
print("=" * 60)
print(vector_estado)
print("")

# ==============================================================================
# DATOS FINALES COMO DATAFRAME
# ==============================================================================
datos_finales = pd.DataFrame({
    'nombre': datos['nombre'],
    'apellido': datos['apellido'],
    'rut': datos['rut'],
    'altura': datos['altura'],
    'peso': datos['peso'],
    'circunferencia': datos['circunferencia'],
    'IMC': np.round(vector_imc, 2),
    'Estado': vector_estado
})


# Conteo de pacientes por estado
print("=" * 60)
print("=== Conteo de Pacientes ===")
print("=" * 60)
print(f"Total pacientes: {len(datos_finales)}")
print(f"Peso Normal (N): {sum(datos_finales['Estado'] == 'N')}")
print(f"Peso Anormal (A): {sum(datos_finales['Estado'] == 'A')}")
print("")

datos_finales
# ==============================================================================
# EXPORTAR RESULTADOS (Opcional)
# ==============================================================================
# Si deseas guardar los resultados en un archivo CSV, descomenta la siguiente línea:
# datos_finales.to_csv('resultado_laboratorio_1.csv', index=False, encoding='utf-8-sig')
# print("Resultados exportados a 'resultado_laboratorio_1.csv'")

```
