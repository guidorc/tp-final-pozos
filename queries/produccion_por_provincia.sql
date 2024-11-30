-- Producción de petroleo por provincia
SELECT 
	provincia,
	cuenca,
	areayacimiento,
	AVG(prod_pet::numeric) as avg_pet, 
	STDDEV(prod_pet::numeric) AS std_pet
FROM public.produccion_2024
WHERE prod_pet::numeric > 0
GROUP BY provincia, cuenca, areayacimiento
ORDER BY provincia DESC;

-- Producción de gas por provincia
SELECT 
	provincia,
	cuenca,
	areayacimiento,
	AVG(prod_gas::numeric) as avg_gas, 
	STDDEV(prod_gas::numeric) AS std_gas
FROM public.produccion_2024
WHERE prod_gas::numeric > 0 and provincia = 'Estado Nacional'
GROUP BY provincia, cuenca, areayacimiento
ORDER BY provincia DESC;

-- Producción de gas estado nacional
SELECT 
	provincia,
	cuenca,
	areayacimiento,
	prod_gas::numeric
FROM public.produccion_2024
WHERE prod_gas::numeric > 0 and provincia = 'Estado Nacional';