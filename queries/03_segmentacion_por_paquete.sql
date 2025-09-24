-- SEGMENTACION DE PRECIOS POR TIPO DE PAQUETE --

-- Se ordenan los viajes por precio_base_usd de menor a mayor para cada tipo de paquete.
-- Luego se divide esa lista de viajes en 4 grupos lo mas similares segun su precio, con NTILE(). 
-- A cada fila se le asigna un número de cuartil 1 (más baratos) a 4 (más caros).
-- Por utlimo, se segmentan los valores con etiquetas usando un CASE 


WITH base AS (
  SELECT
    v.id_viaje, v.tipo_paquete, v.precio_base_usd,
    d.region, d.ciudad_destino
  FROM viajes v
  LEFT JOIN destinos d ON v.id_destino = d.id_destino 
),
cuartiles AS (
  SELECT *,
         NTILE(4) OVER (PARTITION BY tipo_paquete ORDER BY precio_base_usd) AS cuartil_precio
  FROM base
)
SELECT *,
  CASE cuartil_precio
    WHEN 1 THEN 'económico'
    WHEN 2 THEN 'intermedio'
    WHEN 3 THEN 'alto'
    WHEN 4 THEN 'premium'
  END AS segmento_precio
FROM cuartiles
ORDER BY tipo_paquete, precio_base_usd;

