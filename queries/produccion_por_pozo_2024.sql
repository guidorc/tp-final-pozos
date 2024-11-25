SELECT pozo.idpozo, pozo.empresa, yacimiento, pozo.tipopozo, pozo.tipoextraccion, prod.prod_pet, prod.prod_gas, prod.prod_agua, prod.fecha_data, pozo.tipoestado, geojson
FROM public.info_pozos as pozo
inner join public.produccion_2024 as prod on prod.idpozo = pozo.idpozo
order by pozo.idpozo desc;