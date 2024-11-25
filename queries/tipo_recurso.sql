SELECT DISTINCT pozo.idpozo, pozo.tipo_recurso, count(*)
FROM public.info_pozos as pozo
JOIN public.produccion_2024 as prod on pozo.idpozo = prod.idpozo
WHERE pozo.tipo_recurso = 'NO CONVENCIONAL'
group by pozo.idpozo, pozo.tipo_recurso;

SELECT DISTINCT pozo.tipo_recurso, count(*)
FROM public.info_pozos as pozo
JOIN public.produccion_no_convencional as prod on pozo.idpozo = prod.idpozo
group by pozo.tipo_recurso;