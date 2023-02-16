PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE departamento(
codigo int primary key,
nombre texto,
presupuesto double,
gastos double);
INSERT INTO departamento VALUES(1,'Desarrollo',120000.0,6000.0);
INSERT INTO departamento VALUES(2,'Sistemas',150000.0,20999.999999999999999);
INSERT INTO departamento VALUES(3,'Recursos Humanos',279999.99999999999999,25000.0);
INSERT INTO departamento VALUES(4,'Contabilidad',110000.0,3000.0);
INSERT INTO departamento VALUES(5,'I+D',375000.0,379999.99999999999999);
INSERT INTO departamento VALUES(6,'Proyectos',0.0,0.0);
INSERT INTO departamento VALUES(7,'Publicidad',0.0,1000.0);
CREATE TABLE empleado(
codigo int primary key,
nif text,
nombre text,
apellido1 text,
apellido2 text,
codigo_departamento int references departamento(codigo));
INSERT INTO empleado VALUES(1,'32481596F','Aarón','Rivero','Gómez',1);
INSERT INTO empleado VALUES(2,'Y5575632D','Adela','Salas','Díaz',2);
INSERT INTO empleado VALUES(3,'R6970642B','Adolfo','Rubio','Flores',3);
INSERT INTO empleado VALUES(4,'77705545E','Adrián','Suárez',NULL,4);
INSERT INTO empleado VALUES(5,'17087203C','Marcos','Loyola','Méndez',5);
INSERT INTO empleado VALUES(6,'38382980M','María','Santana','Moreno',1);
INSERT INTO empleado VALUES(7,'80576669X','Pilar','Ruiz',NULL,2);
INSERT INTO empleado VALUES(8,'71651431Z','Pepe','Ruiz','Santana',3);
INSERT INTO empleado VALUES(9,'56399183D','Juan','Gómez','López',2);
INSERT INTO empleado VALUES(10,'46384486H','Diego','Flores','Salas',5);
INSERT INTO empleado VALUES(11,'67389283A','Marta','Herrera','Gil',1);
INSERT INTO empleado VALUES(12,'41234836R','Irene','Salas','Flores',NULL);
INSERT INTO empleado VALUES(13,'82635162B','Juan Antonio','Sáez','Guerrero',NULL);
COMMIT;

--## Consultas sobre una tabla

--1. Lista el primer apellido de todos los empleados.
select apellido1 from empleado;
/*apellido1
---------
Rivero   
Salas    
Rubio    
Suárez   
Loyola   
Santana  
Ruiz     
Ruiz     
Gómez    
Flores   
Herrera  
Salas    
Sáez*/ 
--2. Lista el primer apellido de los empleados eliminando los apellidos que estén repetidos.
select distinct apellido1 from empleado;/*
apellido1
---------
Rivero   
Salas    
Rubio    
Suárez   
Loyola   
Santana  
Ruiz     
Gómez    
Flores   
Herrera  
Sáez 
3. Lista todas las columnas de la tabla empleado.
*/SELECT * from empleado;/*
codigo  nif        nombre        apellido1  apellido2  codigo_departamento
------  ---------  ------------  ---------  ---------  -------------------
1       32481596F  Aarón         Rivero     Gómez      1                  
2       Y5575632D  Adela         Salas      Díaz       2                  
3       R6970642B  Adolfo        Rubio      Flores     3                  
4       77705545E  Adrián        Suárez                4                  
5       17087203C  Marcos        Loyola     Méndez     5                  
6       38382980M  María         Santana    Moreno     1                  
7       80576669X  Pilar         Ruiz                  2                  
8       71651431Z  Pepe          Ruiz       Santana    3                  
9       56399183D  Juan          Gómez      López      2                  
10      46384486H  Diego         Flores     Salas      5                  
11      67389283A  Marta         Herrera    Gil        1                  
12      41234836R  Irene         Salas      Flores                        
13      82635162B  Juan Antonio  Sáez       Guerrero 
4. Lista el nombre y los apellidos de todos los empleados.
*/SELECT nombre,apellido1,apellido2 from empleado;/*
nombre        apellido1  apellido2
------------  ---------  ---------
Aarón         Rivero     Gómez    
Adela         Salas      Díaz     
Adolfo        Rubio      Flores   
Adrián        Suárez              
Marcos        Loyola     Méndez   
María         Santana    Moreno   
Pilar         Ruiz                
Pepe          Ruiz       Santana  
Juan          Gómez      López    
Diego         Flores     Salas    
Marta         Herrera    Gil      
Irene         Salas      Flores   
Juan Antonio  Sáez       Guerrero 
--
1                  
2                  
3                  
2                  
5                  
1 
6. Lista el identificador de los departamentos de los empleados que aparecen en la tabla empleado, eliminando los identificadores que aparecen repetidos.
*/SELECT distinct codigo_departamento FROM empleado;/*
codigo_departamento
-------------------
1                  
2                  
3                  
4                  
5 
7. Lista el nombre y apellidos de los empleados en una única columna.
*/select nombre || apellido1 || apellido2 from empleado;/*
nombre || apellido1 || apellido2
--------------------------------
AarónRiveroGómez                
AdelaSalasDíaz                  
AdolfoRubioFlores               
                                
MarcosLoyolaMéndez              
MaríaSantanaMoreno              
                                
PepeRuizSantana                 
JuanGómezLópez                  
DiegoFloresSalas                
MartaHerreraGil                 
IreneSalasFlores                
Juan AntonioSáezGuerrero 
8. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en
mayúscula.
*/select UPPER(nombre || apellido1 || apellido2) from empleado;/*
UPPER(nombre || apellido1 || apellido2)
---------------------------------------
AARóNRIVEROGóMEZ                       
ADELASALASDíAZ                         
ADOLFORUBIOFLORES                      
                                       
MARCOSLOYOLAMéNDEZ                     
MARíASANTANAMORENO                     
                                       
PEPERUIZSANTANA                        
JUANGóMEZLóPEZ                         
DIEGOFLORESSALAS                       
MARTAHERRERAGIL                        
IRENESALASFLORES                       
JUAN ANTONIOSáEZGUERRERO*/
--9. Lista el nombre y apellidos de los empleados en una única columna, convirtiendo todos los caracteres en
--minúscula.
select LOWER(nombre || apellido1 || apellido2) from empleado;
/*LOWER(nombre || apellido1 || apellido2)
---------------------------------------
aarónriverogómez                       
adelasalasdíaz                         
adolforubioflores                      
                                       
marcosloyolaméndez                     
maríasantanamoreno                     
                                       
peperuizsantana                        
juangómezlópez                         
diegofloressalas                       
martaherreragil                        
irenesalasflores                       
juan antoniosáezguerrero*/

/*10. Lista el identificador de los empleados junto al nif, pero el nif deberá aparecer en dos columnas, una
mostrará únicamente los dígitos del nif y la otra la letra.
*/select codigo,substring(nif, 0 ,8),substring(nif, 9, 1) from empleado;/*
codigo  substring(nif, 0 ,8)  substring(nif, 9, 1)
------  --------------------  --------------------
1       3248159               F                   
2       Y557563               D                   
3       R697064               B                   
4       7770554               E                   
5       1708720               C                   
6       3838298               M                   
7       8057666               X                   
8       7165143               Z                   
9       5639918               D                   
10      4638448               H                   
11      6738928               A                   
12      4123483               R                   
13      8263516               B 
11. Lista el nombre de cada departamento y el valor del presupuesto actual del que dispone. Para calcular
este dato tendrá que restar al valor del presupuesto inicial (columna presupuesto) los gastos que se
han generado (columna gastos). Tenga en cuenta que en algunos casos pueden existir valores negativos.
Utilice un alias apropiado para la nueva columna columna que está calculando.
*//*

12. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
*/select nombre,presupuesto from departamento order by presupuesto;/*
nombre            presupuesto
----------------  -----------
Proyectos         0.0        
Publicidad        0.0        
Contabilidad      110000.0   
Desarrollo        120000.0   
Sistemas          150000.0   
Recursos Humanos  280000.0   
I+D               375000.0
13. Lista el nombre de todos los departamentos ordenados de forma ascendente.
*/select nombre from departamento order by nombre;/*

nombre          
----------------
Contabilidad    
Desarrollo      
I+D             
Proyectos       
Publicidad      
Recursos Humanos
Sistemas 
14. Lista el nombre de todos los departamentos ordenados de forma desscendente.
*/select nombre from departamento order by nombre desc;/*

nombre          
----------------
Sistemas        
Recursos Humanos
Publicidad      
Proyectos       
I+D             
Desarrollo      
Contabilidad  
15. Lista los apellidos y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en
cuenta en primer lugar sus apellidos y luego su nombre.
*/select nombre,apellido1,apellido2 from empleado order by apellido1,nombre;/*

nombre        apellido1  apellido2
------------  ---------  ---------
Diego         Flores     Salas    
Juan          Gómez      López    
Marta         Herrera    Gil      
Marcos        Loyola     Méndez   
Aarón         Rivero     Gómez    
Adolfo        Rubio      Flores   
Pepe          Ruiz       Santana  
Pilar         Ruiz                
Adela         Salas      Díaz     
Irene         Salas      Flores   
María         Santana    Moreno   
Adrián        Suárez              
Juan Antonio  Sáez       Guerrero*/
--16. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
select nombre,presupuesto from departamento order by presupuesto limit 7;
/*nombre            presupuesto
----------------  -----------
Proyectos         0.0        
Publicidad        0.0        
Contabilidad      110000.0   
Desarrollo        120000.0   
Sistemas          150000.0   
Recursos Humanos  280000.0   
I+D               375000.0 */
--17. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.

select nombre,presupuesto from departamento order by presupuesto desc limit 3;
--nombre            presupuesto
------------------  -----------
--I+D               375000.0   
--Recursos Humanos  280000.0   
--Sistemas          150000.0
--18. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen mayor gasto.
select nombre,gastos from departamento order by gastos limit 2;
--nombre      gastos
------------  ------
--Proyectos   0.0   
--Publicidad  1000.0
--19. Devuelve una lista con el nombre y el gasto, de los 2 departamentos que tienen menor gasto.
select nombre,gastos from departamento order by gastos desc limit 2;
/*nombre            gastos  
----------------  --------
I+D               380000.0
Recursos Humanos  25000.0 */
--20. Devuelve una lista con 5 filas a partir de la tercera fila de la tabla empleado. La tercera fila se debe incluir
--en la respuesta. La respuesta debe incluir todas las columnas de la tabla empleado.
select * from empleado limit 2,5;
/*codigo  nif        nombre  apellido1  apellido2  codigo_departamento
------  ---------  ------  ---------  ---------  -------------------
3       R6970642B  Adolfo  Rubio      Flores     3                  
4       77705545E  Adrián  Suárez                4                  
5       17087203C  Marcos  Loyola     Méndez     5                  
6       38382980M  María   Santana    Moreno     1                  
7       80576669X  Pilar   Ruiz                  2 */
--21. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a 150000 euros.
select nombre,presupuesto from departamento where presupuesto>=150000;
--nombre            presupuesto
------------------  -----------
--Sistemas          150000.0   
--Recursos Humanos  280000.0   
--I+D               375000.0
--22. Devuelve una lista con el nombre de los departamentos y el gasto, de aquellos que tienen menos de 5000
--euros de gastos.
select nombre,gastos from departamento where gastos<=5000;
nombre        gastos
------------  ------
Contabilidad  3000.0
Proyectos     0.0   
Publicidad    1000.0
--23. Devuelve una lista con el nombre de los departamentos y el presupesto, de aquellos que tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
select nombre,presupuesto from departamento where presupuesto>=100000 and presupuesto<=200000;
nombre        presupuesto
------------  -----------
Desarrollo    120000.0   
Sistemas      150000.0   
Contabilidad  110000.0 
--24. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Sin utilizar el operador BETWEEN.
select nombre,presupuesto from departamento where presupuesto<=100000 or presupuesto>=200000;
nombre            presupuesto
----------------  -----------
Recursos Humanos  280000.0   
I+D               375000.0   
Proyectos         0.0        
Publicidad        0.0
--25. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
select nombre,presupuesto from departamento where presupuesto between 100000 and 200000;
nombre        presupuesto
------------  -----------
Desarrollo    120000.0   
Sistemas      150000.0   
Contabilidad  110000.0 
--26. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre 100000 y 200000 euros. Utilizando el operador BETWEEN.
select nombre,presupuesto from departamento where presupuesto not between 100000 and 200000;
nombre            presupuesto
----------------  -----------
Recursos Humanos  280000.0   
I+D               375000.0   
Proyectos         0.0        
Publicidad        0.0
--27. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de quellos departamentos donde los gastos sean mayores que el presupuesto del que disponen.
select nombre,gastos,presupuesto from departamento where gastos>presupuesto;
nombre      gastos    presupuesto
----------  --------  -----------
I+D         380000.0  375000.0   
Publicidad  1000.0    0.0 
--28. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean menores que el presupuesto del que disponen.
select nombre,gastos,presupuesto from departamento where gastos<presupuesto;
nombre            gastos   presupuesto
----------------  -------  -----------
Desarrollo        6000.0   120000.0   
Sistemas          21000.0  150000.0   
Recursos Humanos  25000.0  280000.0   
Contabilidad      3000.0   110000.0 
--29. Devuelve una lista con el nombre de los departamentos, gastos y presupuesto, de aquellos departamentos donde los gastos sean iguales al presupuesto del que disponen.
select nombre,gastos,presupuesto from departamento where gastos=presupuesto;
nombre     gastos  presupuesto
---------  ------  -----------
Proyectos  0.0     0.0
--30. Lista todos los datos de los empleados cuyo segundo apellido sea NULL.
select * from empleado where apellido2 is null;
codigo  nif        nombre  apellido1  apellido2  codigo_departamento
------  ---------  ------  ---------  ---------  -------------------
4       77705545E  Adrián  Suárez                4                  
7       80576669X  Pilar   Ruiz                  2
--31. Lista todos los datos de los empleados cuyo segundo apellido no sea NULL.
select * from empleado where apellido2 is not null;
codigo  nif        nombre        apellido1  apellido2  codigo_departamento
------  ---------  ------------  ---------  ---------  -------------------
1       32481596F  Aarón         Rivero     Gómez      1                  
2       Y5575632D  Adela         Salas      Díaz       2                  
3       R6970642B  Adolfo        Rubio      Flores     3                  
5       17087203C  Marcos        Loyola     Méndez     5                  
6       38382980M  María         Santana    Moreno     1                  
8       71651431Z  Pepe          Ruiz       Santana    3                  
9       56399183D  Juan          Gómez      López      2                  
10      46384486H  Diego         Flores     Salas      5                  
11      67389283A  Marta         Herrera    Gil        1                  
12      41234836R  Irene         Salas      Flores                        
13      82635162B  Juan Antonio  Sáez       Guerrero     
--32. Lista todos los datos de los empleados cuyo segundo apellido sea López.
select * from empleado where apellido2 is ("López");
codigo  nif        nombre  apellido1  apellido2  codigo_departamento
------  ---------  ------  ---------  ---------  -------------------
9       56399183D  Juan    Gómez      López      2 
--33. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Sin utilizar el operador IN.
select * from empleado where apellido2="Díaz" or apellido2="Moreno";
codigo  nif        nombre  apellido1  apellido2  codigo_departamento
------  ---------  ------  ---------  ---------  -------------------
2       Y5575632D  Adela   Salas      Díaz       2                  
6       38382980M  María   Santana    Moreno     1 
--34. Lista todos los datos de los empleados cuyo segundo apellido sea Díaz o Moreno. Utilizando el operador IN.
select * from empleado where apellido2 in ("Díaz","Moreno");
codigo  nif        nombre  apellido1  apellido2  codigo_departamento
------  ---------  ------  ---------  ---------  -------------------
2       Y5575632D  Adela   Salas      Díaz       2                  
6       38382980M  María   Santana    Moreno     1 
--35. Lista los nombres, apellidos y nif de los empleados que trabajan en el departamento 3.
select nombre,apellido1,apellido2,nif from empleado where codigo_departamento=3;
nombre  apellido1  apellido2  nif      
------  ---------  ---------  ---------
Adolfo  Rubio      Flores     R6970642B
Pepe    Ruiz       Santana    71651431Z
--36. Lista los nombres, apellidos y nif de los empleados que trabajan en los departamentos 2, 4 o 5.
select nombre,apellido1,apellido2,nif from empleado where codigo_departamento in (2,4,5);
nombre  apellido1  apellido2  nif      
------  ---------  ---------  ---------
Adela   Salas      Díaz       Y5575632D
Adrián  Suárez                77705545E
Marcos  Loyola     Méndez     17087203C
Pilar   Ruiz                  80576669X
Juan    Gómez      López      56399183D
Diego   Flores     Salas      46384486H
--## Consultas multitabla (Composición externa)
--### Resuelva todas las consultas utilizando las cláusulas LEFT JOIN y RIGHT JOIN.
--1. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
--Este listado también debe incluir los empleados que no tienen ningún departamento asociado.
select * from departamento join empleado where codigo_departamento=departamento.codigo;
codigo  nombre            presupuesto  gastos    codigo  nif        nombre  apellido1  apellido2  codigo_departamento
------  ----------------  -----------  --------  ------  ---------  ------  ---------  ---------  -------------------
1       Desarrollo        120000.0     6000.0    1       32481596F  Aarón   Rivero     Gómez      1                  
2       Sistemas          150000.0     21000.0   2       Y5575632D  Adela   Salas      Díaz       2                  
3       Recursos Humanos  280000.0     25000.0   3       R6970642B  Adolfo  Rubio      Flores     3                  
4       Contabilidad      110000.0     3000.0    4       77705545E  Adrián  Suárez                4                  
5       I+D               375000.0     380000.0  5       17087203C  Marcos  Loyola     Méndez     5                  
1       Desarrollo        120000.0     6000.0    6       38382980M  María   Santana    Moreno     1                  
2       Sistemas          150000.0     21000.0   7       80576669X  Pilar   Ruiz                  2                  
3       Recursos Humanos  280000.0     25000.0   8       71651431Z  Pepe    Ruiz       Santana    3                  
2       Sistemas          150000.0     21000.0   9       56399183D  Juan    Gómez      López      2                  
5       I+D               375000.0     380000.0  10      46384486H  Diego   Flores     Salas      5                  
1       Desarrollo        120000.0     6000.0    11      67389283A  Marta   Herrera    Gil        1  
--2. Devuelve un listado donde sólo aparezcan aquellos empleados que no tienen ningún departamento asociado.
select * from empleado left join departamento on codigo_departamento=departamento.codigo where codigo_departamento is null;
codigo  nif        nombre        apellido1  apellido2  codigo_departamento  codigo  nombre  presupuesto  gastos
------  ---------  ------------  ---------  ---------  -------------------  ------  ------  -----------  ------
12      41234836R  Irene         Salas      Flores                                                             
13      82635162B  Juan Antonio  Sáez       Guerrero 
--3. Devuelve un listado donde sólo aparezcan aquellos departamentos que no tienen ningún empleado asociado.
select * from departamento left join empleado on codigo_departamento=departamento.codigo where codigo_departamento is null;
codigo  nombre      presupuesto  gastos  codigo  nif  nombre  apellido1  apellido2  codigo_departamento
------  ----------  -----------  ------  ------  ---  ------  ---------  ---------  -------------------
6       Proyectos   0.0          0.0                                                                   
7       Publicidad  0.0          1000.0  
--4. Devuelve un listado con todos los empleados junto con los datos de los departamentos donde trabajan.
--El listado debe incluir los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.

--5. Devuelve un listado con los empleados que no tienen ningún departamento asociado y los departamentos que no tienen ningún empleado asociado. Ordene el listado alfabéticamente por el nombre del departamento.

--### Consultas resumen
--1. Calcula la suma del presupuesto de todos los departamentos.

--2. Calcula la media del presupuesto de todos los departamentos.

--3. Calcula el valor mínimo del presupuesto de todos los departamentos.

--4. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con menor

--presupuesto.

--5. Calcula el valor máximo del presupuesto de todos los departamentos.

--6. Calcula el nombre del departamento y el presupuesto que tiene asignado, del departamento con mayor presupuesto.

--7. Calcula el número total de empleados que hay en la tabla empleado.

--8. Calcula el número de empleados que no tienen NULL en su segundo apellido.

--9. Calcula el número de empleados que hay en cada departamento. Tienes que devolver dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene asignados.

--10. Calcula el nombre de los departamentos que tienen más de 2 empleados. El resultado debe tener dos columnas, una con el nombre del departamento y otra con el número de empleados que tiene asignados.

--11. Calcula el número de empleados que trabajan en cada uno de los departamentos. El resultado de esta consulta también tiene que incluir aquellos departamentos que no tienen ningún empleado asociado.

--12. Calcula el número de empleados que trabajan en cada unos de los departamentos que tienen un presupuesto mayor a 200000 euros.

--

--## Subconsultas

--

--### Con operadores básicos de comparación

--

--1. Devuelve un listado con todos los empleados que tiene el departamento de Sistemas. (Sin utilizar INNER JOIN).

--2. Devuelve el nombre del departamento con mayor presupuesto y la cantidad que tiene asignada.

--3. Devuelve el nombre del departamento con menor presupuesto y la cantidad que tiene asignada.

--

--### Subconsultas con IN y NOT IN

--

--4. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando IN o NOT IN).

--5. Devuelve los nombres de los departamentos que no tienen empleados asociados. (Utilizando IN o NOT IN).

--

--### Subconsultas con EXISTS y NOT EXISTS

--

--6. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).

--7. Devuelve los nombres de los departamentos que tienen empleados asociados. (Utilizando EXISTS o NOT EXISTS).

--*/