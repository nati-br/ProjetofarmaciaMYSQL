#inserindo os dados de testes - DML
-- tipos produtos
insert into  tipos_produtos(tipo) values('Remedios');
insert into  tipos_produtos(tipo) values('Cosmeticos');
insert into  tipos_produtos(tipo) values('Diversos');

-- fabricantes
insert into fabricantes (fabricante) values ('Roche');
insert into fabricantes (fabricante) values ('Vitales');
insert into fabricantes (fabricante) values ('Palmolive');

-- medicos
insert into medicos (nome,crm) values ('Alfredo muniz', '123123SP');
insert into medicos (nome,crm) values ('Fernanda Silva', '342342MG');
insert into medicos (nome,crm) values ('Juelieta Santana', '565465SC');

-- clientes
insert into clientes (nome, endereco, telefone,cep,localidade,cpf) values('Felicity Jones','Rua da paz, 34','(11) 2345-8899','34.567-098', 'Santos', '234.789.433-98');
insert into clientes (nome, endereco, telefone,cep,localidade,cpf) values('Angelina Jolie','Rua do Ipiranga, 456','(21) 7544-8899','56.654-567', 'Rio de Janeiro', '345.678.234-12');
insert into clientes (nome, endereco, telefone,cep,localidade,cpf) values('Ricardo Chavez','Rua Certa, 678','(21) 2678-3984','12-4569-223', 'Planaltina', '345.789.433-98');

-- produtos

insert into produtos (produto,designacao,composicao,preco_venda,id_tipo_produto, id_fabricante) values ('Dipirona','dores em geral','Metilpropileno','12.44',1,1);
insert into produtos (produto,designacao,composicao,preco_venda,id_tipo_produto, id_fabricante) values ('Sabonete','limpeza','glicerinado','3.56',2,2);
insert into produtos (produto,designacao,composicao,preco_venda,id_tipo_produto, id_fabricante) values ('portetor solar','proteção solar','soro de abacate','98.12',2,1);

-- compras
insert into compras (id_cliente,data) values (1,'2019-03-10');
insert into compras (id_cliente,data) values (2,'2019-04-15');
insert into compras (id_cliente,data) values (1,'2019-05-18');

-- produtos compra
insert into produtos_compras(id_compra, id_produto, quantidade) values (1,1,2);
insert into produtos_compras(id_compra, id_produto, quantidade) values (1,2,3);
insert into produtos_compras(id_compra, id_produto, quantidade) values (2,3,1);

-- Receitas Medicas
insert into receitas_medica (id_produto_compra,id_medico,receita) values (1,1,'Receitareceita.pdf');
insert into receitas_medica (id_produto_compra,id_medico,receita) values (3,2,'Receitareceita.pdf');
insert into receitas_medica (id_produto_compra,id_medico,receita) values (1,1,'Receitareceita.pdf');

-- consultas simples
-- tipos produtos

select * from tipos_produtos;
select id, tipo from tipos_produtos;
select tipo, id from tipos_produtos;
select id, tipo from tipos_produtos order by id desc;

-- fabricantes 
select * from fabricantes;

-- medicos
select * from medicos;

-- clientes
select * from clientes;

-- compras 
select * from compras;

-- produtos compra 
select * from produtos_compras;
select * from produtos_compras where quantidade > 2;

-- receitas medica
select * from receitas_medica;
 
-- consulta complexas
-- passo 1 trazer as compras
select * from compras;

-- passo 2 colocar o nome dos cliente na compras 
SELECT com.id AS 'ID Compra', cli.nome AS 'Cliente', com.data AS 'Data Compra' 
	FROM compras AS com, clientes AS cli WHERE com.id_cliente = cli.id;
    
-- Passo 3 - Produtos Compra
SELECT * FROM produtos_compra;

-- Passo 4 
SELECT  com.id AS 'Compra', 
    cli.nome AS 'Cliente',
    SUM(prod.preco_venda * proc.quantidade) AS 'Total',
    com.data AS 'Data da Compra'
    FROM produtos_compras AS proc, produtos AS prod, compras AS com, clientes AS cli
    WHERE com.id = proc.id_compra AND prod.id = proc.id_produto AND cli.id = com.id_cliente
    GROUP BY com.id;

-- atualizando os dados 
update tipos_produtos set tipo = 'bijuterias' where id = 4;

update produtos set preco_venda = '4.16', id_tipo_produto =1 , id_fabricante = 1 where id= 2;

-- Excluindo dados

SELECT * FROM produtos_compra;

SELECT * FROM receitas_medica;

DELETE FROM receitas_medica WHERE id_produto_compra = 3;

DELETE FROM produtos_compra WHERE id = 3;