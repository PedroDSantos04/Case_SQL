


SELECT * FROM resultado.sp_turno

-- visualização de quantos votos foram anulados (total de 63891 votos anulados)
SELECT COUNT (nm_partido) FROM resultado.sp_turno
WHERE nm_partido = '#NULO#'

-- os 10 candidatos a prefeito de São Paulo que mais receberam votos
SELECT 
	nm_votavel,
	SUM(qt_votos) AS votos
FROM 
	resultado.sp_turno
WHERE ds_cargo_pergunta = 'Prefeito' AND nm_votavel <> 'Nulo'
GROUP BY nm_votavel
ORDER BY votos DESC
LIMIT 10

===========================================================

--quantos votos cada candidato recebeu em seu devido estado

SELECT 
	nm_municipio,
	nm_votavel,
	SUM(qt_votos) OVER (PARTITION BY nm_votavel ORDER BY qt_votos DESC) AS qntd_votos,
	RANK () OVER (PARTITION BY nm_votavel ORDER BY qt_votos DESC) AS num
FROM 
	resultado.sp_turno
WHERE nm_votavel <> 'Branco' AND nm_votavel <> 'Nulo'


