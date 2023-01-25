

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
SELECT nombre FROM cliente
  where nombre like "%o %";
	
        t.¿Qué clientes terminan su nombre en la letra “o” y, además, son mayores de 30 años?
SELECT nombre FROM cliente
  where nombre like "%o %" and edad>30;
	
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
SELECT * FROM fabricante ORDER by nombre DESC;
	
        aa.Obtén un listado de programas por orden de versión.
SELECT nombre FROM programa ORDER by version ASC;
	
        ab.Genera un listado de los programas que desarrolla Oracle.
SELECT * FROM programa,desarrolla,fabricante
  WHERE programa.codigo=desarrolla.codigo and desarrolla.id_fab=fabricante.id_fab and fabricante.nombre ="Oracle";
	
        ac.¿Qué comercios distribuyen Windows?
SELECT comercio.nombre FROM comercio,distribuye,programa
  WHERE comercio.cif=distribuye.cif and distribuye.codigo=programa.codigo and programa.nombre="Windows";
	
        ad.Genera un listado de los programas y cantidades que se han distribuido a El Corte Inglés de Madrid.
SELECT programa.nombre,distribuye.cantidad FROM comercio,distribuye,programa
  WHERE comercio.cif=distribuye.cif and distribuye.codigo=programa.codigo and comercio.nombre="El Corte Inglés" and     COMERCIO.ciudad="Madrid";
	
        ae.¿Qué fabricante ha desarrollado Freddy Hardest?
SELECT fabricante.nombre from fabricante,desarrolla,programa
  WHERE fabricante.id_fab=desarrolla.id_fab and desarrolla.codigo=programa.codigo and programa.nombre="Freddy           Hardest";
	
        af.Selecciona el nombre de los programas que se registran por Internet.
SELECT programa.nombre FROM programa,registra
  WHERE programa.codigo and registra.medio="Internet";
	
        ag.¿Qué medios ha utilizado para registrarse Pepe Pérez?
SELECT registra.medio FROM registra,cliente
  WHERE registra.dni=cliente.dni and cliente.nombre="Pepe Pérez";
	
        ah.¿Qué usuarios han optado por Internet como medio de registro?
SELECT cliente.nombre FROM registra,cliente
  WHERE registra.dni=cliente.dni and registra.medio="Internet";
	
        ai.¿Qué programas han recibido registros por tarjeta postal?
SELECT programa.nombre FROM registra,programa
  WHERE programa.codigo=registra.codigo and registra.medio="Tarjeta postal";
	
        aj.¿En qué localidades se han vendido productos que se han registrado por Internet?
SELECT comercio.nombre FROM registra,comercio
  WHERE comercio.cif=registra.cif and registra.medio="Internet";
	
        ak.Obtén un listado de los nombres de las personas que se han registrado por Internet, junto al nombre de los programas para los que ha efectuado el registro.
SELECT cliente.nombre, programa.nombre FROM cliente,registra,programa 
  WHERE cliente.dni=registra.dni AND registra.codigo=programa.codigo AND registra.medio='Internet'  ;
	
        al.Genera un listado en el que aparezca cada cliente junto al programa que ha registrado, el medio con el que lo ha hecho y el comercio en el que lo ha adquirido.
SELECT cliente.nombre,programa.nombre,registra.medio,comercio.nombre FROM cliente,programa,registra,comercio
  WHERE cliente.dni=registra.dni and programa.codigo=registra.codigo and comercio.cif=registra.cif and                 registra.medio="Internet";
	
        am.Genera un listado con las ciudades en las que se pueden obtener los productos de Oracle.
SELECT DISTINCT comercio.ciudad FROM comercio,distribuye,programa,desarrolla,fabricante 
  WHERE comercio.cif=distribuye.cif AND distribuye.codigo=programa.codigo AND programa.codigo=desarrolla.codigo AND     desarrolla.id_fab= abricante.id_fab AND fabricante.nombre='Oracle';
	
        ao.Obtén el nombre de los usuarios que han registrado Access XP.
SELECT cliente.nombre FROM cliente,registra,programa 
  WHERE cliente.dni=registra.dni AND registra.codigo=programa.codigo AND programa.nombre='Access' AND                   programa.version like 'XP%';
	
        ap.Nombre de aquellos fabricantes cuyo país es el mismo que ʻOracleʼ. (Subconsulta).
SELECT nombre FROM fabricante WHERE pais=(SELECT pais FROM fabricante WHERE nombre='Oracle');
	
        aq.Nombre de aquellos clientes que tienen la misma edad que Pepe Pérez. (Subconsulta).
SELECT nombre FROM cliente WHERE edad = (SELECT edad FROM cliente WHERE nombre="Pepe Pérez");
	
        ar.Genera un listado con los comercios que tienen su sede en la misma ciudad que tiene el comercio ʻFNACʼ. (Subconsulta).
SELECT nombre FROM comercio WHERE ciudad = (SELECT ciudad FROM comercio WHERE nombre="FNAC");
	
        as.Nombre de aquellos clientes que han registrado un producto de la misma forma que el cliente ʻPepe Pérezʼ. (Subconsulta).
SELECT cliente.nombre FROM cliente,registra WHERE registra.dni=cliente.dni AND registra.medio = (SELECT registra.medio FROM registra,cliente WHERE registra.dni=cliente.dni AND cliente.nombre='Pepe Pérez');
	
        at.Obtener el número de programas que hay en la tabla programas. 
SELECT count(nombre) from programa;
	
	46 Calcula el número de clientes cuya edad es mayor de 40 años.
SELECT count(nombre) from cliente
  WHERE edad>40;
	
        au.Calcula el número de productos que ha vendido el establecimiento cuyo CIF es 1.
SELECT count(distribuye.cantidad) FROM distribuye 
  WHERE cif="1";
	
        aw.Calcula la media de programas que se venden cuyo código es 7.
SELECT avg(distribuye.cantidad) FROM distribuye 
  WHERE codigo="7";
	
        ax.Calcula la mínima cantidad de programas de código 7 que se ha vendido
SELECT min(distribuye.cantidad) FROM distribuye 
  WHERE codigo="7";
	
        ay.Calcula la máxima cantidad de programas de código 7 que se ha vendido.
SELECT max(distribuye.cantidad) FROM distribuye 
  WHERE codigo="7";
	
        az.¿En cuántos establecimientos se vende el programa cuyo código es 7?
SELECT count(comercio.nombre) FROM comercio,programa,distribuye
  WHERE comercio.cif=distribuye.cif and programa.codigo=distribuye.codigo and programa.codigo="7";
	
        ba.Calcular el número de registros que se han realizado por Internet.
SELECT count(*) from registra
  WHERE medio="Internet";
	
        bb.Obtener el número total de programas que se han vendido en ʻSevillaʼ.
SELECT count(programa.nombre) from programa,distribuye,comercio
  WHERE programa.codigo=distribuye.codigo and comercio.cif=distribuye.cif and ciudad=
  (SELECT ciudad FROM comercio WHERE ciudad="Sevilla");
	
        bc.Calcular el número total de programas que han desarrollado los fabricantes cuyo país es ʻEstados Unidosʼ.
SELECT count(programa.nombre) from programa,desarrolla,fabricante
  WHERE desarrolla.codigo=programa.codigo and fabricante.id_fab=desarrolla.id_fab and fabricante.pais="Estados Unidos"
	
        be.Visualiza el nombre de todos los clientes en mayúscula. En el resultado de la consulta debe aparecer también la longitud de la cadena nombre.
SELECT upper(nombre), length(nombre) from cliente;
	
        bf.Con una consulta concatena los campos nombre y versión de la tabla PROGRAMA.
SELECT nombre || version FROM programa
