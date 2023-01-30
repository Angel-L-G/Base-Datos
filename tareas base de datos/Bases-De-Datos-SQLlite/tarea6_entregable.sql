--INSERT
INSERT INTO articulo VALUES('1', 'Teclado', '100', '3');
INSERT INTO articulo VALUES('2', 'Disco duro 300 Gb', '500', '5');
INSERT INTO articulo VALUES('3', 'Mouse', '80', '3');
INSERT INTO articulo VALUES('4', 'Memoria USB', '140', '4');
INSERT INTO articulo VALUES('5', 'Memoria RAM 290', '1', NULL);
INSERT INTO articulo VALUES('6', 'Disco duro extraíble 250 Gb', '650', '5');
INSERT INTO articulo VALUES('7', 'Memoria USB', '279', '1');
INSERT INTO articulo VALUES('8', 'DVD Rom', '450', '2');
INSERT INTO articulo VALUES('9', 'CD Rom', '200', '2');
INSERT INTO articulo VALUES('10', 'Tarjeta de red', '180', '3');

--    Realizar las siguientes consultas:

--    Obtener todos los datos de los productos de la tienda.
        SELECT * FROM articulo;
--    Obtener los nombres de los productos de la tienda.
        SELECT nombre FROM articulo;
--    Obtener los nombres y precio de los productos de la tienda. Obtener los nombres de los artículos sin repeticiones.
        SELECT DISTINCT nombre, precio FROM articulo;
--    Obtener todos los datos del artículo cuya clave de producto es 5.
        SELECT * FROM articulo WHERE clave="5";
--    Obtener todos los datos del artículo cuyo nombre del producto es Teclado.

--    Obtener todos los datos de la Memoria RAM y memorias USB.

--    Obtener todos los datos de los artículos que empiezan con M.

--    Obtener el nombre de los productos donde el precio sea 100.

--    Obtener el nombre de los productos donde el precio sea mayor a 200.

--    Obtener todos los datos de los artículos cuyo precio este entre 100 y 350.

--    Obtener el precio medio de todos los productos.
--    Obtener el precio medio de los artículos cuyo código de fabricante sea 2.
--    Obtener el nombre y precio de los artículos ordenados por Nombre.
--    Obtener todos los datos de los productos ordenados descendentemente por Precio.
--    Obtener el nombre y precio de los artículos cuyo precio sea mayor a 250 y ordenarlos descendentemente por precio y luego ascendentemente por nombre.
--    Obtener un listado completo de los productos, incluyendo por cada articulo los datos del articulo y del fabricante.
--    Obtener la clave de producto, nombre del producto y nombre del fabricante de todos los productos en venta.
--    Obtener el nombre y precio de los artículos donde el fabricante sea Logitech ordenarlos alfabéticamente por nombre del producto.
--    Obtener el nombre, precio y nombre de fabricante de los productos que son marca Lexar o Kingston ordenados descendentemente por precio.
--    Añade un nuevo producto: Clave del producto 11, Altavoces de 120 del fabricante 2.
--    Cambia el nombre del producto 6 a Impresora Laser.

--    Aplicar un descuento del 10% a todos los productos.

--    Aplicar un descuento de 10 a todos los productos cuyo precio sea mayor o igual a 300.
--    Borra el producto número 6
