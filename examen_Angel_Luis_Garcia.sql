CREATE DATABASE donacion;

USE donacion;

CREATE TABLE persona (
	identificador varchar(10) PRIMARY KEY,
    peso INT,
    admitido char(2),
    sexo char(1),
    fecha_ultima_donacion DATETIME
);

DELIMITER $$
DROP PROCEDURE IF EXISTS crear_persona$$
CREATE PROCEDURE crear_persona(in cantidad int unsigned)
BEGIN
	declare variable varchar(10);
	declare contador int default 1;
    declare peso int;
    declare copia int;
    declare sexo text;
    declare fecha datetime;
    declare admitido char(2);
    
    declare aleatorio int;
    declare mes text;
    declare año int;
    declare dia int;
    declare hora int;
    
	set contador = (select count(*) from persona) + 1;
	set copia = contador - 1;
    
    while contador <= cantidad + copia
    do
		set aleatorio = (SELECT ROUND((RAND() * (100 - 1)) + 1));
		
		set dia = (SELECT ROUND((RAND() * (30 - 1)) + 1));
		
		set año = (SELECT ROUND((RAND() * (2023 - 2000)) + 2000));
		
		set mes = (SELECT ROUND((RAND() * (12 - 1)) + 1));
		
		set hora = (SELECT ROUND((RAND() * (23 - 1)) + 1));
		
		set fecha = concat(año, '-', mes, '-', dia, ' ', hora, ':', '00', ':', '00');
        
		set peso = (SELECT ROUND((RAND() * (120 - 40)) + 40));
		set variable = concat('0', contador);
        if (aleatorio < 26)
        then
			set sexo = 'H';
            set admitido = 'SI';
		elseif (aleatorio < 51)
        then
			set sexo = 'M';
            set admitido = 'NO';
		elseif (aleatorio < 76)
		then
            set sexo = 'H';
            set admitido = 'NO';
		else
			set sexo = 'M';
            set admitido = 'SI';
		end if;
		insert into persona values (variable, peso, admitido, sexo, fecha);
		set contador = contador + 1;
    end while;
END
$$

DELIMITER ;
CALL crear_persona(10);

DELIMITER $$
DROP PROCEDURE IF EXISTS actualizar_fecha$$
CREATE PROCEDURE actualizar_fecha(in id varchar(10), in fecha datetime)
BEGIN
	UPDATE persona set persona.fecha_ultima_donacion = fecha
    WHERE persona.identificador = id;
END
$$

DELIMITER ;
CALL actualizar_fecha('01', '2012-02-02 12:00:00');

DELIMITER $$
DROP PROCEDURE IF EXISTS actualizar_fecha_y_admitido$$
CREATE PROCEDURE actualizar_fecha_y_admitido(in id varchar(10), in fecha datetime)
BEGIN
	declare diferencia INT;
    declare admitido char(2);
    
    declare fecha_persona datetime;
    
    set fecha_persona = (SELECT persona.fecha_ultima_donacion
							FROM persona
							where persona.identificador = id);
    
	CALL actualizar_fecha(id, fecha);
    set admitido = 'NO';
    
	
	if (persona.peso < 51 and persona.sexo = 'M' and diferencia > 120)
	then
		set admitido = 'SI';
		UPDATE persona SET persona.admitido = admitido WHERE persona.identificador = id;
	elseif (persona.peso < 51 and persona.sexo = 'H' and diferencia > 90)
	then
		set admitido = 'SI';
		UPDATE persona SET persona.admitido = admitido WHERE persona.identificador = id;
	else
		set admitido = 'NO';
		UPDATE persona SET persona.admitido = admitido WHERE persona.identificador = id;
	end if;
END
$$

DELIMITER ;
CALL actualizar_fecha_y_admitido('01', '2012-02-02 12:00:00');

DELIMITER $$
DROP FUNCTION IF EXISTS funcion_admitido_peso$$
CREATE FUNCTION funcion_admitido_peso(id varchar(10)) RETURNS int
DETERMINISTIC
BEGIN
	declare resultado int;
	
    set resultado = (SELECT persona.peso
					FROM persona
                    WHERE persona.identificador = id);
    
    return resultado;
END
$$

DELIMITER $$
DROP PROCEDURE IF EXISTS funcion_admitido_fecha$$
CREATE PROCEDURE funcion_admitido_fecha(in id varchar(10), in fecha datetime)
DETERMINISTIC
BEGIN
	
	update persona set persona.fecha_ultima_donacion = fecha
    where persona.identificador = id;
    
END
$$

DELIMITER $$
DROP FUNCTION IF EXISTS funcion_admitido_id$$
CREATE FUNCTION funcion_admitido_id(id varchar(10), fecha datetime) RETURNS text
DETERMINISTIC
BEGIN
	declare resultado text;
	
    if (funcion_admitido_peso(id) < 50)
    then
		update persona set persona.admitido = 'NO'
        where persona.identificador = id;
        set resultado = 'NO ESTÁ ADMITIDO';
	else
		CALL funcion_admitido_fecha(id, fecha);
		update persona set persona.admitido = 'SI'
        where persona.identificador = id;
        set resultado = 'SI ESTÁ ADMITIDO';
    end if;
    
    return resultado;
END
$$

DELIMITER ;
select funcion_admitido_id('02', '2020-10-12 14:00:00');