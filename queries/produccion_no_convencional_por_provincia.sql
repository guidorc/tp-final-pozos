-- Producción de petroleo no convencional por provincia (sin Neuquén)
SELECT 
	provincia,
	prod_pet::numeric 
FROM public.produccion_no_convencional
WHERE prod_pet::numeric > 0 AND EXTRACT(YEAR FROM fecha_data::date) = 2024 AND provincia != 'Neuquén'
GROUP BY provincia, prod_pet::numeric
ORDER BY provincia DESC;

-- Producción de petroleo no convencional Neuquén
SELECT areayacimiento, AVG(prod_pet::numeric) as avg_pet
FROM public.produccion_no_convencional
WHERE prod_pet::numeric > 0 AND EXTRACT(YEAR FROM fecha_data::date) = 2024 AND provincia = 'Neuquén'
GROUP BY areayacimiento
ORDER BY avg_pet DESC
LIMIT 10;

-- Producción de gas no convencional por provincia (sin Neuquen)
SELECT 
	provincia,
	prod_gas::numeric
FROM public.produccion_no_convencional
WHERE prod_gas::numeric > 0 AND EXTRACT(YEAR FROM fecha_data::date) = 2024 AND provincia != 'Neuquén'
GROUP BY provincia, prod_gas::numeric
ORDER BY provincia DESC;

-- Producción de gas no convencional Neuquén
SELECT 
	areayacimiento,
	avg(prod_gas::numeric) as avg_gas
FROM public.produccion_no_convencional
WHERE prod_gas::numeric > 0 AND EXTRACT(YEAR FROM fecha_data::date) = 2024 AND provincia = 'Neuquén'
GROUP BY areayacimiento
ORDER BY avg_gas DESC
LIMIT 10;