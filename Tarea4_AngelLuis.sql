/*Create Table*/ 
-- Crear la base de datos: BD_EMPLEADO.
CREATE TABLE departamento (
	id INT,
	nombre TEXT,
	presupuesto INT,
	primary key(id)
);
CREATE TABLE empleado (
	dni text,
	nombre TEXT,
	apellido TEXT,
	id_departamento INT REFERENCES departamento(id),
	PRIMARY KEY (dni)
);
/* Insert */
-- Realiza la inserción de, al menos, 10 empleados.
INSERT INTO departamento VALUES ( "1","Sanidad" ,"187000" );
INSERT INTO departamento VALUES ( "2","Informatica" ,"87000" );
INSERT INTO departamento VALUES ( "3","Logistica" ,"123000" );
INSERT INTO departamento VALUES ( "4","Marketing" ,"199000" );
INSERT INTO departamento VALUES ( "5","Maquinaria" ,"145000" );
INSERT INTO departamento VALUES ( "6","Fisicas" ,"132000" );
INSERT INTO departamento VALUES ( "7","Ciencia" ,"78000" );
INSERT INTO departamento VALUES ( "8","servicios sociales" ,"87000" );
INSERT INTO departamento VALUES ( "9","educacion" ,"170000" );
INSERT INTO departamento VALUES ( "10","disciplina" ,"200000" );

INSERT INTO empleado VALUES ( "12345678Z","Luis" ,"López" ,"10" );
INSERT INTO empleado VALUES ( "87654321A","Juan" ,"García" ,"8" );
INSERT INTO empleado VALUES ( "22446688B","Ana" ,"Pérez" ,"5" );
INSERT INTO empleado VALUES ( "11335577C","Pedro" ,"López" ,"4" );
INSERT INTO empleado VALUES ( "00000000T","Agustin" ,"Hernandez" ,"2" );
INSERT INTO empleado VALUES ( "12233344U","Luisa" ,"López" ,"8" );
INSERT INTO empleado VALUES ( "45566677G","Eva" ,"Luis" ,"1" );
INSERT INTO empleado VALUES ( "78899900H","Francisco" ,"Pérez" ,"5" );
INSERT INTO empleado VALUES ( "13579135L","Pepe" ,"Gonzalez" ,"10" );
INSERT INTO empleado VALUES ( "24682468N","Yoel" ,"López" ,"10" );
/* Consultas */
--1 Obtener los apellidos de los empleados.
SELECT apellido from empleado
--2 Obtener los apellidos de los empleados sin repeticiones.
SELECT DISTINCT apellido from empleado
--3 Obtener todos los datos de los empleados que se apellidan López.
SELECT * from empleado
	WHERE apellido="López";
--4 Obtener todos los datos de los empleados que se apellidan López y los que se apellidan Pérez.
SELECT * from empleado
	WHERE apellido in ("López","Pérez");
--5 Obtener todos los datos de los empleados que trabajan para el departamento 10.
SELECT * from empleado
	WHERE id_departamento=10;
--6 Obtener todos los datos de los empleados que trabajan para el departamento 8 y para el departamento 5.
SELECT * from empleado
	WHERE id_departamento in (10,5);
--7 Obtener todos los datos de los empleados cuyo apellido comience por P.
SELECT * from empleado
	WHERE apellido like "P%";
--8 Obtener el presupuesto total de todos los departamentos.
SELECT sum(presupuesto) from departamento
--9 Obtener el número de empleados en cada departamento.
SELECT count(nombre),id_departamento from empleado GROUP by	id_departamento;
--10 Obtener un listado completo de empleados, incluyendo por cada empleado los datos del empleado y de su departamento.
SELECT * from empleado;
--11 Obtener un listado completo de empleados, incluyendo el nombre y apellido del empleado junto al nombre y presupuesto de su departamento.
SELECT * from empleado,departamento
	WHERE empleado.id_departamento=departamento.id;
--12 Obtener los nombres y apellido de los empleados que trabajen en departamentos cuyo presupuesto sea mayor de 60.000 €.
SELECT empleado.nombre,empleado.apellido from empleado,departamento
	WHERE empleado.id_departamento=departamento.id and presupuesto>60000;
--13 Obtener los datos de los departamentos cuyo presupuesto es superior al presupuesto medio de todos los departamentos.
SELECT departamento.id,departamento.nombre,departamento.presupuesto from empleado,departamento
	WHERE empleado.id_departamento=departamento.id and presupuesto>(SELECT avg(presupuesto) from departamento);
--14 Obtener los nombres (únicamente los nombres) de los departamentos que tiene más de dos empleados.

--15 Añadir un nuevo departamento: “Calidad”, con presupuesto de 40.000 € y código 11.

--16 Añadir un empleado vinculado al departamento recién creado: Esther Vázquez, DNI:00000000.

--17 Calcular un recorte presupuestario del 10 % a todos los departamentos.

--18 Despedir a todos los empleados que trabajan para el departamento de informática (código 2).

--19 Despedir a todos los empleados que trabajen para departamentos cuyo presupuesto sea superior a los 60.000 €.

--20 Despedir a todos los empleados.
