

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

CONSULTAS:
  
