-- Exercício de Revisão de Banco de Dados

CREATE TABLE TB_DVD (
  cd_dvd int not null identity(1,1),
  titulo varchar(100),
  categoria varchar(50)
)

ALTER TABLE TB_DVD ADD CONSTRAINT PK_TB_DVD
PRIMARY KEY (cd_dvd)

INSERT INTO TB_DVD (titulo, categoria)
VALUES('CINDERELA', 'INFANTIL')
INSERT INTO TB_DVD (titulo, categoria)
VALUES('DETONA RALPH', 'INFANTIL')
INSERT INTO TB_DVD (titulo, categoria)
VALUES('MEU MALVADO FAVORITO', 'INFANTIL')

INSERT INTO TB_DVD (titulo, categoria)
VALUES ('VELOZES E FURIOSOS 7', 'AÇÃO'),
       ('GOLPE DUPLO', 'COMÉDIA')

SELECT * FROM TB_DVD

CREATE TABLE TB_CLIENTE (
  cd_cliente int not null identity(1,1),
  nm_cliente varchar(100)
)

INSERT INTO TB_CLIENTE (nm_cliente)
VALUES ('JOÃO'),
       ('CARLOS'),
       ('ROBERTA'),
       ('RICARDO'),
       ('PEDRO')


ALTER TABLE TB_CLIENTE ADD CONSTRAINT PK_TB_CLIENTE
PRIMARY KEY (cd_cliente)

CREATE TABLE TB_LOCACAO (
   cd_cliente int not null,
   cd_dvd int not null,
   dt_locacao datetime not null,
   valor numeric (10,2),
   dt_devolucao datetime null
)

ALTER TABLE TB_LOCACAO ADD CONSTRAINT PK_TB_LOCACAO
PRIMARY KEY (cd_cliente, cd_dvd, dt_locacao)   

ALTER TABLE TB_LOCACAO ADD CONSTRAINT FK_CD_CLIENTE
FOREIGN KEY (cd_cliente) REFERENCES TB_CLIENTE(cd_cliente)

ALTER TABLE TB_LOCACAO ADD CONSTRAINT FK_CD_DVD
FOREIGN KEY (cd_dvd) REFERENCES TB_DVD (cd_dvd)
   
INSERT INTO TB_LOCACAO (cd_cliente, cd_dvd, dt_locacao, valor, dt_devolucao)
VALUES (1,1,'20090506',5.00,NULL),
       (1,4,'20090406',10.00,NULL), 
       (2,2,'20090506',5.00,NULL),
       (1,3,'20090406',5.00,NULL),
       (3,1,'20090606',5.00,NULL),
       (3,4,'20090406',5.00,NULL),
       (4,1,'20090406',5.00,NULL),
       (4,2,'20090406',5.00,NULL),
       (4,4,'20090606',5.00,NULL)
       
  

SELECT * FROM TB_LOCACAO


2.	Elabore uma consulta SQL quer retorne como resultado 
    os dvds que foram alugados mais de 2 vezes em 2009. 
    Apresentar o titulo do dvd e o total de locações. 
    
SELECT D.titulo, COUNT(L.cd_dvd) 'total de locações'
FROM TB_LOCACAO L
     INNER JOIN TB_DVD D ON(L.cd_dvd = D.cd_dvd)
WHERE YEAR(L.dt_locacao) = '2009' 
GROUP BY D.titulo   
HAVING COUNT(L.cd_dvd) > 2

SELECT D.titulo, COUNT(L.cd_dvd) 'total de locações'
FROM TB_LOCACAO L
     INNER JOIN TB_DVD D ON(L.cd_dvd = D.cd_dvd)
WHERE L.dt_locacao >= '20090101' and L.dt_locacao < '20100101' 
GROUP BY D.titulo   
HAVING COUNT(L.cd_dvd) > 2
    
3.	Elabore uma consulta SQL que retorne como resultado os títulos 
    dos DVDs que tiveram pelo menos um aluguel em Maio de 2009 e também  
    pelo menos um aluguel em Junho de 2009. Somente os filmes que 
    tiveram aluguéis pelo menos nos dois meses devem ser apresentados.
    
SELECT D.titulo
FROM TB_DVD D
WHERE D.cd_dvd in (SELECT L.cd_dvd FROM TB_LOCACAO L
                   WHERE  L.dt_locacao >= '20090501' and L.dt_locacao < '20090601')
                AND
      D.cd_dvd in (SELECT L.cd_dvd FROM TB_LOCACAO L
                 WHERE  L.dt_locacao >= '20090601' and L.dt_locacao < '20090701')
                 
                 
SELECT D.titulo
FROM TB_DVD D
WHERE EXISTS (SELECT 1 FROM TB_LOCACAO L
              WHERE L.cd_dvd = D.cd_dvd AND
              L.dt_locacao >= '20090501' and L.dt_locacao < '20090601')  
              AND 
      EXISTS (SELECT 1 FROM TB_LOCACAO L
              WHERE L.cd_dvd = D.cd_dvd AND
              L.dt_locacao >= '20090601' and L.dt_locacao < '20090701')
                       
    
4.	Elabore uma consulta SQL que retorne os Clientes (nomes) 
    que nunca alugaram filmes. 
    
SELECT C.nm_cliente
FROM TB_CLIENTE C     
WHERE C.cd_cliente not in (SELECT cd_cliente FROM TB_LOCACAO)
    
5.	Elabore uma consulta SQL que retorne os DVDs (titulo)
    que tiveram o maior número de locações. 

SELECT D.titulo, COUNT (L.cd_dvd) TOTAL
FROM TB_LOCACAO L INNER JOIN
     TB_DVD D ON (L.cd_dvd = D.cd_dvd)
GROUP BY D.titulo 
HAVING COUNT(L.cd_dvd) = (SELECT MAX (T.TOTAL) FROM 
						    (SELECT COUNT (L.cd_dvd) TOTAL
						     FROM TB_LOCACAO L INNER JOIN
						     TB_DVD D ON (L.cd_dvd = D.cd_dvd)
						     GROUP BY L.cd_dvd) T 
						  )

