/*
DELIMITER // -- comienzo del delimitador
DROP PROCEDURE IF EXISTS nombre_procedimiento
CREATE PROCEDURE nombre_procedimiento
BEGIN
  //codigo
END //  -- fin del delimitador
*/

/*Sacar una relación completa de los científicos asignados a cada proyecto. Mostrar DNI, Nombre del científico, 
identificador del proyecto y nombre del proyecto.*/

DELIMITER //
DROP PROCEDURE IF EXISTS cientificosPorProyecto
CREATE PROCEDURE cientificosYProyecto(
  OUT dni VARCHAR(20)
)
BEGIN
  SELECT c.id, c.nombre, p.id, p.nombre from cientificio as c, proyecto as p, cientifico_proyecto as i where c.id=i.ref_cientifico and i.ref_proyecto=p.id
  INTO res;
END //

/*Obtener el número de proyectos al que está asignado cada científico (mostrar el DNI y el nombre).*/

DELIMITER //
DROP PROCEDURE IF EXISTS cientificosPorProyecto
CREATE PROCEDURE proyectoPorCientificos(
  OUT dni VARCHAR(20)
  OUT nombre VARCHAR(100)
  OUT totalPro INT
)
BEGIN
  SELECT c.id, c.nombre,count(p.id) from cientificio as c, proyecto as p, cientifico_proyecto as i where c.id=i.ref_cientifico and i.ref_proyecto=p.id
  INTO dni, nombre, totalPro;
END //
/*Obtener el numero de científicos asignados a cada proyecto (mostrar el identificador del proyecto y el nombre del proyecto).*/

DELIMITER //
DROP PROCEDURE IF EXISTS cientificosPorProyecto
CREATE PROCEDURE cientificosPorProyecto(
  OUT idPro VARCHAR(20)
  OUT nombre VARCHAR(100)
  OUT totalCie INT
)
BEGIN
  SELECT p.id, p.nombre,count(c.id) from cientificio as c, proyecto as p, cientifico_proyecto as i where c.id=i.ref_cientifico and i.ref_proyecto=p.id
  INTO idPro, nombre, totalCie;
END //
/*Obtener el número de horas de dedicación de cada científico.*/

DELIMITER //
DROP PROCEDURE IF EXISTS cientificosPorProyecto
CREATE PROCEDURE cientificosPorProyecto(
  OUT nombre VARCHAR(20)
  OUT HorasTot INT  
)
BEGIN
  SELECT c.nombre,sum(p.horas) from cientificio as c, proyecto as p, cientifico_proyecto as i where c.id=i.ref_cientifico and i.ref_proyecto=p.id
  INTO nombre, HorasTot;
END //
/*Obtener el DNI y nombre de los científicos que se dedican a más de un proyecto y cuya dedicación media a cada 
proyecto sea superior a un número de horas superior a 10, por ejemplo 11 horas.*/

DELIMITER //
DROP PROCEDURE IF EXISTS cientificosPorProyecto
CREATE PROCEDURE cientificosPorProyecto(
  OUT dni VARCHAR(10) 
  OUT nombre VARCHAR(20)
)
BEGIN
  SELECT c.id, c.nombre from cientificio as c, proyecto as p, cientifico_proyecto as i where c.id=i.ref_cientifico and i.ref_proyecto=p.id and count(p.id)>1 and 
  INTO dni, nombre;
END //