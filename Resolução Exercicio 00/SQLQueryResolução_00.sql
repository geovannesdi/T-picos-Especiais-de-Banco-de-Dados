USE TopicosEspeciaisDeBancoDeDados
--=============================================================================
/*
Elabore uma consulta SQL quer retorne como resultado os dvds que foram alugados 
mais de 2 vezes em 2009. Apresentar o titulo do dvd e o total de locações. 

SELECT 
	titulo, COUNT(titulo) AS 'Numeros de locação'
FROM
	dbo.TB_LOCACAO
JOIN
	dbo.TB_DVD
ON
	dbo.TB_LOCACAO.cd_dvd = dbo.TB_DVD.cd_dvd
WHERE
	dt_locacao >= '20090101' and L.dt_locacao < '20100101'
GROUP BY 
	titulo
HAVING COUNT(dbo.TB_LOCACAO.cd_dvd) > 2 -- Restrição em cima do group by
*/

--=============================================================================


--=============================================================================
/*
Elabore  uma  consulta  SQL  que  retorne  como  resultado  os  títulos  dos  DVDs  que 
tiveram pelo menos um aluguel em Maio de 2009 e também pelo menos um aluguel 
em  Junho  de  2009.  Somente  os  filmes  que  tiveram  aluguéis  pelo  menos  nos  dois 
meses devem ser apresentados. 
*/

SELECT 
	D.titulo
FROM
	dbo.TB_DVD D
WHERE
	D.cd_dvd in (SELECT L.cd_dvd FROM 
	
	
				)	

--=============================================================================
/*
Elabore  uma  consulta  SQL  que  retorne  os  Clientes  (nomes)  que  nunca  alugaram 
filmes.
*/

SELECT 
	L.cd_cliente
FROM
	dbo.TB_LOCACAO L
WHERE
	