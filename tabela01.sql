alter table Usuario add column idEndereco int;
alter table Usuario add foreign key(idEndereco) references Endereco (idEndereco);
alter table Usuario add column idLogin int;
alter table Usuario add foreign key(idLogin) references Login(idLogin);
alter table Sensor add column idSetor int;
alter table Sensor add foreign key(idSetor) references Setor(idSetor);
alter table Setor add column idEstufa int;
alter table Setor add foreign key (idEstufa) references Estufa (idEstufa);
alter table Estufa add column idCliente int;
alter table Estufa add foreign key (idCliente) references Cliente (idCliente);
alter table Cliente add column idContato int;
alter table Cliente add foreign key (idContato) references Contato (idContato);
alter table Usuario add column idCliente int;
alter table Usuario add foreign key (idCliente) references Cliente (idCliente);
---------------------------------------------------------------------------------------------------
select * from Usuario;
desc Usuario;

insert into Endereco(endereco,numero,bairro,cidade,municipio,uf,cep,complemento)
values
('rua dois','21','Interlagos','São Paulo','São paulo','SP','06557788','Ap.278 B');
-----------------------------------------------------------------------------------------
insert into Contato(telefoneFixo,celularUm,CelularDois)
values
('1139354268','11987653456','11987654567');
--------------------------------------------------------------------------------
insert into Contato(telefoneFixo,celularUm,CelularDois)
values
('1139354548','11987659856','11987984567');
----------------------------------------------------------------------------------
insert into Cliente (nome,cpf,cnpj,rg,email,idEndereco,idContato) 
values
('Thiago Dias de Souza','49345398325',null,'5667456347','thiagoalves@gmail.com',1,1); 
---------------------------------------------------------------------------------------
insert into Cliente (nome,cpf,cnpj,rg,email,idEndereco,idContato)  
values
('Jubeleu Alves Oliveria', null,'12345678901234',null,'jubeleualves@gmail.com',2,2);
-----------------------------------------------------------------------------------------
select 
	c.*,
	e.endereco,
    e.numero,
    e.bairro,
    e.cidade,
    e.municipio,
    e.uf,e.cep,
    e.complemento
from Cliente as c, Endereco as e where c.idEndereco = e.idEndereco;

select * from cliente;
delete from Cliente where idCliente in (7,9);