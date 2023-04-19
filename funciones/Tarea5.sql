--Crea una base datos llamada salario.
    CREATE DATABASE salario
--Crea una tabla llamada persona con los siguientes campos:
    CREATE TABLE persona(
        id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
        salarioBase double,
        nombre varchar(20)
    );
--Insert
INSERT INTO persona VALUES(2000.0,"Angel");
INSERT INTO persona VALUES(2010.0,"Luis");
INSERT INTO persona VALUES(2050.9,"Julio");
INSERT INTO persona VALUES(2300.3,"Joel");
INSERT INTO persona VALUES(2060.0,"Pedro");

INSERT INTO persona VALUES(2013.0,"Moises");
INSERT INTO persona VALUES(1020.0,"Patricia");
INSERT INTO persona VALUES(2090.5,"Juan");
INSERT INTO persona VALUES(1900.4,"Manuel");
INSERT INTO persona VALUES(3090.1,"Ruben");
--Cree una función para cada punto teniendo en cuenta que:
    --Función subsidio_transporte: El subsidio de transporte equivale al 7% al salario básico.
        DELIMITER //
        CREATE FUCNTION subsidio_transporte(base double) RETURNS double
        Deterministic
        BEGIN
            declare res double;
            declare mod double;
            set mod = 7;
            set res = (base*100)/mod;
            RETURN res;
        END //
    --Función salud: La salud que corresponde al 4% al salario básico.
        DELIMITER //
        CREATE FUCNTION salud(base double) RETURNS double
        Deterministic
        BEGIN
            declare res double;
            declare mod double;
            set mod = 4;
            set res = (base*100)/mod;
            RETURN res;
        END //
    --Función pension: La pensión que corresponde al 4% al salario básico
        DELIMITER //
        CREATE FUCNTION pension(base double) RETURNS double
        Deterministic
        BEGIN
            declare res double;
            declare mod double;
            set mod = 4;
            set res = (base*100)/mod;
            RETURN res;
        END //
    --Función bono: Un bono que corresponde al 8% al salario básico.
        DELIMITER //
        CREATE FUCNTION bono(base double) RETURNS double
        Deterministic
        BEGIN
            declare res double;
            declare mod double;
            set mod = 8;
            set res = (base*100)/mod;
            RETURN res;
        END //
    --Función integral: El salario integral es la suma del salario básico - salud - pension + bono + sub de transporte.
        DELIMITER //
        CREATE FUCNTION integral(base double) RETURNS double
        Deterministic
        BEGIN
            declare res double;
            DECLARE salud double;
            DECLARE pension double;
            DECLARE bono double;
            DECLARE subT double;

            set salud = call salud(base);
            set pension = call pension(base);
            set bono = call bono(base);
            set subT = call subT(base);

            set res = base - salud - pension + bono + subT;

            RETURN res;
        END //