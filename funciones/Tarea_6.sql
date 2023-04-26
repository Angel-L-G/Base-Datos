### Solucion
  
#### Crear base de datos y seleccionarla

```sql
CREATE DATABASE salario;

USE salario;
```

#### Crear tabla persona

```sql
CREATE TABLE persona (
	identificador varchar(10) PRIMARY KEY,
	nombre TEXT,
	salario_base DOUBLE,
	subsidio DOUBLE,
	salud DOUBLE,
	pension DOUBLE,
	bono DOUBLE,
	integral DOUBLE
);
```

#### Creacion del procedimiento crear_persona y llamada

```sql
DELIMITER $$
DROP PROCEDURE IF EXISTS crear_persona$$
CREATE PROCEDURE crear_persona(in cantidad int unsigned)
BEGIN
	declare variable varchar(10);
	declare contador int default 1;
    declare salario int;
    declare copia int;
    declare nombre text;
    
	set contador = (select count(*) from persona) + 1;
	set copia = contador - 1;
    
    set variable = concat('0000', 1);
    while contador <= cantidad + copia
    do
		set salario = contador * contador;
		set variable = concat('0000', contador);
        set nombre = concat('pepe', contador);
		insert into persona values (variable, nombre, salario, 7, 4, 4, 8, 1);
		set contador = contador + 1;
    end while;
END
$$

DELIMITER ;
CALL crear_persona(10);
;
```

#### Creación de la función obtener_salario y llamada

```sql
DELIMITER $$
DROP FUNCTION IF EXISTS obtener_salario$$
CREATE FUNCTION obtener_salario(identificador varchar(10)) RETURNS DOUBLE
DETERMINISTIC
BEGIN
	DECLARE salario DOUBLE;
	
	set salario = (SELECT persona.salario_base
    FROM persona
    WHERE persona.identificador=identificador);
    
    return salario;
END
$$

DELIMITER ;
SELECT obtener_salario('00001');
;
```

#### Creación de la función calcular_porcentaje y llamada

```sql
DELIMITER $$
DROP FUNCTION IF EXISTS calcular_porcentaje$$
CREATE FUNCTION calcular_porcentaje(identificador varchar(10), porcentaje double) RETURNS DOUBLE
DETERMINISTIC
BEGIN
	DECLARE resultado DOUBLE;
    
    set resultado = obtener_salario(identificador) * porcentaje;
    
    return resultado;
END
$$

DELIMITER ;
SELECT calcular_porcentaje('00001');
;
```

#### Creación de la función subsidio y llamada

```sql
DELIMITER $$
DROP FUNCTION IF EXISTS subsidio$$
DETERMINISTIC
CREATE FUNCTION subsidio(identificador varchar(10)) RETURNS DOUBLE
BEGIN
	DECLARE resultado DOUBLE;
	
	set resultado = calcular_porcentaje(identificador, 0.07);
    
    UPDATE persona set persona.subsidio=resultado
    WHERE persona.identificador=identificador;
    
    return resultado;
END
$$

DELIMITER ;
SELECT subsidio('00001');
;

```

#### Creación de la función salud y llamada

```sql
DELIMITER $$
DROP FUNCTION IF EXISTS salud$$
CREATE FUNCTION salud(identificador varchar(10)) RETURNS DOUBLE
DETERMINISTIC
BEGIN
	DECLARE resultado DOUBLE;
	
	set resultado = calcular_porcentaje(identificador, 0.04);
    
    UPDATE persona set persona.salud=resultado
    WHERE persona.identificador=identificador;
    
    return resultado;
END
$$

DELIMITER ;
SELECT salud('00001');
;
```

#### Creación de la función pension y llamada

```sql
DELIMITER $$
DROP FUNCTION IF EXISTS pension$$
CREATE FUNCTION pension(identificador varchar(10)) RETURNS DOUBLE
DETERMINISTIC
BEGIN
	DECLARE resultado DOUBLE;
	
	set resultado = calcular_porcentaje(identificador, 0.04);
    
    UPDATE persona set persona.pension=resultado
    WHERE persona.identificador=identificador;
    
    return resultado;
END
$$

DELIMITER ;
SELECT pension('00001');
;
```

#### Creación de la función bono y llamada

```sql
DELIMITER $$
DROP FUNCTION IF EXISTS bono$$
CREATE FUNCTION bono(identificador varchar(10)) RETURNS DOUBLE
DETERMINISTIC
BEGIN
	DECLARE resultado DOUBLE;
	
	set resultado = calcular_porcentaje(identificador, 0.08);
    
    UPDATE persona set persona.bono=resultado
    WHERE persona.identificador=identificador;
    
    return resultado;
END
$$

DELIMITER ;
SELECT bono('00001');
;
```

#### Creación de la función integral y llamada

```sql
DELIMITER $$
DROP FUNCTION IF EXISTS integral$$
CREATE FUNCTION integral(id varchar(10)) RETURNS DOUBLE
DETERMINISTIC
BEGIN
	DECLARE resultado DOUBLE;
	
	set resultado = obtener_salario(id) - salud(id) - pension(id) + bono(id) + subsidio(id);
    
    UPDATE persona set persona.integral=resultado
    WHERE persona.identificador=identificador;
    
    return resultado;
END
$$

DELIMITER ;
SELECT integral('12345678A');
;
```
