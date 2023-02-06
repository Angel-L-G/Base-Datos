--Create Table
create table pieza (
	id int,
	nombre TEXT,
	primary key (id)
);

create table proveedor (
	id TEXT,
	nombre TEXT,
	primary KEY (id)
);

create table suministrador (
	ref_pieza_codigo int references pieza(id),
	ref_proveedor text references proveedor(id),
	precio int
);
--Insert 
insert into pieza VALUES("1","tornillo");
insert into pieza VALUES("2","tuerca");
insert into pieza VALUES("3","motor");
insert into pieza VALUES("4","rotor");
insert into pieza VALUES("5","estructura modular");

insert into pieza VALUES("10","vidones");
insert into pieza VALUES("6","viga");
insert into pieza VALUES("7","acero");
insert into pieza VALUES("8","radar");
insert into pieza VALUES("9","sonar");

insert into proveedor values("HAl","123.net");
insert into proveedor values("TNBC","SkeHington Supplies");
insert into proveedor values("RBT","Susan Calvin Corp");
insert into proveedor values("ABC","OXO");
insert into proveedor values("PNG","PuesNo");

insert into suministrador values("1","HAl","0.98");
insert into suministrador values("2","HAl","2.44");
insert into suministrador values("3","RBT","2.42");
insert into suministrador values("4","TNBC","2.54");
insert into suministrador values("5","TNBC","6.44");

insert into suministrador values("6","RBT","2.74");
insert into suministrador values("7","ABC","1.41");
insert into suministrador values("8","ABC","7.59");
insert into suministrador values("9","PNG","9.21");
insert into suministrador values("10","PNG","6.38");

--Consultas
    --Obtener los nombres de todas las piezas.
select nombre from pieza;
    --Obtener todos los datos de todos los proveedores.
select * from proveedor;
    --Obtener el precio medio al que se nos suministran las piezas.
select avg(precio) from suministrador;
    --Obtener los nombres de los proveedores que suministran la pieza 1.

    --Obtener los nombres de las piezas suministradas por el proveedor cuyo código es HAL.

    --Obtener los nombres de los proveedores que suministran las piezas más caras, indicando el nombre de la pieza y el precio al que la suministran.

    --Hacer constar en la base de datos que la empresa SkeHington Supplies (codigo TNBC) va a empezar a suministrarnos los elementos piezas con código 1 a 10 € cada tuerca.

    --Aumentar los precios en una unidad.

    --Hacer constar en la base de datos que la empresa Susan Calvin Corp.(RBT) no va a suministrarnos ninguna pieza (aunque la empresa en si va a seguir constando en nuestra base de datos).

    --Hacer constar en la base de datos que la empresa Susan Calvin Corp. (RBT) ya no va a suministrarnos clavos (código 4).

