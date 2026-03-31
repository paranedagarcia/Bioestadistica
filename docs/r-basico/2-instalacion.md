---
id: r-instalar
title: Instalación
sidebar_label: "▪️​Instalación"
sidebar_position: 2
---

## Instalación del lenguaje R

### Windows
1. Descarga el instalador desde [CRAN Windows](https://cran.r-project.org/bin/windows/base/)
2. Ejecuta el archivo `.exe` descargado
3. Sigue el asistente de instalación con opciones predeterminadas
4. Verifica la instalación abriendo CMD y ejecutando: `R --version`

### macOS
1. Descarga el instalador `.pkg` desde [CRAN macOS](https://cran.r-project.org/bin/macos/)
2. Selecciona la versión compatible con tu procesador (Apple Silicon o Intel)
3. Abre el instalador y sigue las instrucciones
4. Verifica desde Terminal: `R --version`

### Linux
**Ubuntu/Debian:**
```bash
sudo apt update
sudo apt install r-base r-base-dev
```

**Fedora/RHEL:**
```bash
sudo dnf install R
```

**Arch Linux:**
```bash
sudo pacman -S r
```

Verifica: `R --version`

## IDE Recomendado
- Instala [RStudio](https://posit.co/download/rstudio-desktop/) para una experiencia mejorada con editor, consola y visualización integrados.

- Instala [Positron](https://positron.posit.co/) para un proceso más profesional con ciencia de datos.

- Instale [Jupyter Lab](https://jupyterlab.readthedocs.io/en/latest/) como una interface simple y de laboratorio.

### Instalación de Jupyter Lab

:::tip Importante
Debe tener instalado Python 3.13 o superior de antemano.
:::

#### Instalar Python
Se sugiere instalar la version 3.13.12
- MacOs: https://www.python.org/ftp/python/3.13.12/python-3.13.12-macos11.pkg
- Windows: https://www.python.org/ftp/python/3.13.12/python-3.13.12-amd64.exe

#### Instalar Jupyter Lab

- Accede a la terminal y ejecuta:
```bash
pip install jupyterlab
```
Instalar kernel R "IRkernel" desde el terminal R: 
*user = FALSE para instalar a todos los usuarios del sistema*
- Ejecuta R en el terminal para que cambie a R > y ejecuta las siguientes sentencias:
```r
install.packages(IRkernel')
IRkernel::installspec(user=TRUE) 
q() # salir de la sesion
```

Para ejecutar KupyterLab, escribe en la terminal:
```bash
jupyter lab
```
