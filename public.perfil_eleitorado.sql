SELECT * FROM public.perfil_eleitorado 

SELECT
	COUNT(ds_grau_escolaridade) AS escolaridade,  ds_faixa_etaria AS idades, cd_grau_escolaridade AS codigo
FROM 
	public.perfil_eleitorado
GROUP BY idades, codigo
ORDER BY idades ASC

