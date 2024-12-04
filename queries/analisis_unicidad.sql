-- Unicidad dataset general
	-- chequear ids repetidos
SELECT idpozo, COUNT(*)
FROM public.info_pozos
GROUP BY idpozo
HAVING COUNT(*) > 1;

	-- Busqueda de filas duplicadas
SELECT sigla, area, cod_area, empresa, yacimiento, cod_yacimiento, formacion, cuenca, provincia, cota, profundidad, clasificacion, subclasificacion, tipo_recurso, sub_tipo_recurso, gasplus, tipopozo, tipoextraccion, tipoestado, geom, adjiv_fecha_inicio_perf, adjiv_fecha_fin_perf, adjiv_fecha_inicio_term, adjiv_fecha_fin_term, geojson, COUNT(*)
FROM public.info_pozos
GROUP BY sigla, area, cod_area, empresa, yacimiento, cod_yacimiento, formacion, cuenca, provincia, cota, profundidad, clasificacion, subclasificacion, tipo_recurso, sub_tipo_recurso, gasplus, tipopozo, tipoextraccion, tipoestado, geom, adjiv_fecha_inicio_perf, adjiv_fecha_fin_perf, adjiv_fecha_inicio_term, adjiv_fecha_fin_term, geojson
HAVING COUNT(*)>1;

-- Unicidad Producción 2024
	-- chequear idpozo + fecha data repetidas
SELECT idpozo, fecha_data, count(*)
FROM public.produccion_2024
group by idpozo, fecha_data
HAVING COUNT(*)>1;

-- Unicidad Producción no convencional
	-- chequear idpozo + fecha data repetidas
SELECT idpozo, fecha_data, count(*)
FROM public.produccion_no_convencional
group by idpozo, fecha_data
HAVING COUNT(*)>1;