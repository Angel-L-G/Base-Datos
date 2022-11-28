# Tarea 4
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

### Paso 1-2:
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

### Paso 3-4:
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

### Paso 5-6:
Comprobar si se cumple la 3ª Forma Normal.
Normalizar si no se cumple el apartado 5.

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
| 1006 | 20/04/2022 |
| 1007 | 18/04/2022 |

**Titulo**
| CodLibro | Titulo | Autor |
| -------- | ------ | ----- |
| 1001 | Variable compleja | Murray Spiegel |
| 1004 | Visual Basic 5 | E. Petroustsos |
| 1005 | Estadística | Murray Spiegel |
| 1006 | Oracle University | Nancy Greenberg y Priya Nathan |
| 1007 | Clipper 5.01 | Ramalho |

**Autor**
| Autor | Editorial |
| ----- | --------- |
| Murray Spiegel | McGraw Hill |
| E. Petroustsos | Anaya |
| Murray Spiegel | McGraw Hill|
| Nancy Greenberg y Priya Nathan | Oracle Corp. |
| Ramalho | McGraw Hill |

**Editorial**
| Autor | Editorial |
| ----- | --------- |
| Murray Spiegel | McGraw Hill |
| E. Petroustsos | Anaya |
| Murray Spiegel | McGraw Hill|
| Nancy Greenberg y Priya Nathan | Oracle Corp. |
| Ramalho | McGraw Hill |

### Paso 7-8:
Indicar claves de todas las tablas resultantes.
Genera el diagrama E/R resultante.
