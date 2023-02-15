PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE fabricante(
codigo int primary key,
nombre text);
INSERT INTO fabricante VALUES(1,'Asus');
INSERT INTO fabricante VALUES(2,'Lenovo');
INSERT INTO fabricante VALUES(3,'Hewlett-Packard');
INSERT INTO fabricante VALUES(4,'Samsung');
INSERT INTO fabricante VALUES(5,'Seagate');
INSERT INTO fabricante VALUES(6,'Crucial');
INSERT INTO fabricante VALUES(7,'Gigabyte');
INSERT INTO fabricante VALUES(8,'Huawei');
INSERT INTO fabricante VALUES(9,'Xiaomi');
CREATE TABLE producto(
codigo int primary key,
nombre text,
precio double,
codigo_fabricante int references fabricante(codigo));
INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);
COMMIT;

/*Consultas con multitabla con clausula where:

    Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos.
    */select producto.nombre,producto.precio,fabricante.nombre from producto,fabricante where producto.codigo_fabricante=fabricante.codigo;/*
    nombre                precio      nombre    
    --------------------  ----------  ----------
    Disco duro SATA3 1TB  86.99       Seagate   
    Memoria RAM DDR4 8GB  120.0       Crucial   
    Disco SSD 1 TB        150.99      Samsung   
    GeForce GTX 1050Ti    185.0       Gigabyte  
    GeForce GTX 1080 Xtr  755.0       Crucial   
    Monitor 24 LED Full   202.0       Asus      
    Monitor 27 LED Full   245.99      Asus      
    Portátil Yoga 520     559.0       Lenovo    
    Portátil Ideapd 320   444.0       Lenovo    
    Impresora HP Deskjet  59.99       Hewlett-Pa
    Impresora HP Laserje  180.0       Hewlett-Pa
    Devuelve una lista con el nombre del producto, precio y nombre de fabricante de todos los productos de la base de datos. Ordene el resultado por el nombre del fabricante, por orden alfabético.
    */select producto.nombre,producto.precio,fabricante.nombre from producto,fabricante where producto.codigo_fabricante=fabricante.codigo order by fabricante.nombre;/*
    nombre                  precio      nombre    
    ----------------------  ----------  ----------
    Monitor 24 LED Full HD  202.0       Asus      
    Monitor 27 LED Full HD  245.99      Asus      
    Memoria RAM DDR4 8GB    120.0       Crucial   
    GeForce GTX 1080 Xtrem  755.0       Crucial   
    GeForce GTX 1050Ti      185.0       Gigabyte  
    Impresora HP Deskjet 3  59.99       Hewlett-Pa
    Impresora HP Laserjet   180.0       Hewlett-Pa
    Portátil Yoga 520       559.0       Lenovo    
    Portátil Ideapd 320     444.0       Lenovo    
    Disco SSD 1 TB          150.99      Samsung   
    Disco duro SATA3 1TB    86.99       Seagate
    Devuelve una lista con el identificador del producto, nombre del producto, identificador del fabricante y nombre del fabricante, de todos los productos de la base de datos.
    */select producto.nombre,producto.codigo,fabricante.codigo,fabricante.nombre from producto,fabricante where producto.codigo_fabricante=fabricante.codigo;/*
nombre                codigo      codigo      nombre    
--------------------  ----------  ----------  ----------
Disco duro SATA3 1TB  1           5           Seagate   
Memoria RAM DDR4 8GB  2           6           Crucial   
Disco SSD 1 TB        3           4           Samsung   
GeForce GTX 1050Ti    4           7           Gigabyte  
GeForce GTX 1080 Xtr  5           6           Crucial   
Monitor 24 LED Full   6           1           Asus
Monitor 27 LED Full   7           1           Asus      
Portátil Yoga 520     8           2           Lenovo    
Portátil Ideapd 320   9           2           Lenovo    
Impresora HP Deskjet  10          3           Hewlett-Pa
Impresora HP Laserje  11          3           Hewlett-Pa
    Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más barato.
    */select producto.nombre,producto.precio,fabricante.nombre from producto,fabricante where producto.codigo_fabricante=fabricante.codigo order by producto.precio limit 1;/*
    nombre                     precio      nombre         
-------------------------  ----------  ---------------
Impresora HP Deskjet 3720  59.99       Hewlett-Packard
    Devuelve el nombre del producto, su precio y el nombre de su fabricante, del producto más caro.
    */select producto.nombre,producto.precio,fabricante.nombre from producto,fabricante where producto.codigo_fabricante=fabricante.codigo order by producto.precio desc limit 1/*
    nombre                   precio      nombre    
-----------------------  ----------  ----------
GeForce GTX 1080 Xtreme  755.0       Crucial
    Devuelve una lista de todos los productos del fabricante Lenovo.
    */select producto.nombre,producto.precio,fabricante.nombre from producto,fabricante where producto.codigo_fabricante=fabricante.codigo and fabricante.nombre="Lenovo";/*
    nombre             precio      nombre    
-----------------  ----------  ----------
Portátil Yoga 520  559.0       Lenovo    
Portátil Ideapd 3  444.0       Lenovo 
    Devuelve una lista de todos los productos del fabricante Crucial que tengan un precio mayor que 200€.
    */select producto.nombre,producto.precio,fabricante.nombre from producto,fabricante where producto.codigo_fabricante=fabricante.codigo and fabricante.nombre="Crucial" and precio>200;/*
    nombre                   precio      nombre    
-----------------------  ----------  ----------
GeForce GTX 1080 Xtreme  755.0       Crucial 
    Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Sin utilizar el operador IN.
    */select producto.nombre,producto.precio,fabricante.nombre from producto,fabricante where producto.codigo_fabricante=fabricante.codigo and fabricante.nombre="Seagate" or fabricante.nombre="Asus" or fabricante.nombre="Hewlett-Packard";/*
    nombre                precio      nombre    
--------------------  ----------  ----------
Disco duro SATA3 1TB  86.99       Asus      
Disco duro SATA3 1TB  86.99       Hewlett-Pa
Disco duro SATA3 1TB  86.99       Seagate   
Memoria RAM DDR4 8GB  120.0       Asus      
Memoria RAM DDR4 8GB  120.0       Hewlett-Pa
Disco SSD 1 TB        150.99      Asus      
Disco SSD 1 TB        150.99      Hewlett-Pa
GeForce GTX 1050Ti    185.0       Asus      
GeForce GTX 1050Ti    185.0       Hewlett-Pa
GeForce GTX 1080 Xtr  755.0       Asus      
GeForce GTX 1080 Xtr  755.0       Hewlett-Pa
Monitor 24 LED Full   202.0       Asus      
Monitor 24 LED Full   202.0       Hewlett-Pa
Monitor 27 LED Full   245.99      Asus      
Monitor 27 LED Full   245.99      Hewlett-Pa
Portátil Yoga 520     559.0       Asus      
Portátil Yoga 520     559.0       Hewlett-Pa
Portátil Ideapd 320   444.0       Asus      
Portátil Ideapd 320   444.0       Hewlett-Pa
Impresora HP Deskjet  59.99       Asus      
Impresora HP Deskjet  59.99       Hewlett-Pa
Impresora HP Laserje  180.0       Asus      
Impresora HP Laserje  180.0       Hewlett-Pa
    Devuelve un listado con todos los productos de los fabricantes Asus, Hewlett-Packardy Seagate. Utilizando el operador IN.
    */select producto.nombre,producto.precio,fabricante.nombre from producto,fabricante where producto.codigo_fabricante=fabricante.codigo and fabricante.nombre in ("Asus","Seagate","Hewlett-Packard");/*
    nombre                precio      nombre    
--------------------  ----------  ----------
Disco duro SATA3 1TB  86.99       Seagate   
Monitor 24 LED Full   202.0       Asus      
Monitor 27 LED Full   245.99      Asus      
Impresora HP Deskjet  59.99       Hewlett-Pa
Impresora HP Laserje  180.0       Hewlett-Pa
    Devuelve un listado con el nombre y el precio de todos los productos de los fabricantes cuyo nombre termine por la vocal e.
    */select producto.nombre,producto.precio,fabricante.nombre from producto,fabricante where producto.codigo_fabricante=fabricante.codigo and fabricante.nombre like '%e';/*
    nombre                precio      nombre    
--------------------  ----------  ----------
Disco duro SATA3 1TB  86.99       Seagate   
GeForce GTX 1050Ti    185.0       Gigabyte 
    Devuelve un listado con el nombre y el precio de todos los productos cuyo nombre de fabricante contenga el carácter w en su nombre.
    */select producto.nombre,producto.precio,fabricante.nombre from producto,fabricante where producto.codigo_fabricante=fabricante.codigo and fabricante.nombre like '%w%';/*
    nombre                     precio      nombre         
-------------------------  ----------  ---------------
Impresora HP Deskjet 3720  59.99       Hewlett-Packard
Impresora HP Laserjet Pro  180.0       Hewlett-Packard
    Devuelve un listado con el nombre de producto, precio y nombre de fabricante, de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente)
    */select producto.nombre,producto.precio,fabricante.nombre from producto,fabricante where producto.codigo_fabricante=fabricante.codigo and producto.precio>=180 order by producto.precio desc,producto.nombre;/*
    nombre                   precio      nombre    
-----------------------  ----------  ----------
GeForce GTX 1080 Xtreme  755.0       Crucial   
Portátil Yoga 520        559.0       Lenovo    
Portátil Ideapd 320      444.0       Lenovo    
Monitor 27 LED Full HD   245.99      Asus      
Monitor 24 LED Full HD   202.0       Asus      
GeForce GTX 1050Ti       185.0       Gigabyte  
Impresora HP Laserjet P  180.0       Hewlett-Pa
    Devuelve un listado con el identificador y el nombre de fabricante, solamente de aquellos fabricantes que tienen productos asociados en la base de datos.
*/select fabricante.codigo,fabricante.nombre from fabricante,producto where fabricante.codigo=producto.codigo_fabricante ;/*
codigo      nombre    
----------  ----------
5           Seagate   
6           Crucial   
4           Samsung   
7           Gigabyte  
6           Crucial   
1           Asus      
1           Asus      
2           Lenovo    
2           Lenovo    
3           Hewlett-Pa
3           Hewlett-Pa

Consultas con multitabla con LEFT JOIN y RIGHT JOIN

    Devuelve un listado de todos los fabricantes que existen en la base de datos, junto con los productos que tiene cada uno de ellos. El listado deberá mostrar también aquellos fabricantes que no tienen productos asociados.
*/select * from fabricante join producto where fabricante.codigo=producto.codigo_fabricante;/*
codigo  nombre           codigo  nombre                   precio  codigo_fabricante
------  ---------------  ------  -----------------------  ------  -----------------
1       Asus             1       Disco duro SATA3 1TB     86.99   5                
2       Lenovo           2       Memoria RAM DDR4 8GB     120.0   6                
3       Hewlett-Packard  3       Disco SSD 1 TB           150.99  4                
4       Samsung          4       GeForce GTX 1050Ti       185.0   7                
5       Seagate          5       GeForce GTX 1080 Xtreme  755.0   6                
6       Crucial          6       Monitor 24 LED Full HD   202.0   1                
7       Gigabyte         7       Monitor 27 LED Full HD   245.99  1                
8       Huawei           8       Portátil Yoga 520        559.0   2                
9       Xiaomi           9       Portátil Ideapd 320      444.0   2
    Devuelve un listado donde sólo aparezcan aquellos fabricantes que no tienen ningún producto asociado.
*//*

    Nota:¿Pueden existir productos que no estén relacionados con un fabricante? Justifique su respuesta.

Consultas realizando calculos

    Calcula el número total de productos que hay en la tabla productos.
*//*

    Calcula el número total de fabricantes que hay en la tabla fabricante.
*//*

    Calcula el número de valores distintos de identificador de fabricante aparecen en la tabla productos.
*//*

    Calcula la media del precio de todos los productos.
*//*

    Calcula el precio más barato de todos los productos.
*//*

    Calcula el precio más caro de todos los productos.
*//*

    Lista el nombre y el precio del producto más barato.
*//*

    Lista el nombre y el precio del producto más caro.
*//*

    Calcula la suma de los precios de todos los productos.
*//*

    Calcula el número de productos que tiene el fabricante Asus.
*//*

    Calcula la media del precio de todos los productos del fabricante Asus.
*//*

    Calcula el precio más barato de todos los productos del fabricante Asus.
*//*

    Calcula el precio más caro de todos los productos del fabricante Asus.
*//*

    Calcula la suma de todos los productos del fabricante Asus.
*//*

    Muestra el precio máximo, precio mínimo, precio medio y el número total de productos que tiene el fabricante Crucial.
*//*

    Muestra el número total de productos que tiene cada uno de los fabricantes. El listado también debe incluir los fabricantes que no tienen ningún producto. El resultado mostrará dos columnas, una con el nombre del fabricante y otra con el número de productos que tiene. Ordene el resultado descendentemente por el número de productos.
*//*

    Muestra el precio máximo, precio mínimo y precio medio de los productos de cada uno de los fabricantes. El resultado mostrará el nombre del fabricante junto con los datos que se solicitan.
*//*

    Muestra el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. No es necesario mostrar el nombre del fabricante, con el identificador del fabricante es suficiente.
*//*

    Muestra el nombre de cada fabricante, junto con el precio máximo, precio mínimo, precio medio y el número total de productos de los fabricantes que tienen un precio medio superior a 200€. Es necesario mostrar el nombre del fabricante.
*//*

    Calcula el número de productos que tienen un precio mayor o igual a 180€.
*//*

    Calcula el número de productos que tiene cada fabricante con un precio mayor o igual a 180€.
*//*

    Lista el precio medio los productos de cada fabricante, mostrando solamente el identificador del fabricante.
*//*

    Lista el precio medio los productos de cada fabricante, mostrando solamente el nombre del fabricante.
*//*

    Lista los nombres de los fabricantes cuyos productos tienen un precio medio mayor o igual a 150€.
*//*

    Devuelve un listado con los nombres de los fabricantes que tienen 2 o más productos.
*//*

    Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. No es necesario mostrar el nombre de los fabricantes que no tienen productos que cumplan la condición.
*//*


    Ejemplo del resultado esperado:

nombre 	total
Lenovo 	2
.... 	..

    Devuelve un listado con los nombres de los fabricantes y el número de productos que tiene cada uno con un precio superior o igual a 220 €. El listado debe mostrar el nombre de todos los fabricantes, es decir, si hay algún fabricante que no tiene productos con un precio superior o igual a 220€ deberá aparecer en el listado con un valor igual a 0 en el número de productos.
*//*


Ejemplo del resultado esperado:
nombre 	total
Lenovo 	2
.... 	..

    Devuelve un listado con los nombres de los fabricantes donde la suma del precio de todos sus productos es superior a 1000 €.
*//*

    Devuelve un listado con el nombre del producto más caro que tiene cada fabricante. El resultado debe tener tres columnas: nombre del producto, precio y nombre del fabricante. El resultado tiene que estar ordenado alfabéticamente de menor a mayor por el nombre del fabricante.
*//*


Subconsultas (En la cláusula WHERE)(Sin utilizar INNER JOIN)

    Devuelve todos los productos del fabricante Lenovo. (Sin utilizar INNER JOIN).
*//*

    Devuelve todos los datos de los productos que tienen el mismo precio que el producto más caro del fabricante Lenovo. (Sin utilizar INNER JOIN).
*//*

    Lista el nombre del producto más caro del fabricante Lenovo.
*//*

    Lista el nombre del producto más barato del fabricante Hewlett-Packard.
*//*

    Devuelve todos los productos de la base de datos que tienen un precio mayor o igual al producto más caro del fabricante Lenovo.
*//*

    Lista todos los productos del fabricante Asus que tienen un precio superior al precio medio de todos sus productos.
*//*


Subconsultas con ALL y ANY

    Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
*//*

    Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
*//*

    Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
*//*

    Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
*//*


Subconsultas con IN y NOT IN

    Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando IN o NOT IN).
*//*

    Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando IN o NOT IN).
*//*


Subconsultas con EXISTS y NOT EXISTS

    Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
*//*

    Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando EXISTS o NOT EXISTS).
*//*


Subconsultas correlacionadas

    Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
*//*

    Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
*//*

    Lista el nombre del producto más caro del fabricante Lenovo.
*//*


Subconsultas (En la cláusula HAVING)


    Devuelve un listado con todos los nombres de los fabricantes que tienen el mismo número de productos que el fabricante Lenovo.
*//*


*/