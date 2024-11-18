SELECT pozo.idpozo, pozo.empresa, prod.tipopozo, pozo.tipoextraccion, tipo_de_recurso, prod_pet, prod_gas, prod_agua, iny_agua, iny_gas, iny_co2, fecha_data
FROM public.info_pozos as pozo
INNER JOIN public.produccion_2024 as prod on prod.idpozo = pozo.idpozo
LIMIT 1000;