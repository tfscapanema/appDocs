drop SCHEMA guddi CASCADE;

CREATE SCHEMA guddi;

INSERT INTO guddi.papel (id,descricao) VALUES (1,'ADMINSTRADOR');
INSERT INTO guddi.papel (id,descricao) VALUES (2,'GUEST');
INSERT INTO guddi.papel (id,descricao) VALUES (3,'MANAGER');
INSERT INTO guddi.orgao (id,nome) VALUES (1, 'SERPRO');
INSERT INTO guddi.orgao (id,nome) VALUES (2, 'PRODEPA');
INSERT INTO guddi.orgao (id,nome) VALUES (3, 'TRT');
INSERT INTO guddi.orgao (id,nome) VALUES (4, 'TJE');
INSERT INTO guddi.usuario (id,nome,usuario,senha,id_orgao) VALUES (1,'System Admininstrator','admin',md5('123456'),1);
INSERT INTO guddi.usuario (id,nome,usuario,senha,id_orgao) VALUES (2,'Guest User','guest',md5('123456'),1);
INSERT INTO guddi.usuario (id,nome,usuario,senha,id_orgao) VALUES (3,'System Manager','manager',md5('123456'),1);
INSERT INTO guddi.usuario (id,nome,usuario,senha,id_orgao) VALUES (4,'thiago Soares','thiago.soares',md5('80278760287'),1);
INSERT INTO guddi.usuario_papel (id_usuario, id_papel) VALUES (1,1);
INSERT INTO guddi.usuario_papel (id_usuario, id_papel) VALUES (2,2);
INSERT INTO guddi.usuario_papel (id_usuario, id_papel) VALUES (3,3);

--Inserts para o Sistema Governo Digital
INSERT INTO guddi.sistema   (id,nome,id_orgao) VALUES (1,'Governo Digital',2);
INSERT INTO guddi.descritor (id,descricao,id_sistema) VALUES (1,'Dominio NucleoPA',1);

INSERT INTO guddi.tag (tag,id_descritor) VALUES ('municipio',1);
INSERT INTO guddi.tag (tag,id_descritor) VALUES ('orgao',1);
INSERT INTO guddi.tag (tag,id_descritor) VALUES ('estado',1);

INSERT INTO guddi.servico  (id,nome,id_descritor) VALUES (1,'buscarOrgaos',1);
INSERT INTO guddi.atributo (nome,tipo,id_servico) VALUES ('nome','String',1);

INSERT INTO guddi.servico  (id,nome,id_descritor) VALUES (2,'buscarEstados',1);
INSERT INTO guddi.atributo (nome,tipo,id_servico) VALUES ('nome','String',2);

INSERT INTO guddi.servico  (id,nome,id_descritor) VALUES (3,'buscarMunicipios',1);
INSERT INTO guddi.atributo (nome,tipo,id_servico) VALUES ('nome','String',3);

INSERT INTO guddi.servico  (id,nome,id_descritor) VALUES (4,'buscarPF',1);
INSERT INTO guddi.atributo (nome,tipo,id_servico) VALUES ('nome','String',4);

INSERT INTO guddi.servico  (id,nome,id_descritor) VALUES (5,'buscarPF',1);
INSERT INTO guddi.atributo (nome,tipo,id_servico) VALUES ('nome','String',5);

INSERT INTO guddi.servico  (id,nome,id_descritor) VALUES (6,'buscarPais',1);
INSERT INTO guddi.atributo (nome,tipo,id_servico) VALUES ('nome','String',6);









