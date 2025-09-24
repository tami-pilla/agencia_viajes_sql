-- PRECIO RELATIVO POR REGION 

-- Primero, se calcula el promedio (AVG) y la suma total (SUM) del precio_base_usd para cada región (usando funciones de ventana).
-- Luego, Se calcula la diferencia entre el precio del viaje y el promedio regional y tambien el porcentaje que representa
-- ese viaje sobre el total de precios en su región.


WITH precio_base AS (
 SELECT
   v.id_viaje, v.tipo_paquete, v.duracion_dias, v.precio_base_usd,
   d.region, d.ciudad_destino, d.pais_destino
 FROM viajes v
 LEFT JOIN destinos d on v.id_destino = d.id_destino
),
stats AS (
 SELECT
   *,
   AVG(precio_base_usd)  OVER (PARTITION BY region) AS avg_region,
   SUM(precio_base_usd)  OVER (PARTITION BY region) AS sum_region
 FROM precio_base
)
SELECT
 id_viaje, region, ciudad_destino, pais_destino, tipo_paquete, duracion_dias, precio_base_usd,
 ROUND(precio_base_usd - avg_region, 2)   AS diferencia_con_el_prom,
 ROUND(precio_base_usd / NULLIF(sum_region,0) * 100, 2) AS porcentaje_de_suma_total
FROM stats
ORDER BY region, precio_base_usd DESC;

