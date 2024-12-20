-- Tipo de recurso (consistente)
SELECT distinct pozo.idpozo, pozo.tipo_recurso as "pozo_recurso", prod.tipo_de_recurso as "prod_recurso"
FROM public.info_pozos as pozo
JOIN public.produccion_no_convencional as prod on pozo."idpozo" = prod."idpozo"
WHERE pozo.tipo_recurso != prod.tipo_de_recurso;

-- Empresa (inconsistente)
SELECT distinct pozo.idpozo, pozo.empresa as "pozo_empresa", prod.empresa as "prod_empresa"
FROM public.info_pozos as pozo
JOIN public.produccion_no_convencional as prod on pozo."idpozo" = prod."idpozo"
WHERE pozo.empresa != prod.empresa;

-- Profundidad (consistente)
SELECT distinct pozo.idpozo, pozo.profundidad as "pozo_profundidad", prod.profundidad as "prod_profundidad"
FROM public.info_pozos as pozo
JOIN public.produccion_no_convencional as prod on pozo."idpozo" = prod."idpozo"
WHERE pozo.profundidad != prod.profundidad;

-- Formación (consistente)
SELECT distinct pozo.idpozo, pozo.formacion as "pozo_formacion", prod.formacion as "prod_formacion"
FROM public.info_pozos as pozo
JOIN public.produccion_no_convencional as prod on pozo."idpozo" = prod."idpozo"
WHERE pozo.formacion != prod.formacion;

-- Clasificación (consistente)
SELECT distinct pozo.idpozo, pozo.clasificacion as "pozo_clasificacion", prod.clasificacion as "prod_clasificacion"
FROM public.info_pozos as pozo
JOIN public.produccion_no_convencional as prod on pozo."idpozo" = prod."idpozo"
WHERE pozo.clasificacion != prod.clasificacion;


-- Subclasificación (consistente)
SELECT distinct pozo.idpozo, pozo.subclasificacion as "pozo_subclasificacion", prod.clasificacion as "prod_subclasificacion"
FROM public.info_pozos as pozo
JOIN public.produccion_no_convencional as prod on pozo."idpozo" = prod."idpozo"
WHERE pozo.subclasificacion != prod.subclasificacion;

-- Provincia (consistente)
SELECT distinct pozo.idpozo, pozo.provincia as "pozo_provincia", prod.provincia as "prod_provincia"
FROM public.info_pozos as pozo
JOIN public.produccion_no_convencional as prod on pozo."idpozo" = prod."idpozo"
WHERE pozo.provincia != prod.provincia;

-- Cuenca (consistente)
SELECT distinct pozo.idpozo, pozo.cuenca as "pozo_cuenca", prod.cuenca as "prod_cuenca"
FROM public.info_pozos as pozo
JOIN public.produccion_no_convencional as prod on pozo."idpozo" = prod."idpozo"
WHERE pozo.cuenca != prod.cuenca;

-- pozos no presentes en el dataset general
SELECT DISTINCT idpozo
FROM public.produccion_no_convencional as prod
WHERE prod.idpozo NOT IN (SELECT idpozo FROM public.info_pozos);