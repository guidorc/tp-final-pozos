SELECT idpozo, fechaingreso, count(*)
FROM public.produccion_no_convencional
group by idpozo, fechaingreso
HAVING COUNT(*)>1;