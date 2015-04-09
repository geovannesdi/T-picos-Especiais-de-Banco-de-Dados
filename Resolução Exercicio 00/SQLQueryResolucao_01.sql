/* Criar  uma  Visão  VW_FUNCIONARIO  a  ser  utilizada  por  outra  aplicação  ou 
usuário.  A  visão  deve  apresentar  todas  as  informações  da  tabela 
TB_FUNCIONARIO exceto o Salário. */

CREATE VIEW 
	VW_FUNCIONARIO AS
SELECT 
	F.matricula, F.nm_funcionario, F.sexo, F.cd_setor
FROM 
	TB_FUNCIONARIO F 


SELECT * FROM VW_FUNCIONARIO

/*
Criar  uma  Visão  VW_FUNCIONARIO_COMPLETO  que  apresente  os  seguintes 
atributos:  MATRICULA,  NOME,  SEXO,  SALARIO,  CD_SETOR,  NM_SETOR, 
CD_DEPARTAMENTO, NM_DEPARTAMENTO.
*/

CREATE VIEW VW_FUNCIONARIO_COMPLETO AS

SELECT 
	F.matricula, F.nm_funcionario, F.sexo, 
	F.salario, S.cd_setor, S.nm_setor,
	D.cd_departamento, D.nm_departamento
FROM
	TB_FUNCIONARIO F 
INNER JOIN
	TB_SETOR S ON F.cd_setor = S.cd_setor
INNER JOIN
    TB_DEPARTAMENTO D ON D.cd_DEPARTAMENTO = S.cd_departamento

SELECT * FROM VW_FUNCIONARIO_COMPLETO

/*
Criar  uma  Visão  VW_SETOR  com  os  seguintes  atributos:  CD_SETOR, 
NM_SETOR, NM_GERENTE, NM_DEPARTAMENTO. A visão deve apresentar 
somente os Setores que possuem funcionários alocados.
*/

CREATE VIEW VW_SETOR AS 

SELECT 
	S.CD_SETOR,S.NM_SETOR, S.NM_GERENTE, D.NM_DEPARTAMENTO 
FROM 
	TB_SETOR S 
INNER JOIN 
	TB_DEPARTAMENTO D ON (D.CD_DEPARTAMENTO = S.CD_DEPARTAMENTO)
WHERE 
	EXISTS (
				SELECT 
					TB_FUNCIONARIO.CD_SETOR 
				FROM 
					TB_FUNCIONARIO 
				WHERE (S.CD_SETOR = TB_FUNCIONARIO.CD_SETOR)
			)

/*
Criar  uma  Visão  VW_TOTAL_SOLICITACAO_DEPARTAMENTO  que 
apresente o total de solicitações por Departamento.
*/

CREATE VIEW VW_TOTAL_SOLICITACAO_DEPARTAMENTO AS 
SELECT  
	D.NM_DEPARTAMENTO,
	COUNT(S.CD_SOLICITACAO) AS SOLICITACOES  
FROM TB_SOLICITACAO S 
	INNER JOIN TB_FUNCIONARIO  F ON (S.MATRICULA = F.MATRICULA)
	INNER JOIN TB_SETOR ST ON (F.CD_SETOR = ST.CD_SETOR)
	INNER JOIN TB_DEPARTAMENTO D ON (ST.CD_DEPARTAMENTO = D.CD_DEPARTAMENTO)
GROUP BY 
	 D.NM_DEPARTAMENTO
