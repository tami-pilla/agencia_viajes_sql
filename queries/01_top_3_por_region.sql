-- TOP 3 DE VIAJES POR REGION ---

--Primero se crea una tabla intermedia que combina los datos de viajes y destinos.
--Luego, usando la función de ventana ROW_NUMBER(), se asigna una posición a cada viaje dentro de su región, ordenados de mayor a menor según la variable precio_base_usd
--Por ultimo, se filtran solo aquellos viajes que ocupan las primeras 3 posiciones en cada región, obteniendo así un ranking regional de los paquetes más costosos.

WITH viajes_destinos AS (
  SELECT v.*, d.region, d.ciudad_destino, d.pais_destino
  FROM viajes v
  LEFT JOIN destinos d on v.id_destino = d.id_destino
),
ranked AS (
  SELECT
    id_viaje, region, ciudad_destino, pais_destino, tipo_paquete, duracion_dias, precio_base_usd,
    ROW_NUMBER() OVER (PARTITION BY region ORDER BY precio_base_usd DESC) AS rn
  FROM viajes_destinos
)
SELECT *
FROM ranked
WHERE rn <= 3
ORDER BY region, rn;

