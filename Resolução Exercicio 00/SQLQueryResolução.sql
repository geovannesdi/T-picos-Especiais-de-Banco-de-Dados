USE TopicosEspeciaisDeBancoDeDados
--=============================================================================
/*
Elabore uma consulta SQL quer retorne como resultado os dvds que foram alugados 
mais de 2 vezes em 2009. Apresentar o titulo do dvd e o total de locações. 
*/

SELECT 
	titulo, COUNT(titulo) AS 'Numeros de locação'
FROM
	dbo.TB_LOCACAO
JOIN
	dbo.TB_DVD
ON
	dbo.TB_LOCACAO.cd_dvd = dbo.TB_DVD.cd_dvd
WHERE
	dt_locacao  between '2008-12-31' and '2009-12-31'
GROUP BY 
	titulo
HAVING COUNT(dbo.TB_LOCACAO.cd_dvd) > 2
--=============================================================================


--=============================================================================
/*
Elabore  uma  consulta  SQL  que  retorne  como  resultado  os  títulos  dos  DVDs  que 
tiveram pelo menos um aluguel em Maio de 2009 e também pelo menos um aluguel 
em  Junho  de  2009.  Somente  os  filmes  que  tiveram  aluguéis  pelo  menos  nos  dois 
meses devem ser apresentados. 


SELECT 
	titulo, categoria, valor, dt_locacao 
FROM
	dbo.TB_LOCACAO
JOIN
	dbo.TB_DVD
ON
	dbo.TB_LOCACAO.cd_dvd = dbo.TB_DVD.cd_dvd
WHERE
	dt_locacao  between '2009-04-30' and '2009-06-01' or
	dt_locacao  between '2009-05-31' and '2009-07-01'
*/
--=============================================================================
