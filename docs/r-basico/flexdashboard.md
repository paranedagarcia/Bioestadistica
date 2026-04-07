---
id: flexdahsboard
title: Flexdahsboard
sidebar_label: "▪️Flexdahsboard"
sidebar_position: 6
description: "Creando un panel de control con R"
---


Es una librería de R que permite crear paneles de información y diseños interactivos similares, basados exclusivamente en el formato markdown.

Enlace: https://pkgs.rstudio.com/flexdashboard/



```text
---
title: "ES"
output: 
  flexdashboard::flex_dashboard:
    orientation: rows
    vertical_layout: fill
    source_code: embed
    theme:
      base_font:
        google: Roboto

---

```{r setup, include=FALSE}
library(flexdashboard)
library(dplyr)
library(tidyr)
library(ggplot2)
library(readxl)
library(highcharter)
library(htmltools)
library(viridis)
library(stringr)
```

```{r}
# carga de datos y definicion de variables

ies <- read_excel("Ficha institucional_2022.xlsx", sheet = "lista_IES")
colnames(ies) <- c("codigo", "nombre", "tipo", "tipo1", "tipo2", "tipo3", "estado")

# cambiar 'Centro de Formación Técnica' por 'CFT'
# 
ies$nombre <- str_replace(ies$nombre, "Instituto Profesional", "IP")
ies$nombre <- str_replace(ies$nombre, "Centro de Formación Técnica", "CFT")
ies$nombre <- str_replace(ies$nombre, "Universidad", "U.")
```


```{r}
# tipos de ies

# cuantos tipos existen y cuales son?
tipos <- ies %>%
  select(tipo) %>%
  group_by(tipo) %>%
  summarise(n = n())

tipos <- as.data.frame(tipos)
cft <- tipos[1,]
ip <- tipos[2,]
univ <- tipos[3,]

```

```{r}
# proporción de tipos IES

```




# General 

## 

###
```{r}
valueBox(cft$n, caption = cft$tipo,
         icon = "fa-exclamation-triangle",
         color = "danger"
)
```
###
```{r}
valueBox(ip$n, caption = ip$tipo,
         icon = "fa-signal",
         color = "info"
)
```

###
```{r}
valueBox(univ$n, caption = univ$tipo,
         icon = "fa-user",
         color = "info"
)
```
###
```{r}
valueBox(12, caption = "Totales",
         icon = "fa-thumbs-up",
         color = "success"
)
```

###
```{r}
valueBox(18, caption = "Nuevas",
         icon = "fa-exclamation-triangle",
         color = "purple"
)
```

```{r}
# diseño de panel de control
```

## 

### {.no-padding}
```{r}
# matriculas Universidad
# 
# matriculas

library(reshape)
matriculas <- read_excel("Ficha institucional_2022.xlsx", sheet = "Matrícula")
colnames(matriculas) <- c("year", "codigo", "atributo", "valor")

# convertir a formato ancho
matriculas <- matriculas %>%
  pivot_wider(names_from = atributo, values_from = valor)

colnames(matriculas)[3] <- "nueva"
colnames(matriculas)[4] <- "total"


# agregar columna nombre de IES mediante JOIN
# 
colores <- viridis::plasma(n = 15)

matriculas <- matriculas %>%  left_join(ies, by = "codigo") %>%
    select(year, codigo, nueva, total, nombre, tipo, estado)

matriculasU <- matriculas %>%
    filter(year == 2022 & tipo == 'Universidad' & estado == 'VIGENTE') 

matriculasU %>%
    arrange(desc(total)) %>%
    head(15) %>%

    hchart('bar', hcaes(x = nombre, y = total, color = colores)) %>%
    hc_add_theme(hc_theme_google()) %>%

    hc_tooltip(pointFormat = 'Matriculas: {point.y}') %>%
    hc_title(text = "Top de matrícula 2022", style = list(fontSize='18px', fontWeight= 'bold')) %>%
    hc_subtitle(text = 'Universidad', style = list(fontSize='14px')) 
   # hc_credits(enabled = TRUE, text = '@paraneda')
   # 

```

### {.no-padding}
```{r}

colores <- viridis::mako(n = 15)

matriculasIP <- matriculas %>%
    filter(year == 2022 & tipo == 'Instituto Profesional' & estado == 'VIGENTE') 

matriculasIP %>%    
    arrange(desc(total)) %>%
    head(15) %>%

    hchart('bar', hcaes(x = nombre, y = total, color = colores)) %>%
    hc_add_theme(hc_theme_google()) %>%

    hc_tooltip(pointFormat = 'Matriculas: {point.y}') %>%
    hc_title(text = "Top de matrícula 2022", style = list(fontSize='18px', fontWeight= 'bold')) %>%
    hc_subtitle(text = 'Instituto Profesional', style = list(fontSize='14px')) 
```


### {.no-padding}
```{r}
# cft
colores <- viridis::plasma(n = 15)
matriculasCFT <- matriculas %>% 
    filter(year == 2022 & tipo == 'Centro de Formación Técnica' & estado == 'VIGENTE')
    
matriculasCFT %>%  
    arrange(desc(total)) %>%
    head(15) %>%

    hchart('bar', hcaes(x = nombre, y = total, color = colores)) %>%
    hc_add_theme(hc_theme_google()) %>%

    hc_tooltip(pointFormat = 'Matriculas: {point.y}') %>%
    hc_title(text = "Top de matrícula 2022", style = list(fontSize='18px', fontWeight= 'bold')) %>%
    hc_subtitle(text = 'Centro de Formación Técnica', style = list(fontSize='14px')) 
```


##

### Matriculas nuevas {data-width=800} 
```{r}
#
colores <- viridis::mako(n = 20)
matriculas %>%
    arrange(desc(nueva)) %>%
    head(20) %>%

    hchart('column', hcaes(x = nombre, y = total, color = colores)) %>%
    hc_add_theme(hc_theme_google()) %>%

    hc_tooltip(pointFormat = 'Matriculas: {point.y}') %>%
    hc_title(text = "Top de matrícula nuevas 2022", style = list(fontSize='18px', fontWeight= 'bold')) 
```

### Instituciones 
```{r}
colores <- viridis::mako(n=3)
tipos %>%
    group_by(tipo) %>%
    #summarise(count = n()) %>%
    
    hchart('pie', hcaes(x = tipo, y = n, color = colores)) %>%
    hc_add_theme(hc_theme_google()) %>%
    
    hc_tooltip(pointFormat = 'Cantidad: {point.n}') %>%
    hc_title(text = "Tipo de Instituciones", style = list(fontSize='18px', fontWeight= 'bold')) 
```



# Análisis {data-icon=fa-ruler data-orientation=columns}

## {.tabset .tabset-fade}

### General 

### Antecedentes 

### Documentos

### {data-width=4}

##

###

###

# Datos {data-icon=fa-database}
##
### {data-height=850}
```{r}
dft <- matriculasU %>%
    select(nombre, tipo, nueva, total)

dft %>%
  DT::datatable(options = list(pageLenght = 50))
```

```