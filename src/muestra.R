# --- Cálculo de Tamaño Muestral: Variable Cuantitativa en Población Infinita ---

# 1. Definición de parámetros del estudio
desviacion_std <- 15    # Sigma (Variabilidad supuesta)
precision <- 2          # d (Margen de error deseado)
nivel_confianza <- 0.95 # 1 - alpha

# 2. Obtención del valor crítico Z (Distribución Normal Estándar)
alpha <- 1 - nivel_confianza
z_critico <- qnorm(1 - alpha/2) # Proporciona ~1.96 para 95% de confianza

# 3. Aplicación de la fórmula de estimación de media
# n = (z^2 * sigma^2) / d^2
n_calculado <- (z_critico^2 * desviacion_std^2) / (precision^2)

# 4. Regla de redondeo de bioestadística: Siempre al entero superior
# Esto garantiza que el error no exceda el límite 'd' establecido.
n_final <- ceiling(n_calculado)

# Visualización de resultados
cat("Valor crítico Z_alpha/2:", round(z_critico, 4), "\n")
cat("Tamaño de muestra exacto:", n_calculado, "\n")
cat("Tamaño de muestra requerido (n):", n_final, "\n")