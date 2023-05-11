/*Un instituto de enseñanza guarda los siguientes datos de sus alumnos:

    número de inscripción, comienza desde 1 cada año,
    año de inscripción,
    nombre del alumno,
    documento del alumno,
    domicilio,
    ciudad,
    provincia,
    clave primaria: número de inscripto y año de inscripción.
    */

    create database insti;

    use insti;


--Se pide:

    --Elimine la tabla "alumno" si existe.
    drop table alumno if EXISTS;

    --Cree la tabla definiendo una clave primaria compuesta (año de inscripción y número de inscripción).
    create table alumno(
        num_id integer,
        anio_inscripcion datetime,
        nombre varchar(20),
        documento varchar(100),
        domicilio varchar(120),
        ciudad varchar(30),
        provincia varchar(30),
        PRIMARY KEY (num_id,anio_inscripcion)
    );

    --Define los siguientes indices:
        --Un índice único por el campo "documento" y un índice común por ciudad y provincia.
            --Nota:Muestra el comando y la salida. Justifica el tipo de indice en un comentario.
                CREATE UNIQUE INDEX idx_documento on alumno(documento);

                CREATE fulltext INDEX idx_ciudad_provincia on alumno(ciudad,provincia);
        --Vea los índices de la tabla.
            --Nota:Muestra el comando y la salida "show index".
                show index from alumno;
                    /*+--------+------------+----------------------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
                    | Table  | Non_unique | Key_name             | Seq_in_index | Column_name      | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
                    +--------+------------+----------------------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
                    | alumno |          0 | PRIMARY              |            1 | num_id           | A         |           1 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
                    | alumno |          0 | PRIMARY              |            2 | anio_inscripcion | A         |           1 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
                    | alumno |          0 | idx_documento        |            1 | documento        | A         |           1 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
                    | alumno |          1 | idx_ciudad_provincia |            1 | ciudad           | A         |           1 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
                    | alumno |          1 | idx_ciudad_provincia |            2 | provincia        | A         |           1 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
                    +--------+------------+----------------------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
                    */
    --Genera un procedimiento que realice la inserción de 5 registros, al menos 2 veces, de forma aleatoria.
        DELIMITER $$
        DROP PROCEDURE IF EXISTS insert_alumno$$
        CREATE PROCEDURE insert_alumno(in cantidad int)
        BEGIN
            declare id integer;
            declare fecha datetime;
            declare nom varchar(20);
            declare doc varchar(100);
            declare dom varchar(120);
            declare ciu varchar(30);
            declare prov varchar(30);
            
            declare copia integer;

            set id = (select count(*) from alumno)+1;
            set copia = id - 1;
            
            while id <= cantidad + copia
            DO
                set fecha = FROM_UNIXTIME(
                            UNIX_TIMESTAMP('2021-04-30 14:53:27') + FLOOR(0 + (RAND() * 63072000))
                        );
                set nom = CONCAT("nom",id);
                set doc = CONCAT("doc",id);
                set dom = CONCAT("dom",id);
                set ciu = CONCAT("ciu",id);
                set prov = CONCAT("prov",id);

                insert into alumno values (id, fecha, nom, doc, dom, ciu, prov);
                set id = id + 1;
            end while;
        END
        $$

        DELIMITER ;
        CALL insert_alumno(10);
        select * from alumno;

    --Intente ingresar un alumno con clave primaria repetida.
        insert into alumno values (0, now(), "prueba", "prueba.txt", "Direccion", "Ciudad", "Provincia");
        -- funciona ya que la primary key son dos campos el id y el año

    --Intente ingresar un alumno con documento repetido.
        insert into alumno values (0, now(), "prueba", "prueba.txt", "Direccion", "Ciudad", "Provincia");
        --ERROR 1062 (23000): Duplicate entry 'prueba.txt' for key 'alumno.idx_documento'

    --Ingrese varios alumnos de la misma ciudad y provincia.
        insert into alumno values (0, now(), "prueba", "prueba1.txt", "Direccion", "Ciudad", "Provincia");
        --Query OK, 1 row affected (0.51 sec)

        insert into alumno values (0, now(), "prueba", "prueba11.txt", "Direccion", "Ciudad", "Provincia");
        --Query OK, 1 row affected (0.49 sec)

        insert into alumno values (0, now(), "prueba", "prueba111.txt", "Direccion", "Ciudad", "Provincia");
        --Query OK, 1 row affected (0.27 sec)

    --Elimina los indices creados, y muestra que ya no se encuentran.
        drop index idx_documento on alumno;
        drop index idx_ciudad_provincia on alumno;
        show index from alumno;
        /*--------+------------+----------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
        | Table  | Non_unique | Key_name | Seq_in_index | Column_name      | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
        +--------+------------+----------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
        | alumno |          0 | PRIMARY  |            1 | num_id           | A         |           1 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
        | alumno |          0 | PRIMARY  |            2 | anio_inscripcion | A         |           1 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
        +--------+------------+----------+--------------+------------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
        */