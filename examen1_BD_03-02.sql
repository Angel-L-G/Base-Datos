-- create table
CREATE TABLE alumno (
	expediente INT,
	nombre text,
	localidad text,
	fecha_nacimiento text,
	direccion text,
	curso int,
	nivel text,
	faltas int,
	primary key (expediente)
);
-- insert
insert into alumno values(123456,'Juan Miguel Soler Bakero','S/C de Tenerife','1995/10/10','Gran Vía, 2, 4A',1,'ESO',15);
insert into alumno values(654321,'Laura Gómez Fernández','Las Palmas de Gran Canaria','1994/10/05','Junterones, 10, 5B',2,'ESO',25);
insert into alumno values(765432,'Beatriz Martínez Hernández','S/C de Tenerife','1993/05/05','Plaza Mayor, 6, 3B',3,'ESO',5);
insert into alumno values(987654,'Diego Marín Llorente','Puerto de S/C de Tenerife','1990/03/06','Diego de la Cierva, 5, 7A',1,'BACHILLER',34);

insert into alumno values(445544,'Juan Francisco Cano Riquelme','S/C de Tenerife','1992/01/07','Plaza de Belluga, 3, 4A',4,'ESO',13);
insert into alumno values(223322,'Raquel Riquelme Rubio','Las Palmas de Gran Canaria','1990/23/11','San Juan, 14, 3B',1,'BACHILLER',7);

insert into alumno values(9988877,'Cristina Sánchez Bermejo','S/C de Tenerife','95/03/19','Torre de Romo, 7',1,'ESO',1);
insert into alumno values(334455,'Pedro Jesús Rodríguez Soler','Puerto de S/C de Tenerife','94/10/03','Camino de Badel, 4',2,'ESO',11);
insert into alumno values(334400,'Javier Ramínez Rodríguez','S/C de Tenerife','93/05/27','Gran Vía, 4, 3A',3,'ESO',0);
insert into alumno values(993322,'Gema Rubio Colero','Las Palmas de Gran Canaria','92/09/09','Plaza Fuensanta, 5, 7A',1,'BACHILLER',19);
insert into alumno values(554411,'Joaquín Herníndez Gonzilez','Las Palmas de Gran Canaria','91/12/12','Junterones, 4, 5A',2,'BACHILLER',14);

-- consultas 
--    Muestra todos los datos de todos los alumnos.
select * from alumno;
--    Muestra el nombre y fecha de nacimiento de todos los alumnos, ordenando alfabéticamente la localidad.
select nombre,fecha_nacimiento from alumno order by localidad;
--    Consulta los datos de los alumnos que son de Las Palmas de Gran Canaria.
select* from alumno 
	where localidad="Las Palmas de Gran Canaria";
--    Obtén los nombres, fecha de nacimiento y curso de los alumnos que son de S/C de Tenerife o Puerto de S/C de Tenerife.
select nombre,fecha_nacimiento,curso from alumno 
	where localidad in ("S/C de Tenerife","Puerto de S/C de Tenerife");
--    Repite la consulta anterior ordenando por curso de forma descendente.
select nombre,fecha_nacimiento,curso from alumno 
	where localidad in ("S/C de Tenerife","Puerto de S/C de Tenerife") order by curso DESC;
--    Obtén el expediente y el nombre de los alumnos que son de S/C de Tenerife y están en el primer curso de E.S.O.
select nombre,expediente from alumno 
	WHERE localidad="S/C de Tenerife" and curso="1" and nivel="ESO"
--    ¿ Hay algún alumno que sea de Las Palmas de Gran Canaria, esté en segundo de bachillerato y tenga más de 10 faltas? Demuéstralo obteniendo su expediente, nombre y dirección.
select nombre,expediente,direccion from alumno 
	WHERE localidad="Las Palmas de Gran Canaria" and curso="2" and nivel="BACHILLER" and faltas>"10";
--    Ordena de mayor a menor número de faltas, los alumnos de primero de la ESO de la región de S/C de Tenerife.
select * from alumno 
	WHERE localidad="S/C de Tenerife" and curso="1" and nivel="ESO" order by faltas;
--    Muestra el nombre y las faltas de los alumnos dividiendo las faltas entre dos.
select nombre,(faltas/2) from alumno; 
--    Obtén los datos de todos los alumnos ordenados por nivel, y dentro de cada nivel por curso.
select * from alumno order by nivel,curso;
--    Muestra el nombre y expediente de todos aquellos alumnos que tengan menos de 10 faltas en tercer o cuarto curso y además sean de S/C de Tenerife.
select nombre,expediente from alumno 
	where faltas<10 and curso in ("3","4") and localidad="S/C de Tenerife";
--    Muestra los datos de aquellos alumnos cuyo nombre empiece por la letra 'J' y ordénalos según su expediente de forma ascendente.
select * from alumno 
	where nombre like "J%" ORDER by expediente;
--    Muestra los datos de los alumnos que son de Las Palmas de Gran Canaria y cuyo nombre termina con una letra 'z'.
select * from alumno 
	where localidad="Las Palmas de Gran Canaria" and nombre like "%z";
--    Muestra los datos de aquellos alumnos que tienen entre 10 y 20 faltas. Ordena el resultado por curso ascendente, nivel ascendente número de faltas en orden descendente.
select * from alumno 
	where (faltas<=20 and faltas>=10) order by curso,nivel,faltas DESC;
--    Muestra los datos de los alumnos cuya fecha de nacimiento comprenda los años 1993 y 1994. Ordena el resultado por curso de forma descendente.
select * from alumno 
	where fecha_nacimiento like "%93%" or fecha_nacimiento like "%94%";
--    Obtén los datos de aquellos alumnos que sean de tercer o cuarto curso y sean de Las Palmas de Gran Canaria. Utiliza el operador IN.
select * from alumno 
	where curso in (3,4) and localidad="Las Palmas de Gran Canaria";
--    Muestra los datos de los alumnos que no sean de BACHILLER, ordenados por nombre descendentemente. Utiliza el operador IN.
select * from alumno 
	where nivel not in ("BACHILLER") order by nombre DESC;
--    Obtén los datos de los alumnos cuyo nombre empiece por la letra 'J', que tengan más de 10 faltas y no sean de Bachiller. Ordena el resultado por curso, y dentro de cada curso, por nombre.
select * from alumno 
	where nombre like "J%" and faltas>10 and nivel<>"BACHILLER" order by curso,nombre;
--    Muestra los datos de los alumnos que tienen entre 10 y 20 faltas, son de S/C de Tenerife y están matriculados en 1o de E.S.O.
select * from alumno 
	where faltas BETWEEN 10 and 20 and localidad="S/C de Tenerife" and nivel="ESO";
--    Muestra los datos de los alumnos cuya fecha de nacimiento comprenda los años 1993 y 1994. Ordena el resultado por nombre.
select * from alumno 
	where fecha_nacimiento like "%93%" or fecha_nacimiento like "%94%" order by nombre;