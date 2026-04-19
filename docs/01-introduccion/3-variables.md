---
id: variables
title: Tipos de variables
sidebar_label: "Variables"
sidebar_position: 3
---

Una **variable** se define como cualquier característica, rasgo o propiedad de una unidad experimental (paciente, objeto o ser vivo) cuyo valor puede cambiar o variar entre los diferentes elementos de una población.

La taxonomía de las variables es crítica, ya que determina el tipo de análisis estadístico y los modelos matemáticos que pueden aplicarse a los datos recolectados. 

![](img/variables.webp)

## Variables Cualitativas (Categóricas)
Miden una cualidad o atributo no numérico en cada unidad experimental. Los datos resultantes se clasifican según similitudes o diferencias de clase.

### **Nominales** 
Consisten en categorías que sirven como etiquetas e identificadores, sin que exista un orden jerárquico o un significado numérico entre ellas.

**Dicotómicas (o Binomiales):** Caso especial con solo dos categorías excluyentes. 

* *Ejemplo:* Género (masculino/femenino), presencia de enfermedad (sí/no), estado vital (vivo/muerto).
    
**Politómicas:** Presentan más de dos categorías. 

* *Ejemplo:* Grupo sanguíneo (A, B, O, AB), estado civil (soltero, casado, divorciado, viudo), color de ojos.
### **Ordinales** 
Poseen un orden o jerarquía significativa entre sus categorías, aunque no existe una distancia constante o cuantificable entre un nivel y otro.
* *Ejemplo:* Etapas de un cáncer (I, II, III, IV), escalas de dolor (leve, moderado, severo), nivel de satisfacción (muy pobre a muy bueno).

## Variables Cuantitativas (Numéricas)
Miden una cantidad numérica y permiten señalar cuán grandes son las diferencias observadas entre individuos.

**Discretas:** Toman valores aislados, generalmente números enteros, y resultan de un proceso de conteo. Poseen "brechas" entre los posibles valores.
*   *Ejemplo:* Número de hijos, cantidad de visitas al hospital, conteo de glóbulos blancos por unidad de sangre.

**Continuas:** Pueden adoptar cualquier valor dentro de un intervalo real, permitiendo una cantidad infinita de fracciones o decimales. Surgen típicamente de procesos de medición.
*   *Ejemplo:* Peso de un recién nacido, estatura, presión arterial, niveles de glucosa en plasma, tiempo de reacción.

## Escalas de Medición Cuantitativa
Es vital distinguir entre la naturaleza de los datos según su origen (cero absoluto):

**Escala de Intervalo:** Los datos tienen un orden y distancias significativas, pero el valor "cero" es arbitrario y no indica ausencia de la característica.
*   *Ejemplo:* Temperatura en grados Celsius o Fahrenheit. Un valor de $0^{\circ}C$ no significa ausencia de temperatura.

**Escala de Razón:** Posee todas las propiedades de la escala de intervalo más un cero absoluto o natural, lo que permite realizar comparaciones de proporcionalidad (ej. $x$ es el doble que $y$).
*   *Ejemplo:* Peso en kilogramos, edad en años, temperatura en grados Kelvin (donde 0 K es el cero absoluto).

## Otras Clasificaciones Especiales
**Variables Latentes y Observables:** Una variable latente es un atributo no directamente medible (como la inteligencia o calidad de vida), mientras que las variables observables son las que se utilizan para cuantificar dicho concepto (como el puntaje de un test de CI).

**Variables Indicadoras (Dummy):** Recodificación binaria (0 y 1) de variables cualitativas para que puedan ser incluidas en modelos de regresión matemática.
    *   *Ejemplo:* En un modelo de riesgo coronario, asignar 1 a "fumador" y 0 a "no fumador".

**Variables Censuradas:** Comunes en el análisis de supervivencia. Ocurren cuando se conoce que el valor de la variable supera cierto límite, pero no se conoce el valor exacto (ej. un paciente abandona el estudio antes de que ocurra el evento final).

**Independientes (Explicativas) vs. Dependientes (Respuesta):** En modelos predictivos, la variable dependiente ($Y$) es el resultado de interés, mientras que la independiente ($X$) es la que se utiliza para explicar o predecir dicho resultado.

<br />
#### 📝 Programación:
<Tabs>
<TabItem value="var" label="Antecedentes" default>
<div class="alert alert--primary">
**Variables:**<br />
Uso de los tipos de variables mencionadas, con comentarios y ejemplos sencillos para ilustrar uso y representación.
</div>
</TabItem>
<TabItem value="var-python" label="Pyhton" default>
```python showLineNumbers
# Implementación en Python

def mostrar_nominales():
    grupo_sanguineo = 'A'             # nominal (politómica)
    genero = 'masculino'             # nominal
    print('Nominales: grupo_sanguineo=', grupo_sanguineo, 'genero=', genero)

def mostrar_dicotomicas():
    presencia_enfermedad = True      # dicotómica (sí/no)
    fumador = False                  # dicotómica
    print('Dicotómicas: presencia_enfermedad=', presencia_enfermedad, 'fumador=', fumador)

def mostrar_ordinales():
    niveles_dolor = ['leve', 'moderado', 'severo']
    paciente_nivel = 'moderado'      # ordinal (tiene orden implícito)
    orden = niveles_dolor.index(paciente_nivel)
    print('Ordinal: paciente_nivel=', paciente_nivel, '(orden=', orden, ')')

def mostrar_cuantitativas():
    num_hijos = 2                    # discreta (conteo)
    visitas_hospital = 5             # discreta
    peso = 3.45                      # continua (kg)
    estatura = 1.72                  # continua (m)
    print('Discreta: num_hijos=', num_hijos, 'visitas=', visitas_hospital)
    print('Continua: peso=', peso, 'kg, estatura=', estatura, 'm')

def escalas_intervalo_razon():
    temp_celsius = 20.0              # escala de intervalo (0 no es ausencia)
    edad_anos = 45                   # escala de razón (0 significa ausencia de edad)
    peso_kg = 70.0                   # escala de razón
    print('Intervalo: temp_celsius=', temp_celsius, '°C')
    print('Razón: edad_anos=', edad_anos, 'años, peso_kg=', peso_kg, 'kg')

def latente_observable():
    # "Calidad de vida" es latente; usamos puntajes observables (ítems) para estimarla
    item1 = 4.0  # dimensión física
    item2 = 3.5  # dimensión mental
    item3 = 4.5  # dimensión social
    puntaje_observable = (item1 + item2 + item3) / 3
    print('Latente: calidad_de_vida (estimada) =', round(puntaje_observable, 2))

def variables_dummy():
    estado_civil = 'casado'          # politómica
    # recodificación manual a dummies
    estados = ['soltero', 'casado', 'divorciado', 'viudo']
    dummies = {f'dummy_{e}': (1 if estado_civil == e else 0) for e in estados}
    print('Dummies para estado_civil:', dummies)

def variables_censuradas():
    # Representación simple: tiempo observado y bandera de censura
    # tiempo = tiempo hasta evento o hasta última observación
    # censurado = True si conozco solo que superó el tiempo observado
    supervivencia = [ (5.0, False), (12.0, True), (3.0, False) ]
    print('Ejemplo censurado (tiempo, censurado):', supervivencia)

def independientes_vs_dependientes():
    # Datos de ejemplo (X independiente, Y dependiente)
    X = [1, 2, 3, 4, 5]
    Y = [2.1, 4.9, 7.0, 8.9, 11.2]
    # Ajuste por mínimos cuadrados (pendiente y ordenada)
    n = len(X)
    mean_x = sum(X) / n
    mean_y = sum(Y) / n
    cov_xy = sum((xi - mean_x) * (yi - mean_y) for xi, yi in zip(X, Y))
    var_x = sum((xi - mean_x) ** 2 for xi in X)
    slope = cov_xy / var_x
    intercept = mean_y - slope * mean_x
    print('Modelo simple: Y = {:.3f} * X + {:.3f}'.format(slope, intercept))
    # Predicción ejemplo
    x_new = 6
    y_pred = slope * x_new + intercept
    print('Predicción para X=6 -> Y≈{:.2f}'.format(y_pred))

if __name__ == '__main__':
    print('\n--- Variables cualitativas ---')
    mostrar_nominales()
    mostrar_dicotomicas()
    mostrar_ordinales()

    print('\n--- Variables cuantitativas ---')
    mostrar_cuantitativas()
    escalas_intervalo_razon()

    print('\n--- Latentes, dummies y censura ---')
    latente_observable()
    variables_dummy()
    variables_censuradas()

    print('\n--- Independientes vs Dependientes (regresión simple) ---')
    independientes_vs_dependientes()
```
</TabItem>
<TabItem value="var-r" label="R" default>
```r showLineNumbers
# Implementación en R

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

```
</TabItem>
</Tabs><br />