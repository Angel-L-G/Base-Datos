--Create table
create table cientifico_proyecto(
   ...> ref_cientifico text references cientifico(id),
   ...> ref_proyecto text references proyecto(id),
   ...> primary key (ref_cientifico,ref_proyecto));
create table cientifico(
    id text primary KEY,
    nombre text,
    apellido1 text,
    apellido2 text);
create table proyecto(
    id text primary KEY,
    nombre text,
    horas int);

--Insert
insert into cientifico values("1","juan","Luis","Luis");
insert into cientifico values("2","angel","gonzlaez","Luis");
insert into cientifico values("3","alicia","Luis","gonzlaez");
insert into cientifico values("4","ana","García","García");
insert into cientifico values("5","eva","García","gonzlaez");

insert into cientifico values("6","pedro","García","Luis");
insert into cientifico values("7","manuel","Luis","gonzlaez");
insert into cientifico values("8","Godofredo","gonzlaez","gonzlaez");
insert into cientifico values("9","Eustaquio","García","Luis");
insert into cientifico values("10","Maria","Luis","minguillon");

insert into proyecto values("A","Jorge",123);
insert into proyecto values("B","Pato",190);
insert into proyecto values("C","Rino",96);
insert into proyecto values("D","Lana",209);
insert into proyecto values("E","Ñu",24);

--consultas
