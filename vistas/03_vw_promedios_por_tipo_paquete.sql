-- PROMEDIO DE DURACIÓN Y PRECIO POR TIPO DE PAQUETE

-- Esta vista permite comparar los distintos tipos de paquetes turísticos, observando cuánto duran en promedio y cuál es su costo medio.
-- Permite  ver qué tipos de paquetes son ser más largos o mas costosos.

CREATE OR REPLACE VIEW vw_promedios_por_tipo_paquete AS
SELECT
  tipo_paquete,
  ROUND(AVG(duracion_dias), 1) AS duracion_promedio,
  ROUND(AVG(precio_base_usd), 2) AS precio_promedio_usd,
  COUNT(*) AS cantidad_viajes
FROM viajes
GROUP BY tipo_paquete
ORDER BY tipo_paquete;