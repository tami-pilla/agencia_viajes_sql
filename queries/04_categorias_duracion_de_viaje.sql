-- CATEGORIAS DE DURACION DE VIAJE + CONTEO POR TIPO DE PAQUETE --

-- Primero se segmenta la variable duracion_dias en categorías mediante una cláusula CASE, generando así una nueva columna llamada dias_agrupados.
-- Luego se agrupan los registros por esa categoría de duración y por el tipo_paquete.
-- Finalmente cuenta cuántos viajes hay en cada combinación.
-- El resultado permite analizar la distribución de tipos de paquetes según la duración de los viajes.

WITH viajes_agrupados AS (
  SELECT
    v.*,
    CASE
      WHEN duracion_dias < 4  THEN 'corto (1-3)'
      WHEN duracion_dias < 8  THEN 'medio (4-7)'
      WHEN duracion_dias < 15 THEN 'largo (8-14)'
      ELSE 'muy largo (15+)'
    END AS dias_agrupados
  FROM viajes v
)
SELECT dias_agrupados, tipo_paquete, COUNT(*) AS cantidad
FROM viajes_agrupados
GROUP BY dias_agrupados, tipo_paquete
ORDER BY dias_agrupados, tipo_paquete;




