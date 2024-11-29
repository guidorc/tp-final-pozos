-- Consistente
SELECT cod_area, area, COUNT(DISTINCT area) AS area_count
FROM public.info_pozos
GROUP BY cod_area, area
HAVING COUNT(DISTINCT area) > 1;

-- Consistente
SELECT cod_yacimiento, yacimiento, COUNT(DISTINCT yacimiento) AS yacimiento_count
FROM public.info_pozos
GROUP BY cod_yacimiento, yacimiento
HAVING COUNT(DISTINCT yacimiento) > 1;

-- Inconsistente
SELECT * 
FROM info_pozos
WHERE 
    adjiv_fecha_inicio_perf::date > adjiv_fecha_fin_perf::date;
	
-- Consistente
SELECT * 
FROM info_pozos
WHERE 
    adjiv_fecha_inicio_term::date > adjiv_fecha_fin_term::date;

