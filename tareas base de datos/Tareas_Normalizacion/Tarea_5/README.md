# Tarea 5
## Editorial
    Tenemos una biblioteca que tiene como objetivo la gestión de la información de sus libros y lectores.
    La representación de la información dentro de la BBDD es la siguiente:
    
| *CodLibro* | Titulo | Autor | Editorial | NombreLector | FechaDev |
| -------- | ------ | ----- | --------- | ------------ | -------- |
| 1001 | Variable compleja | Murray Spiegel | McGraw Hill | Pérez Gómez, Juan | 15/04/2022 |
| 1004 | Visual Basic 5 | E. Petroustsos | Anaya | Ríos Terán, Ana | 17/04/2022 |
| 1005 | Estadística | Murray Spiegel | McGraw Hill | Roca, René | 17/04/2022 |
| 1006 | Oracle University | Nancy Greenberg y Priya Nathan | Oracle Corp. | García Roque, Luis | 17/04/2022 |
| 1007 | Clipper 5.01 | Ramalho | McGraw Hill | Pérez Gómez, Juan | 18/04/2022 |

### 1FN:
Comprobar si se cumple la 1ª Forma Normal.
Normalizar si no se cumple el apartado 2.

**Libro**
| *CodLibro* | Titulo | Autor | Editorial | FechaDev |
| -------- | ------ | ----- | --------- | -------- |
| 1001 | Variable compleja | Murray Spiegel | McGraw Hill | 15/04/2022 |
| 1004 | Visual Basic 5 | E. Petroustsos | Anaya | 17/04/2022 |
| 1005 | Estadística | Murray Spiegel | McGraw Hill| 16/04/2022 |
| 1006 | Oracle University | Nancy Greenberg y Priya Nathan | Oracle Corp. | 20/04/2022 |
| 1007 | Clipper 5.01 | Ramalho | McGraw Hill | 18/04/2022 |

**Lecor**
| Cod_Libro | Nombre | Apellido |
| --------- | ------ | -------- |
| 1001 | Juan | Pérez Gómez |
| 1004 | Ana  | Ríos Terán |
| 1005 | René | Roca |
| 1006 | Luis  | García Roque |
| 1007 | Juan | Pérez Gómez |

### Paso 2FN:
Comprobar si se cumple la 2ª Forma Normal.
Normalizar si no se cumple el apartado 4.

**Libro**
| *CodLibro* | Titulo | Autor | Editorial |
| -------- | ------ | ----- | --------- |
| 1001 | Variable compleja | Murray Spiegel | McGraw Hill |
| 1004 | Visual Basic 5 | E. Petroustsos | Anaya |
| 1005 | Estadística | Murray Spiegel | McGraw Hill|
| 1006 | Oracle University | Nancy Greenberg y Priya Nathan | Oracle Corp. |
| 1007 | Clipper 5.01 | Ramalho | McGraw Hill |

**Lecor**
| Cod_Libro | Nombre | Apellido |
| --------- | ------ | -------- |
| 1001 | Juan | Pérez Gómez |
| 1004 | Ana  | Ríos Terán |
| 1005 | René | Roca |
| 1006 | Luis  | García Roque |
| 1007 | Juan | Pérez Gómez |

**Devolucion**
| Cod_Libro | FechaDev |
| --------- | ------ |
| 1001 | 15/04/2022 |
| 1004 | 17/04/2022 |
| 1005 | 16/04/2022 |
| 1006 | 20/04/2022  |
| 1007 | 18/04/2022 |

### 3FN:
Comprobar si se cumple la 3ª Forma Normal.
Normalizar si no se cumple el apartado 5.

**Lecor**
| Cod_Libro | Nombre | Apellido | *id_Persona* | FechaDev |
| --------- | ------ | -------- | ------------ | ------ |
| 1001 | Juan | Pérez Gómez | 1 | 15/04/2022 |
| 1004 | Ana  | Ríos Terán | 2 | 17/04/2022 |
| 1005 | René | Roca | 3 |  16/04/2022 |
| 1006 | Luis  | García Roque | 4 | 20/04/2022 |
| 1007 | Juan | Pérez Gómez | 5 | 18/04/2022 |

**Libro**
| *CodLibro* | id_Autor | Titulo |
| ---------- | -------- | ------ |
| 1001 | A | Variable compleja |
| 1004 | B | Visual Basic 5 |
| 1005 | C | Estadística |
| 1006 | D | Oracle University |
| 1006 | E | Oracle University |
| 1007 | F | Clipper 5.01 |

**Autor**
| *id_Autor* | CodLibro | Autor |
| -------- | -------- | ----- |
| A | 1001 | Murray Spiegel |
| B | 1004 | E. Petroustsos |
| C | 1005 | Murray Spiegel |
| D | 1006 | Nancy Greenberg |
| E | 1006 | Priya Nathan |
| F | 1007 | Ramalho |

**Relacion Autor_Editorial**
| *CodLibro* | *Editorial* |
| -------- | --------- |
| 1001 | McGraw Hill |
| 1004 | Anaya |
| 1005 | McGraw Hill|
| 1006 | Oracle Corp. |
| 1007 | McGraw Hill |

**Editorial**
| *Editorial* |
| ----------- |
| McGraw Hill |
| Anaya |
| McGraw Hill|
| Oracle Corp. |
| McGraw Hill |

### Paso 7-8:
Indicar claves de todas las tablas resultantes.
Genera el diagrama E/R resultante.
