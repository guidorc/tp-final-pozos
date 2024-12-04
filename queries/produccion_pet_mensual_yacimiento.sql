SELECT mes, AVG(prod_pet::numeric) as avg_prod
from produccion_2024
where areayacimiento = 'BAJADA DEL PALO OESTE'
group by mes
order by mes::numeric ASC;