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

--Lista el nombre de todos los productos que hay en la tabla producto.
select nombre From producto;
--Lista los nombres y los precios de todos los productos de la tabla producto.
select nombre,precio From producto;
--Lista todas las columnas de la tabla producto.
select * from producto;
--Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD).
select nombre,precio,precio*1.08 From producto;
--Lista el nombre de los productos, el precio en euros y el precio en dólares estadounidenses (USD). Utiliza los siguientes alias para las columnas: nombre de producto, euros, dólares.
select nombre,precio as euro,precio*1.08 as dolares From producto;
--Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a mayúscula.
select UPPER(nombre),precio from producto;
--Lista los nombres y los precios de todos los productos de la tabla producto, convirtiendo los nombres a minúscula.
select LOWER(nombre),precio from producto;
--Lista el nombre de todos los fabricantes en una columna, y en otra columna obtenga en mayúsculas los dos primeros caracteres del nombre del fabricante.
select nombre,substr(UPPER(nombre), 1, 2) from fabricante;
/*
codigo      nombre                precio      codigo_fabricante
----------  --------------------  ----------  -----------------
1           Disco duro SATA3 1TB  86.99       5                
2           Memoria RAM DDR4 8GB  120.0       6                
3           Disco SSD 1 TB        150.99      4                
4           GeForce GTX 1050Ti    185.0       7                
5           GeForce GTX 1080 Xtr  755.0       6                
6           Monitor 24 LED Full   202.0       1                
7           Monitor 27 LED Full   245.99      1                
8           Portátil Yoga 520     559.0       2                
9           Portátil Ideapd 320   444.0       2                
10          Impresora HP Deskjet  59.99       3                
11          Impresora HP Laserje  180.0       3 
*/
--Lista los nombres y los precios de todos los productos de la tabla producto, redondeando el valor del precio.
select nombre,round(precio) from producto;
/*
nombre                round(precio)
--------------------  -------------
Disco duro SATA3 1TB  87.0         
Memoria RAM DDR4 8GB  120.0        
Disco SSD 1 TB        151.0        
GeForce GTX 1050Ti    185.0        
GeForce GTX 1080 Xtr  755.0        
Monitor 24 LED Full   202.0        
Monitor 27 LED Full   246.0        
Portátil Yoga 520     559.0        
Portátil Ideapd 320   444.0        
Impresora HP Deskjet  60.0         
Impresora HP Laserje  180.0
*/
--Lista los nombres y los precios de todos los productos de la tabla producto, truncando el valor del precio para mostrarlo sin ninguna cifra decimal.
select nombre,round(precio,0) from producto;
/*
nombre                round(precio,0)
--------------------  ---------------
Disco duro SATA3 1TB  87.0           
Memoria RAM DDR4 8GB  120.0          
Disco SSD 1 TB        151.0          
GeForce GTX 1050Ti    185.0          
GeForce GTX 1080 Xtr  755.0          
Monitor 24 LED Full   202.0          
Monitor 27 LED Full   246.0          
Portátil Yoga 520     559.0          
Portátil Ideapd 320   444.0          
Impresora HP Deskjet  60.0           
Impresora HP Laserje  180.0
*/
--Lista el identificador de los fabricantes que tienen productos en la tabla producto.
select fabricante.nombre,producto.nombre from fabricante,producto where fabricante.codigo=producto.codigo_fabricante;
/*
Seagate     Disco duro SATA3 1TB
Crucial     Memoria RAM DDR4 8GB
Samsung     Disco SSD 1 TB      
Gigabyte    GeForce GTX 1050Ti  
Crucial     GeForce GTX 1080 Xtr
Asus        Monitor 24 LED Full 
Asus        Monitor 27 LED Full 
Lenovo      Portátil Yoga 520   
Lenovo      Portátil Ideapd 320 
Hewlett-Pa  Impresora HP Deskjet
Hewlett-Pa  Impresora HP Laserje
*/
--Lista el identificador de los fabricantes que tienen productos en la tabla producto, eliminando los identificadores que aparecen repetidos.
select fabricante.nombre,producto.nombre from fabricante,producto where fabricante.codigo=producto.codigo_fabricante;
/*
codigo    
----------
5         
6         
4         
7         
1         
2         
3 
*/
--Lista los nombres de los fabricantes ordenados de forma ascendente.
select nombre from fabricante order by nombre;
/*nombre    
----------
Asus      
Crucial   
Gigabyte  
Hewlett-Pa
Huawei    
Lenovo    
Samsung   
Seagate   
Xiaomi*/
--Lista los nombres de los fabricantes ordenados de forma descendente.
select nombre from fabricante order by nombre desc;
/*nombre    
----------
Xiaomi    
Seagate   
Samsung   
Lenovo    
Huawei    
Hewlett-Pa
Gigabyte  
Crucial   
Asus */
--Lista los nombres de los productos ordenados en primer lugar por el nombre de forma ascendente y en segundo lugar por el precio de forma descendente.
select nombre,precio from producto order by nombre,precio desc;
/*nombre          precio    
--------------  ----------
Disco SSD 1 TB  150.99    
Disco duro SAT  86.99     
GeForce GTX 10  185.0     
GeForce GTX 10  755.0     
Impresora HP D  59.99     
Impresora HP L  180.0     
Memoria RAM DD  120.0     
Monitor 24 LED  202.0     
Monitor 27 LED  245.99    
Portátil Ideap  444.0     
Portátil Yoga   559.0 */
--Devuelve una lista con las 5 primeras filas de la tabla fabricante.
select * from fabricante limit 5;
/*codigo      nombre    
----------  ----------
1           Asus      
2           Lenovo    
3           Hewlett-Pa
4           Samsung   
5           Seagate */
--Devuelve una lista con 2 filas a partir de la cuarta fila de la tabla fabricante. La cuarta fila también se debe incluir en la respuesta.
select * from producto limit 2 offset 3;
/*codigo      nombre              precio      codigo_fabricante
----------  ------------------  ----------  -----------------
4           GeForce GTX 1050Ti  185.0       7                
5           GeForce GTX 1080 X  755.0       6*/
--Lista el nombre y el precio del producto más barato. (Utilice solamente las cláusulas ORDER BY y LIMIT)
 select * from producto order by precio limit 1;
 /*codigo      nombre                     precio      codigo_fabricante
----------  -------------------------  ----------  -----------------
10          Impresora HP Deskjet 3720  59.99       3 */
--Lista el nombre y el precio del producto más caro. (Utilice solamente las cláusulas ORDER BY y LIMIT)
select * from producto order by precio desc limit 1;
/*codigo      nombre                   precio      codigo_fabricante
----------  -----------------------  ----------  -----------------
5           GeForce GTX 1080 Xtreme  755.0       6*/
--Lista el nombre de todos los productos del fabricante cuyo identificador de fabricante es igual a 2.
select codigo_fabricante,nombre from producto where codigo_fabricante=2;
/*codigo_fabricante  nombre           
-----------------  -----------------
2                  Portátil Yoga 520
2                  Portátil Ideapd 3*/
--Lista el nombre de los productos que tienen un precio menor o igual a 120€.
select nombre,precio from producto where precio<=120;
/*nombre                precio    
--------------------  ----------
Disco duro SATA3 1TB  86.99     
Memoria RAM DDR4 8GB  120.0     
Impresora HP Deskjet  59.99*/
--Lista el nombre de los productos que tienen un precio mayor o igual a 400€.
select nombre,precio from producto where precio>=400;
/*nombre                   precio    
-----------------------  ----------
GeForce GTX 1080 Xtreme  755.0     
Portátil Yoga 520        559.0     
Portátil Ideapd 320      444.0 */
--Lista todos los productos que tengan un precio entre 80€ y 300€. Sin utilizar el operador BETWEEN.
select nombre,precio from producto where precio between 80 and 300;
/*nombre                precio    
--------------------  ----------
Disco duro SATA3 1TB  86.99     
Memoria RAM DDR4 8GB  120.0     
Disco SSD 1 TB        150.99    
GeForce GTX 1050Ti    185.0     
Monitor 24 LED Full   202.0     
Monitor 27 LED Full   245.99    
Impresora HP Laserje  180.0*/
--Lista todos los productos que tengan un precio entre 60€ y 200€. Utilizando el operador BETWEEN.
select nombre,precio from producto where precio between 60 and 200;
/*nombre                precio    
--------------------  ----------
Disco duro SATA3 1TB  86.99     
Memoria RAM DDR4 8GB  120.0     
Disco SSD 1 TB        150.99    
GeForce GTX 1050Ti    185.0     
Impresora HP Laserje  180.0*/
--Lista todos los productos que tengan un precio mayor que 200€ y que el identificador de fabricante sea igual a 6.
select * from producto where precio>200 and codigo_fabricante=6;
/*codigo      nombre                   precio      codigo_fabricante
----------  -----------------------  ----------  -----------------
5           GeForce GTX 1080 Xtreme  755.0       6*/
--Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Sin utilizar el operador IN.
select * from producto where codigo_fabricante=1 or codigo_fabricante=3 or codigo_fabricante=5;
/*codigo      nombre                precio      codigo_fabricante
----------  --------------------  ----------  -----------------
1           Disco duro SATA3 1TB  86.99       5                
6           Monitor 24 LED Full   202.0       1                
7           Monitor 27 LED Full   245.99      1                
10          Impresora HP Deskjet  59.99       3                
11          Impresora HP Laserje  180.0       3*/
--Lista todos los productos donde el identificador de fabricante sea 1, 3 o 5. Utilizando el operador IN.
select * from producto where codigo_fabricante in (1,3,5);
/*codigo      nombre                precio      codigo_fabricante
----------  --------------------  ----------  -----------------
1           Disco duro SATA3 1TB  86.99       5                
6           Monitor 24 LED Full   202.0       1                
7           Monitor 27 LED Full   245.99      1                
10          Impresora HP Deskjet  59.99       3                
11          Impresora HP Laserje  180.0       3 */
--Lista el nombre y el precio de los productos en céntimos (Habrá que multiplicar por 100 el valor del precio). Cree un alias para la columna que contiene el precio que se llame céntimos.
select nombre,precio*100 as centimos from producto;
/*nombre                centimos  
--------------------  ----------
Disco duro SATA3 1TB  8699.0    
Memoria RAM DDR4 8GB  12000.0   
Disco SSD 1 TB        15099.0   
GeForce GTX 1050Ti    18500.0   
GeForce GTX 1080 Xtr  75500.0   
Monitor 24 LED Full   20200.0   
Monitor 27 LED Full   24599.0   
Portátil Yoga 520     55900.0   
Portátil Ideapd 320   44400.0   
Impresora HP Deskjet  5999.0    
Impresora HP Laserje  18000.0 */
--Lista los nombres de los fabricantes cuyo nombre empiece por la letra S.
select nombre from fabricante regexp '^S.*';
/**/
--Lista los nombres de los fabricantes cuyo nombre termine por la vocal e.
select nombre from fabricante regexp '.*e$';
/**/
--Lista los nombres de los fabricantes cuyo nombre contenga el carácter w.
select nombre from fabricante regexp '(w|W)';
/**/
--Lista los nombres de los fabricantes cuyo nombre sea de 4 caracteres.
select nombre from fabricante regexp '.{4}';
/**/
--Devuelve una lista con el nombre de todos los productos que contienen la cadena Portátil en el nombre.
select nombre from fabricante regexp 'Portátil';
/**/
--Devuelve una lista con el nombre de todos los productos que contienen la cadena Monitor en el nombre y tienen un precio inferior a 215 €.
select nombre from producto regexp 'Monitor' and precio<215;
/**/
--Lista el nombre y el precio de todos los productos que tengan un precio mayor o igual a 180€. Ordene el resultado en primer lugar por el precio (en orden descendente) y en segundo lugar por el nombre (en orden ascendente).
select nombre from producto where precio>=180 order by precio desc,nombre;
/*nombre                 
-----------------------
GeForce GTX 1080 Xtreme
Portátil Yoga 520      
Portátil Ideapd 320    
Monitor 27 LED Full HD 
Monitor 24 LED Full HD 
GeForce GTX 1050Ti     
Impresora HP Laserjet P*/