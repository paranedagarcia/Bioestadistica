# Ejemplo en R: tipos de variables mencionadas en docs/01-introduccion/3-variables.md
# Ejecútalo con: Rscript programas/ejemplo_variables.R

# 1. Variables cualitativas (nominales, dicotómicas, politómicas)
mostrar_nominales <- function(){
  grupo_sanguineo <- factor('A', levels = c('A','B','O','AB')) # nominal (politómica)
  genero <- factor('masculino', levels = c('masculino','femenino'))
  cat('Nominales: grupo_sanguineo=', as.character(grupo_sanguineo), '\n')
  cat('Genero=', as.character(genero), '\n')
}

mostrar_dicotomicas <- function(){
  presencia_enfermedad <- TRUE   # dicotómica (sí/no)
  fumador <- FALSE                # dicotómica
  cat('Dicotómicas: presencia_enfermedad=', presencia_enfermedad, ' fumador=', fumador, '\n')
}

# Ordinales: usar ordered factor
mostrar_ordinales <- function(){
  niveles_dolor <- ordered(c('leve','moderado','severo'))
  paciente_nivel <- factor('moderado', levels=levels(niveles_dolor), ordered = TRUE)
  cat('Ordinal: paciente_nivel=', as.character(paciente_nivel), ' (posición=', as.integer(paciente_nivel), ')\n')
}

# 2. Variables cuantitativas (discretas, continuas)
mostrar_cuantitativas <- function(){
  num_hijos <- 2L                 # discreta (conteo, entero)
  visitas_hospital <- 5L
  peso <- 3.45                    # continua (kg)
  estatura <- 1.72                # continua (m)
  cat('Discreta: num_hijos=', num_hijos, ' visitas=', visitas_hospital, '\n')
  cat('Continua: peso=', peso, 'kg, estatura=', estatura, 'm\n')
}

# 3. Escalas de medición: intervalo vs razón
escalas_intervalo_razon <- function(){
  temp_celsius <- 20.0  # escala de intervalo (0 no es ausencia)
  edad_anos <- 45L      # escala de razón (0 = ausencia)
  peso_kg <- 70.0       # escala de razón
  cat('Intervalo: temp_celsius=', temp_celsius, '\n')
  cat('Razón: edad_anos=', edad_anos, ' peso_kg=', peso_kg, '\n')
}

# 4. Latente vs observable
latente_observable <- function(){
  # "Calidad de vida" es latente; estimamos con puntajes observables
  item1 <- 4.0
  item2 <- 3.5
  item3 <- 4.5
  puntaje <- mean(c(item1, item2, item3))
  cat('Latente (estimado) calidad_de_vida =', round(puntaje,2), '\n')
}

# 5. Variables dummy (recodificación)
variables_dummy <- function(){
  estado_civil <- factor('casado', levels=c('soltero','casado','divorciado','viudo'))
  # usar model.matrix para crear dummies
  dummies <- model.matrix(~ estado_civil - 1)
  cat('Dummies para estado_civil:\n')
  print(dummies)
}

# 6. Variables censuradas (representación simple)
variables_censuradas <- function(){
  # tiempo: tiempo observado; evento: 1=evento observado, 0=censurado
  supervivencia <- data.frame(tiempo = c(5.0, 12.0, 3.0), evento = c(1, 0, 1))
  cat('Ejemplo censurado (tiempo, evento):\n')
  print(supervivencia)
}

# 7. Independientes vs dependientes: regresión simple
independientes_vs_dependientes <- function(){
  X <- c(1,2,3,4,5)
  Y <- c(2.1,4.9,7.0,8.9,11.2)
  df <- data.frame(X=X, Y=Y)
  fit <- lm(Y ~ X, data=df)
  cat('Modelo lineal (coeficientes):\n')
  print(coef(fit))
  # predicción
  x_new <- 6
  y_pred <- predict(fit, newdata = data.frame(X=x_new))
  cat('Predicción para X=6 -> Y≈', round(y_pred,2), '\n')
}

# Ejecutar ejemplos
cat('\n--- Variables cualitativas ---\n')
mostrar_nominales()
mostrar_dicotomicas()
mostrar_ordinales()

cat('\n--- Variables cuantitativas ---\n')
mostrar_cuantitativas()
escalas_intervalo_razon()

cat('\n--- Latentes, dummies y censura ---\n')
latente_observable()
variables_dummy()
variables_censuradas()

cat('\n--- Independientes vs Dependientes (regresión simple) ---\n')
independientes_vs_dependientes()
