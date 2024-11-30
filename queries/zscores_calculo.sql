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

SELECT idpozo, prod_pet, fecha_data
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