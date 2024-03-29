/*Create Table*/
 	
 drop table if EXISTS usuario;
 create table usuario (
 		id integer,
 		login text,
 		nombre text,
 		sexo text,
 		nivel integer,
 		email text,
 		telefono text,
 		marca text,
 		compañia text,
 		saldo integer,
 		activo integer,
 		primary key(id)
 	);

/*Insert*/ 

INSERT INTO Usuario VALUES ('1','BRE2271','BRENDA','M','2','brenda@live.com','655-330-5736','KINKI','IUSACELL','100','1');
INSERT INTO Usuario  VALUES ('2','OSC4677','OSCAR','H','3','oscar@gmail.com','655-143-4181','LG4','TELCEL','0','1');
INSERT INTO Usuario  VALUES ('3','JOS7086','JOSE','H','3','francisco@gmail.com','655-143-3922','TOMTON','MOVISTAR','150','1');
INSERT INTO Usuario  VALUES ('4','LUI6115','LUIS','H','0','enrique@outlook.com','655-137-1279','KINKI','TELCEL','50','1');
INSERT INTO Usuario  VALUES ('5','LUI7072','LUIS','H','1','luis@hotmail.com','655-100-8260','TOMTON','IUSACELL','50','0');
INSERT INTO Usuario  VALUES ('6','DAN2832','DANIEL','H','0','daniel@outlook.com','655-145-2586','DREAMS','UNEFON','100','1');
INSERT INTO Usuario  VALUES ('7','JAQ5351','JAQUELINE','M','0','jaqueline@outlook.com','655-330-5514','BLACK','AXEL','0','1');
INSERT INTO Usuario  VALUES ('8','ROM6520','ROMAN','H','2','roman@gmail.com','655-330-3263','LG4','IUSACELL','50','1');
INSERT INTO Usuario  VALUES ('9','BLA9739','BLAS','H','0','blas@hotmail.com','655-330-3871','LG4','UNEFON','100','1');
INSERT INTO Usuario  VALUES ('10','JES4752','JESSICA','M','1','jessica@hotmail.com','655-143-6861','KINKI','TELCEL','500','1');
INSERT INTO Usuario  VALUES ('11','DIA6570','DIANA','M','1','diana@live.com','655-143-3952','DREAMS','UNEFON','100','0');
INSERT INTO Usuario  VALUES ('12','RIC8283','RICARDO','H','2','ricardo@hotmail.com','655-145-6049','MOT','IUSACELL','150','1');
INSERT INTO Usuario  VALUES ('13','VAL6882','VALENTINA','M','0','valentina@live.com','655-137-4253','BLACK','AT&T','50','0');
INSERT INTO Usuario  VALUES ('14','BRE8106','BRENDA','M','3','brenda2@gmail.com','655-100-1351','MOT','NEXTEL','150','1');
INSERT INTO Usuario  VALUES ('15','LUC4982','LUCIA','M','3','lucia@gmail.com','655-145-4992','BLACK','IUSACELL','0','1');
INSERT INTO Usuario  VALUES ('16','JUA2337','JUAN','H','0','juan@outlook.com','655-100-6517','KINKI','AXEL','0','0');
INSERT INTO Usuario  VALUES ('17','ELP2984','ELPIDIO','H','1','elpidio@outlook.com','655-145-9938','MOT','MOVISTAR','500','1');
INSERT INTO Usuario  VALUES ('18','JES9640','JESSICA','M','3','jessica2@live.com','655-330-5143','DREAMS','IUSACELL','200','1');
INSERT INTO Usuario  VALUES ('19','LET4015','LETICIA','M','2','leticia@yahoo.com','655-143-4019','BLACK','UNEFON','100','1');
INSERT INTO Usuario  VALUES ('20','LUI1076','LUIS','H','3','luis2@live.com','655-100-5085','DREAMS','UNEFON','150','1');
INSERT INTO Usuario  VALUES ('21','HUG5441','HUGO','H','2','hugo@live.com','655-137-3935','MOT','AT&T','500','1');

/*Consultas*/
--- 1. Contar el número de usuarios por marca de teléfono.
SELECT count(nombre) from usuario GROUP by marc;
--- 2. Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG4.
SELECT nombre,telefono from usuario
where not marca="LG4";
--- 3. Listar las diferentes compañias en orden alfabético ascendentemente.
SELECT DISTINCT compañia from usuario ORDER by compañia ASC;
--- 4. Calcular la suma de los saldos de los usuarios de la compañia telefónica NEXTEL.
SELECT sum(saldo) from usuario 
where compañia="NEXTEL";
--- 5. Mostrar el email de los usuarios que usan hotmail.
SELECT email from usuario 
where email like "%@hotmail.com";
--- 6. Listar los nombres de los usuarios sin saldo o inactivos.
SELECT nombre from Usuario
WHERE saldo="0" or activo="0";
--- 7. Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o TELCEL.
SELECT login,telefono from usuario
WHERE compañia in ("IUSACELL","TELCEL");
--- 8. Listar las diferentes marcas de celular en orden alfabético ascendentemente.
SELECT DISTINCT marca from usuario ORDER by marca ASC;
--- 9. Listar las diferentes marcas de celular en orden alfabético aleatorio.
SELECT DISTINCT marca from usuario ORDER by random();
--- 10. Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o NEXTEL.
SELECT login,telefono from usuario
WHERE compañia in ("IUSACELL","NEXTEL");
--- 11. Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca KINKI o MOT.
SELECT login,telefono from usuario
WHERE compañia not in ("KINKI","MOT");
--- 12. Calcular la suma de los saldos de los usuarios de la compañia telefónica TELCEL.
SELECT sum(saldo) from usuario 
where compañia="TELCEL";