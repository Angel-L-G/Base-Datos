# Tarea 2
## Create
Create table Usuario(
	id int,
	usuario text,
	nombre text,
	sexo text,
	nivel int,
	email text,
	telefono text,
	marca text,
	compañia text,
	saldo int,
	activo INTEGER,
	PRIMARY KEY(id)
);
  
## Insert

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

## Consultas

Listar los nombres de los usuarios

        SELECT nombre from usuario   
      
Calcular el saldo máximo de los usuarios de sexo “Mujer”

      SELECT max(saldo) from usuario 
      where sexo="M";
      
Listar nombre y teléfono de los usuarios con teléfono TOMTON, BLACK o DREAMS
    
    SELECT nombre,telefono from usuario 
  where marca="TOMTOM" or marca="BLACK" or marca="DREAMS";
    
Contar los usuarios sin saldo o inactivos
    
    SELECT count(nombre) from Usuario
	WHERE saldo="0" or activo="0";
    
Listar el login de los usuarios con nivel 1, 2 o 3
    
    SELECT usuario from Usuario
	WHERE nivel="1" or nivel="2" or nivel="3";
    
Listar los números de teléfono con saldo menor o igual a 300
    
    SELECT telefono from Usuario
	WHERE saldo<="300";
    
Calcular la suma de los saldos de los usuarios de la compañia telefónica NEXTEL
    
    SELECT sum(saldo) from Usuario
	WHERE compañia="NEXTEL";
    
Contar el número de usuarios por compañía telefónica
   
   SELECT count(nombre) from Usuario
	GROUP by compañia;
   
Contar el número de usuarios por nivel
    
    SELECT count(nombre) from Usuario
	GROUP by nivel;
    
Listar el login de los usuarios con nivel 2
    
    SELECT usuario from Usuario
 where nivel=2;
    
Mostrar el email de los usuarios que usan gmail
    
    SELECT email from Usuario
 where email like "%@gmail.com";
    
Listar nombre y teléfono de los usuarios con teléfono LG4, KINKI o MOT
    
    SELECT nombre,telefono from Usuario
 where marca="LG4" or marca="KINKI" or marca="MOT";
    
Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca LG4 o KINKI
    
    SELECT nombre,telefono from Usuario
 where not (marca="LG4" or marca="KINKI");
    
Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL
    
    SELECT nombre,telefono from Usuario
 where compañia="IUSACELL";
    
Listar el login y teléfono de los usuarios con compañia telefónica que no sea TELCEL
    
    SELECT nombre,telefono from Usuario
 where not (compañia="TELCEL");
    
Calcular el saldo promedio de los usuarios que tienen teléfono marca TOMTON
    
    SELECT avg(saldo) from Usuario
 where marca="TOMTON";
    
Listar el login y teléfono de los usuarios con compañia telefónica IUSACELL o AXEL
    
    SELECT usuario,telefono from Usuario
 where compañia="IUSACELL" or compañia="AXEL";
    
Mostrar el email de los usuarios que no usan yahoo

SELECT email from Usuario
 where email not like "%@yahoo.com";
    
Listar el login y teléfono de los usuarios con compañia telefónica que no sea TELCEL o IUSACELL
    
    SELECT usuario,telefono from Usuario
 where compañia="IUSACELL" or compañia="TELCEL";
    
Listar el login y teléfono de los usuarios con compañia telefónica UNEFON
    
    SELECT usuario,telefono from Usuario
 where compañia="UNEFON";
    
Listar las diferentes marcas de celular en orden alfabético descendentemente
    
    SELECT marca from Usuario ORDER by marca DESC;
    
Listar las diferentes compañias en orden alfabético aleatorio

	SELECT marca from Usuario ORDER by random();

SELECT marca from Usuario ORDER by random();
    
Listar el login de los usuarios con nivel 0 o 2
    
Calcular el saldo promedio de los usuarios que tienen teléfono marca LG4
    
Listar el login de los usuarios con nivel 1 o 3
    
Listar nombre y teléfono de los usuarios con teléfono que no sea de la marca BLACK
    
Listar el login de los usuarios con nivel 3
    
Listar el login de los usuarios con nivel 0
    
Listar el login de los usuarios con nivel 1
    
Contar el número de usuarios por sexo
    
Listar el login y teléfono de los usuarios con compañia telefónica AT&T
    
Listar las diferentes compañias en orden alfabético descendentemente
    
Listar el logn de los usuarios inactivos
    
Listar los números de teléfono sin saldo
    
Calcular el saldo mínimo de los usuarios de sexo “Hombre”
    
Listar los números de teléfono con saldo mayor a 300.
