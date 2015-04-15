

/*2.  Criar  um  procedimento  armazenado,  SP_INCLUI_CLIENTE,  para  incluir  um  novo 
Cliente.  O  procedimento  deve  apresentar  como  parâmetros  de  entrada  a  Matrícula,  o 
Nome e o Telefone do Cliente a ser incluído.*/
CREATE PROCEDURE 
	SP_INCLUI_CLIENTE (@NOME varchar(50), @TELEFONE varchar(10) ) AS 

INSERT INTO 
	TB_CLIENTE(Nome, Telefone) 
VALUES
	(@NOME, @TELEFONE) 

EXEC SP_INCLUI_CLIENTE 'CRISLAINE', '798345787'	
EXEC SP_INCLUI_CLIENTE 'Iury', '7983464537'
EXEC SP_INCLUI_CLIENTE 'Alan', '7954424453'
EXEC SP_INCLUI_CLIENTE 'Brendel', '7999453624'

SELECT * FROM TB_CLIENTE


/*
3.  Criar um procedimento armazenado, SP_REMOVE_CLIENTE, para remover um Cliente 
cadastrado.  O  procedimento  deve  apresentar  como  parâmetro  de  entrada  a  Matrícula  do 
Cliente a ser removido.
*/
CREATE PROCEDURE 
	SP_REMOVE_CLIENTE (@MATRICULA INT) AS
DELETE FROM 
	TB_CLIENTE 
WHERE 
	Matricula=@MATRICULA

EXEC SP_REMOVE_CLIENTE 4 

SELECT * FROM TB_CLIENTE


/*
4.  Alterar  os  procedimentos  dos  itens  2  e  3  para  incluir  um  parâmetro  de  saída  a  fim  de 
informar o resultado da execução do procedimento.
*/

--!MENSAGEM DE INSERÇÃO
ALTER PROCEDURE SP_INCLUI_CLIENTE (@NOME varchar(50), @TELEFONE varchar(10), @MENSAGEM varchar(40) OUTPUT ) AS 

INSERT INTO 
	TB_CLIENTE(Nome, Telefone) 
VALUES
	(@NOME, @TELEFONE) 
SET @MENSAGEM = 'NOVO CLIENTE INSERIDO COM SUCESSO!!' 


DECLARE @MENSAGEM varchar(40)
EXEC SP_INCLUI_CLIENTE 'ANDRES', '1234567890', @MENSAGEM OUTPUT 
PRINT @MENSAGEM

SELECT * FROM TB_CLIENTE


--!MENSAGEM DE REMOÇÃO
ALTER PROCEDURE 
	SP_REMOVE_CLIENTE (@MATRICULA INT, @MENSAGEM VARCHAR(40) OUTPUT) AS
DELETE FROM 
	TB_CLIENTE 
WHERE 
	Matricula=@MATRICULA
SET @MENSAGEM = 'CLIENTE EXCLUIDO COM SUCESSO!!' 

DECLARE @MENSAGEM varchar(40)
EXEC 
	SP_REMOVE_CLIENTE 2, @MENSAGEM OUTPUT 
PRINT 
	@MENSAGEM 


/*
5.  Criar  um  procedimento  armazenado,  SP_ALTERA_CLIENTE,  para  alterar  as 
informações  (Nome  e  Telefone)  de  um  Cliente  cadastr ado.  O  procedimento  deve 
apresentar como parâmetros de entrada a Matrícula, o Nome e o Telefone do Cliente.
*/








/*
6.  Alterar  o  procedimento  SP_ALTERA_CLIENTE  para  adicionar  a  seguinte 
funcionalidade:  Se  o  valor  do  parâmetro  passado  for  nulo  (NULL)  o  atributo 
correspondente não deve ser modificado.
*/