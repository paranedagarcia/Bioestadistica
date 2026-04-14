# Bioestadística con R y Python

Sitio educativo para aprender **Bioestadística** con R y Python, construido con [Docusaurus](https://docusaurus.io/).

## Contenido del Curso

- **Introducción a la Bioestadística**: Variables, niveles de medición, conceptos fundamentales
- **Estadística Descriptiva**: Medidas de tendencia central y dispersión, visualización
- **Probabilidad y Distribuciones**: Distribución normal, binomial, t de Student, chi-cuadrado
- **Inferencia Estadística**: Pruebas de hipótesis, intervalos de confianza, correlación, ANOVA
- **R para Bioestadística**: Introducción al lenguaje R con ejemplos biomédicos
- **Python para Bioestadística**: Introducción a Python con numpy, pandas, scipy y matplotlib

## Despliegue FTP automático

Se incluye un script que sube el contenido de la carpeta `build/` a un servidor FTP después de ejecutar `npm run build`.

- Archivo: `scripts/deploy-ftp.js`
- Variables de entorno: configura `FTP_HOST`, `FTP_USER`, `FTP_PASSWORD`, opcionalmente `FTP_PORT`, `FTP_SECURE`, `FTP_REMOTE_PATH`. Puedes copiar `.env.example` a `.env`.
- El script se ejecuta automáticamente porque `package.json` define un `postbuild` que lanza el script.

Uso (local):

```bash
# Instala la dependencia nueva
npm install

# Copia y edita credenciales
cp .env.example .env
# Rellena .env con tus credenciales FTP

# Construye y sube automáticamente al FTP
npm run build
```


