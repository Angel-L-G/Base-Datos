

comandos para :

	    CREATE TABLE fabricante(
		id_fab INTEGER,
		nombre text,
		pais TEXT,
		PRIMARY KEY(id_fab)
	);
	CREATE TABLE programa(
		codigo INTEGER,
		nombre text,
		version TEXT,
		PRIMARY KEY(codigo)
	);
	CREATE TABLE cliente(
		dni INTEGER,
		nombre text,
		edad TEXT,
		PRIMARY KEY(dni)
	);
	CREATE TABLE desarrolla(
		id_fab INTEGER,
		codigo INTEGER,
		PRIMARY KEY(id_fab,codigo)
	);
	CREATE TABLE distribuye(
		cif INTEGER,
		codigo INTEGER,
		cantidad INTEGER,
		PRIMARY KEY(cif,codigo)
	);
	CREATE TABLE registra(
		cif INTEGER,
		dni INTEGER,
		codigo INTEGER,
		medio TEXT,
		PRIMARY KEY(cif,dni)
	);

LUEGO INSERTAS LAS TUPLAS

CONSULTAS:
  

        a.Averigua el DNI de todos los clientes.
SELECT dni FROM cliente;
	
        b.Consulta todos los datos de todos los programas.
SELECT * FROM programa;
	
        c.Obtén un listado con los nombres de todos los programas.
SELECT nombre FROM programa;
	
        d.Genera una lista con todos los comercios.
SELECT * FROM comercio;
	
        e.Genera una lista de las ciudades con establecimientos donde se venden programas, sin que aparezcan valores duplicados (utiliza DISTINCT).
 select distinct ciudad from comercio;
	
        f.Obtén una lista con los nombres de programas, sin que aparezcan valores duplicados (utiliza DISTINCT).
select distinct nombre from programa;
	
	g.Obtén el DNI más 4 de todos los clientes.
SELECT dni+4 FROM cliente;
	
        h.Haz un listado con los códigos de los programas multiplicados por 7. 9 ¿Cuáles son los programas cuyo código es inferior o igual a 10?
SELECT codigo*7.9 FROM programa;
	
        i.¿Cuál es el programa cuyo código es 11?
SELECT * FROM programa
  WHERE codigo=11;
	
        j.¿Qué fabricantes son de Estados Unidos?
SELECT nombre FROM fabricante
  WHERE pais="Estados Unidos";
	
        k.¿Cuáles son los fabricantes no españoles? Utilizar el operador IN.
SELECT * FROM fabricante
  WHERE pais not in("España");
	
        l.Obtén un listado con los códigos de las distintas versiones de Windows.
SELECT * FROM programa
  WHERE nombre="Windows";
	
        m.¿En qué ciudades comercializa programas El Corte Inglés?
SELECT ciudad FROM comercio
  WHERE nombre="El Corte Inglés";
	
        o.¿Qué otros comercios hay, además de El Corte Inglés? Utilizar el operador IN.
SELECT nombre FROM comercio
  WHERE nombre not in("El Corte Inglés");
	
        p.Genera una lista con los códigos de las distintas versiones de Windows y Access. Utilizar el operador IN.
SELECT nombre,version FROM programa
  WHERE nombre in ("Windows","Access");
	
        q.Obtén un listado que incluya los nombres de los clientes de edades comprendidas entre 10 y 25 y de los mayores de 50 años. Da una solución con BETWEEN y otra sin BETWEEN.
SELECT nombre,edad FROM cliente
  WHERE (edad BETWEEN 10 and 25) or (edad>50);
  
SELECT nombre,edad FROM cliente
  WHERE (edad >= 10 and edad <=25) or (edad>50);
	
        r.Saca un listado con los comercios de Sevilla y Madrid. No se admiten valores duplicados.
select distinct nombre from comercio
  WHERE ciudad in ("Sevilla","Madrid");
	
        s.¿Qué clientes terminan su nombre en la letra “o”?
SELECT * FROM cliente
  where nombre REGEXP "o$";
	
        t.¿Qué clientes terminan su nombre en la letra “o” y, además, son mayores de 30 años?
SELECT * FROM cliente
  where nombre REGEXP "o$" and edad>30;
	
        u.Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, o cuyo nombre comience por una A o por una W.
SELECT * FROM programa
  where version like "%i" or (nombre like "A%" or nombre like "W%");
	
        w.Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, o cuyo nombre comience por una A y termine por una S.
SELECT * FROM programa
  where version like "%i" or (nombre like "A%" and nombre like "%S");
	
        x.Obtén un listado en el que aparezcan los programas cuya versión finalice por una letra i, y cuyo nombre no comience por una A.
SELECT * FROM programa
  where version like "%i" or (nombre not like "A%");
	
        y.Obtén una lista de empresas por orden alfabético ascendente.
SELECT * FROM fabricante ORDER by nombre ASC;
	
        z.Genera un listado de empresas por orden alfabético descendente.
SELECT * FROM fabricante ORDER by nombre ASC;
	
        aa.Obtén un listado de programas por orden de versión.
SELECT * FROM fabricante ORDER by nombre DESC;
	
        ab.Genera un listado de los programas que desarrolla Oracle.

	
        ac.¿Qué comercios distribuyen Windows?

	
        ad.Genera un listado de los programas y cantidades que se han distribuido a El Corte Inglés de Madrid.

	
        ae.¿Qué fabricante ha desarrollado Freddy Hardest?

	
        af.Selecciona el nombre de los programas que se registran por Internet.

	
        ag.¿Qué medios ha utilizado para registrarse Pepe Pérez?

	
        ah.¿Qué usuarios han optado por Internet como medio de registro?

	
        ai.¿Qué programas han recibido registros por tarjeta postal?

	
        aj.¿En qué localidades se han vendido productos que se han registrado por Internet?

	
        ak.Obtén un listado de los nombres de las personas que se han registrado por Internet, junto al nombre de los programas para los que ha efectuado el registro.

	
        al.Genera un listado en el que aparezca cada cliente junto al programa que ha registrado, el medio con el que lo ha hecho y el comercio en el que lo ha adquirido.

	
        am.Genera un listado con las ciudades en las que se pueden obtener los productos de Oracle.

	
        ao.Obtén el nombre de los usuarios que han registrado Access XP.

	
        ap.Nombre de aquellos fabricantes cuyo país es el mismo que ʻOracleʼ. (Subconsulta).

	
        aq.Nombre de aquellos clientes que tienen la misma edad que Pepe Pérez. (Subconsulta).

	
        ar.Genera un listado con los comercios que tienen su sede en la misma ciudad que tiene el comercio ʻFNACʼ. (Subconsulta).

	
        as.Nombre de aquellos clientes que han registrado un producto de la misma forma que el cliente ʻPepe Pérezʼ. (Subconsulta).

	
        at.Obtener el número de programas que hay en la tabla programas. 46 Calcula el número de clientes cuya edad es mayor de 40 años.

	
        au.Calcula el número de productos que ha vendido el establecimiento cuyo CIF es 1.

	
        aw.Calcula la media de programas que se venden cuyo código es 7.

	
        ax.Calcula la mínima cantidad de programas de código 7 que se ha vendido

	
        ay.Calcula la máxima cantidad de programas de código 7 que se ha vendido.

	
        az.¿En cuántos establecimientos se vende el programa cuyo código es 7?

	
        ba.Calcular el número de registros que se han realizado por Internet.

	
        bb.Obtener el número total de programas que se han vendido en ʻSevillaʼ.

	
        bc.Calcular el número total de programas que han desarrollado los fabricantes cuyo país es ʻEstados Unidosʼ.

	
        be.Visualiza el nombre de todos los clientes en mayúscula. En el resultado de la consulta debe aparecer también la longitud de la cadena nombre.

	
        bf.Con una consulta concatena los campos nombre y versión de la tabla PROGRAMA.

