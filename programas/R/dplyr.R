# r
library(dplyr)
library(readr)
library(tibble)

# Cargar datos (ajusta la ruta si hace falta)
framingham <- read_csv("../../data/framingham.csv", show_col_types = FALSE)
framingham_tbl <- framingham |> as_tibble()

cols <- colnames(framingham_tbl)

# 1) Pipes: seleccionar columnas comunes y filtrar por edad >= 50, luego slice
example_pipes <- framingham_tbl
if (all(c("age", "male", "sysBP") %in% cols)) {
  example_pipes <- framingham_tbl |>
    select(age, male, sysBP) |>
    filter(age >= 50) |>
    slice(1:6)
} else {
  example_pipes <- framingham_tbl |> slice(1:6)
}

# 2) select (uso de any_of para evitar errores si la columna falta)
example_select <- framingham_tbl |> select(any_of(c("age", "male", "sysBP", "totChol", "BMI")))

# 3) filter (ejemplo: fumadores actuales si existe la columna)
if ("currentSmoker" %in% cols) {
  example_filter <- framingham_tbl |> filter(currentSmoker == 1)
} else if ("smoking" %in% cols) {
  example_filter <- framingham_tbl |> filter(smoking == 1)
} else {
  example_filter <- framingham_tbl |> filter(row_number() <= 0) # tibble vacío como fallback
}

# 4) slice (primeras 10 filas)
example_slice <- framingham_tbl |> slice(1:10)

# 5) mutate (crear nueva variable; si BMI existe calcula z-score, sino añade row_id)
if ("BMI" %in% cols) {
  example_mutate <- framingham_tbl |> mutate(BMI_z = (BMI - mean(BMI, na.rm = TRUE)) / sd(BMI, na.rm = TRUE))
} else {
  example_mutate <- framingham_tbl |> mutate(row_id = row_number())
}

# 6) group_by + summarize (media de edad por sexo si existen las columnas)
if (all(c("male", "age") %in% cols)) {
  example_group_summary <- framingham_tbl |>
    group_by(male) |>
    summarize(mean_age = mean(age, na.rm = TRUE), count = n(), .groups = "drop")
} else {
  example_group_summary <- tibble()
}

# 7) aggregate (base R): media de sysBP por male (fallback a tibble vacío si faltan columnas)
if (all(c("sysBP", "male") %in% cols)) {
  aggregate_result <- aggregate(sysBP ~ male, data = framingham_tbl, FUN = function(x) mean(x, na.rm = TRUE))
  aggregate_result <- as_tibble(aggregate_result)
} else {
  aggregate_result <- tibble()
}

# Devolver todos los ejemplos como una lista (última expresión retorna el objeto)
examples <- list(
  framingham_tbl = framingham_tbl,
  pipes = example_pipes,
  select = example_select,
  filter = example_filter,
  slice = example_slice,
  mutate = example_mutate,
  group_summary = example_group_summary,
  aggregate = aggregate_result
)

examples