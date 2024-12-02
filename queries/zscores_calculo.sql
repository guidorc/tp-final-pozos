-- produccion de petroleo
WITH stats AS (
    SELECT
        AVG(prod_pet::numeric) AS mean_pet,
        STDDEV(prod_pet::numeric) AS stddev_pet
    FROM produccion_2024
	WHERE prod_pet::numeric > 0
),
zscore_calculation AS (
    SELECT
        idpozo,
        prod_pet::numeric,
        (prod_pet::numeric - stats.mean_pet) / stats.stddev_pet AS zscore
    FROM produccion_2024, stats
)
SELECT
    idpozo,
    AVG(prod_pet) as mediana_pet,
    AVG(zscore) as mediana_zscore
FROM zscore_calculation
GROUP BY idpozo
ORDER BY mediana_zscore DESC
LIMIT 100;

--- Promedio y desvío standard de producción de petroleo
SELECT AVG(prod_pet::numeric) as mediana_pet, STDDEV(prod_pet::numeric) as std_pet
FROM produccion_2024
WHERE prod_pet::numeric > 0;

--- Analisis pozo particular
SELECT idpozo, prod_pet::numeric, fecha_data
FROM produccion_2024
WHERE idpozo = '164941';

-- produccion de gas
WITH stats AS (
    SELECT
        AVG(prod_gas::numeric) AS mean_gas,
        STDDEV(prod_gas::numeric) AS stddev_gas
    FROM produccion_2024
	WHERE prod_gas::numeric > 0
),
zscore_calculation AS (
    SELECT
        idpozo,
        prod_gas::numeric,
        (prod_gas::numeric - stats.mean_gas) / stats.stddev_gas AS zscore
    FROM produccion_2024, stats
)
SELECT
    idpozo,
    AVG(prod_gas) as mediana_gas,
    AVG(zscore) as mediana_zscore
FROM zscore_calculation
GROUP BY idpozo
ORDER BY mediana_zscore DESC
LIMIT 100;

--- Análisis pozos outliers
SELECT idpozo, prod_gas::numeric, provincia, areayacimiento, cuenca
FROM produccion_2024
WHERE idpozo IN ('10464', '10465', '154796')
GROUP BY idpozo, prod_gas::numeric, provincia, areayacimiento, cuenca;

--- Promedio y desvío standard de producción de gas
SELECT AVG(prod_gas::numeric) as mediana_gas, STDDEV(prod_pet::numeric) as std_gas
FROM produccion_2024
WHERE prod_gas::numeric > 0;