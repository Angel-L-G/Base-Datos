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

                CREATE INDEX idx_ciudad_provincia on alumno(ciudad,provincia);
        --Vea los índices de la tabla.
            --Nota:Muestra el comando y la salida "show index".

    --Genera un procedimiento que realice la inserción de 5 registros, al menos 2 veces, de forma aleatoria.



    --Intente ingresar un alumno con clave primaria repetida.



    --Intente ingresar un alumno con documento repetido.



    --Ingrese varios alumnos de la misma ciudad y provincia.



    --Elimina los indices creados, y muestra que ya no se encuentran.


