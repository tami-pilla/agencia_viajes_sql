Agencia de Viajes - Análisis SQL - Base de Datos SQLite

Este proyecto está orientado a mostrar el uso de SQL para el análisis y segmentación de datos y creación de vistas reutilizables.
El objetivo es explorar los datos y generar visualizaciones que respondan a interrogantes de negocio.

La temática es en torno a una agencia de viajes, sus destinos, tipos de paquetes, precios y duraciones.

El archivo `agencia_viajes.sqlite` contiene todas las tablas, datos e índices necesarios para ejecutar las consultas del proyecto.

Se puede abrir con herramientas como:
- [DBeaver](https://dbeaver.io/) (usado en este proyecto)

Funciones utilizadas:
- CTEs: para estructurar consultas complejas de forma legible.
- Window Functions: ROW_NUMBER, RANK,  NTILE, AVG OVER, SUM OVER.
- CASE WHEN para clasificaciones o agrupamientos.
- Funciones de agregación: COUNT, AVG, MIN, MAX, ROUND, NULLIF.
- Vistas: consultas almacenadas reutilizables para conectar a dashboards.
- LEFT JOIN entre tablas viajes y destinos.
