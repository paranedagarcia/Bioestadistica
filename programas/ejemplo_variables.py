# Ejemplo en Python: tipos de variables mencionadas en docs/01-introduccion/3-variables.md
# Comentarios y ejemplos sencillos para ilustrar uso y representación

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
