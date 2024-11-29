-- inconsistente
SELECT distinct pozo.idpozo, pozo.tipo_recurso as "pozo_recurso", prod.tipo_de_recurso as "prod_recurso"
FROM public.info_pozos as pozo
JOIN public.produccion_2024 as prod on pozo."idpozo" = prod."idpozo"
WHERE pozo.tipo_recurso != prod.tipo_de_recurso;

SELECT distinct pozo.tipo_recurso as "pozo_recurso", prod.tipo_de_recurso as "prod_recurso"
FROM public.info_pozos as pozo
JOIN public.produccion_2024 as prod on pozo."idpozo" = prod."idpozo";
WHERE pozo.tipo_recurso != prod.tipo_de_recurso;

SELECT *
FROM public.produccion_2024
WHERE tipo_de_recurso = 'No informado';

-- inconsistente
SELECT distinct pozo.idpozo, pozo.empresa as "pozo_empresa", prod.empresa as "prod_empresa"
FROM public.info_pozos as pozo
JOIN public.produccion_2024 as prod on pozo."idpozo" = prod."idpozo"
WHERE pozo.empresa != prod.empresa;

-- consistente
SELECT distinct pozo.idpozo, pozo.profundidad as "pozo_profundidad", prod.profundidad as "prod_profundidad"
FROM public.info_pozos as pozo
JOIN public.produccion_2024 as prod on pozo."idpozo" = prod."idpozo"
WHERE pozo.profundidad != prod.profundidad;

-- consistente (1 caso)
SELECT distinct pozo.idpozo, pozo.formacion as "pozo_formacion", prod.formacion as "prod_formacion"
FROM public.info_pozos as pozo
JOIN public.produccion_2024 as prod on pozo."idpozo" = prod."idpozo"
WHERE pozo.formacion != prod.formacion;

-- consistente
SELECT distinct pozo.idpozo, pozo.clasificacion as "pozo_clasificacion", prod.clasificacion as "prod_clasificacion"
FROM public.info_pozos as pozo
JOIN public.produccion_2024 as prod on pozo."idpozo" = prod."idpozo"
WHERE pozo.clasificacion != prod.clasificacion;


-- consistente
SELECT distinct pozo.idpozo, pozo.subclasificacion as "pozo_subclasificacion", prod.clasificacion as "prod_subclasificacion"
FROM public.info_pozos as pozo
JOIN public.produccion_2024 as prod on pozo."idpozo" = prod."idpozo"
WHERE pozo.subclasificacion != prod.subclasificacion;

-- consistente
SELECT distinct pozo.idpozo, pozo.provincia as "pozo_provincia", prod.provincia as "prod_provincia"
FROM public.info_pozos as pozo
JOIN public.produccion_2024 as prod on pozo."idpozo" = prod."idpozo"
WHERE pozo.provincia != prod.provincia;

-- consistente
SELECT distinct pozo.idpozo, pozo.cuenca as "pozo_cuenca", prod.cuenca as "prod_cuenca"
FROM public.info_pozos as pozo
JOIN public.produccion_2024 as prod on pozo."idpozo" = prod."idpozo"
WHERE pozo.cuenca != prod.cuenca;

-- pozos no presentes en el dataset general
SELECT DISTINCT idpozo
FROM public.produccion_2024 as prod
WHERE prod.idpozo NOT IN (SELECT idpozo FROM public.info_pozos);