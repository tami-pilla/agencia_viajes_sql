-- ESTADISTICAS POR REGION

-- ¿Cómo varían los precios y la cantidad de viajes según la región?

-- Para cada región se calcula:
--   cantidad_viajes: total de viajes disponibles en esa región
--   cantidad_ciudades: cuántas ciudades distintas ofrece esa región
--   precio_promedio: valor medio de los viajes (precio_base_usd)
--   precio_min / precio_max: rangos de precios disponibles

-- Esta vista es útil para analizar y comparar regiones entre sí, por ejemplo, identificar regiones más costosas o más variadas en destinos.

CREATE OR REPLACE VIEW vw_estadisticas_region AS
SELECT
  d.region,
  COUNT(*) AS cantidad_viajes,
  COUNT(DISTINCT d.ciudad_destino) AS cantidad_ciudades,
  ROUND(AVG(v.precio_base_usd), 2) AS precio_promedio,
  ROUND(MIN(v.precio_base_usd), 2) AS precio_min,
  ROUND(MAX(v.precio_base_usd), 2) AS precio_max
FROM viajes v
LEFT JOIN destinos d ON v.id_destino = d.id_destino
GROUP BY d.region
ORDER BY d.region;
