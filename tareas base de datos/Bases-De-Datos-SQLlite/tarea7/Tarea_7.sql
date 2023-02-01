-- Create Table

Create table despacho (
	capacidad INT,
	id int,
	primary key (id)
);

create table director (
	dni text,
	nombre text,
	apellido text,
	id_despacho int	references despacho(id),
	director_jefe text references director(dni),
	primary key (dni)
);

-- Insert 

INSERT INTO despacho VALUES(4,1);
INSERT INTO despacho VALUES(6,2);
INSERT INTO despacho VALUES(2,3);
INSERT INTO despacho VALUES(5,4);
INSERT INTO despacho VALUES(3,5);

INSERT INTO director VALUES("12345678P","Humano","Slasa",1,NULL);
INSERT INTO director VALUES("87654321P","Bob","Blob",2,NULL);
INSERT INTO director VALUES("00000000Z","NPC","argh",3,NULL);
INSERT INTO director VALUES("11111111L","Pedro","Alvarez",4,NULL);
INSERT INTO director VALUES("22222222K","Godofredo","Vasconcelos",5,NULL);

INSERT INTO director VALUES("33333333T","Haix","Elin",1,"00000000Z");
INSERT INTO director VALUES("44444444M","Alex","Yoda",1,"00000000Z");
INSERT INTO director VALUES("55555555O","Vegeta","777",1,"22222222K");
INSERT INTO director VALUES("66666666J","Willy","Rex",1,"11111111L");
INSERT INTO director VALUES("88888888R","Agustin","Gonzalez",1,"87654321P");

-- Consultas 


    --Mostrar el DNI, nombre y apellidos de todos los directores.
SELECT dni,nombre,apellido from director;

    --Mostrar los datos de los directores que no tienen jefes,
SELECT * from director
	where director_jefe is NULL;

    --Mostrar el nombre y apellidos de cada director, junto con la capacidad del despacho en el que se encuentra.
select director.nombre,director.apellido,despacho.capacidad from director,despacho
	where director.id_despacho=despacho.id;

    --Mostrar el número de directores que hay en cada despacho.
SELECT count(director.nombre) from director group by id_despacho;

    --Mostrar los datos de los directores cuyos jefes no tienen jefes.
SELECT * from director where director_jefe.director_jefe is null;

    --Mostrar los nombres y apellidos de los directores junto con los de su jefe.


    --Mostrar el número de despachos que están sobreutilizados.


    --Añadir un nuevo director llamado Paco Pérez, DNI 11111111T, sin jefe, y situado en el despacho 3,


    --Asignar a todos los empleados apellidados Pérez un nuevo jefe con DNI 00000000H.


    --Despedir a todos los directores, excepto a los que no tienen jefe.

