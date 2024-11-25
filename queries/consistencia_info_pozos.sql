SELECT cod_area, area, COUNT(DISTINCT area) AS area_count
FROM public.info_pozos
GROUP BY cod_area, area
HAVING COUNT(DISTINCT area) > 1;

SELECT cod_yacimiento, yacimiento, COUNT(DISTINCT yacimiento) AS yacimiento_count
FROM public.info_pozos
GROUP BY cod_yacimiento, yacimiento
HAVING COUNT(DISTINCT yacimiento) > 1;
