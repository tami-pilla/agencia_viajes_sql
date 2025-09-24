-- VIAJES POR SEGMENTO 

-- Permite analizar cuántos viajes hay por tipo de paquete y duración, agrupando los viajes en categorías de duración (corto, medio, largo, muy largo).
-- ¿Qué tipo de paquetes son más comunes en viajes cortos?
-- ¿Predominan ciertos paquetes en viajes largos?


Código SQL:
CREATE OR REPLACE VIEW vw_viajes_por_segmento AS
SELECT
  CASE
    WHEN v.duracion_dias < 4 THEN 'corto (1-3)'
    WHEN v.duracion_dias < 8 THEN 'medio (4-7)'
    WHEN v.duracion_dias < 15 THEN 'largo (8-14)'
    ELSE 'muy largo (15+)'
  END AS categoria_duracion,
  v.tipo_paquete,
  COUNT(*) AS cantidad
FROM viajes v
GROUP BY categoria_duracion, v.tipo_paquete
ORDER BY categoria_duracion, v.tipo_paquete;
