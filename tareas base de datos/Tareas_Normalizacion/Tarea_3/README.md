# Tarea 3
## Gestión de INEM
Tenemos una empresa publica donde los puestos de trabajo, están regulados por el estado, de modo que las condiciones salariales están determinadas   por el puesto de trabajo, se ha creado el siguiente esquema relacional: (con el _número de la seguridad social NSS como clave primaria) La representación de la    información dentro de la BBDD es la siguiente:
    
### Paso 1: 
   Las claves candidatas son: 
    -NSS

### Paso 2:
  La 1FN no se cumple ya que el campo Email contiene varios valores.
  | *NSS* | Nombre | Puesto | Salario | Emails |
  | ----- | ------ | ------ | ------- | ------ |
  | 111 | Pepe | jefe Area | 3000 | josep@ecn.es / jefez@gmail.com |
  | 222 | Josu | Admtivo | 1500 | jsanchez@ecn.es |
  | 333 | Miren | Admtivo | 1500 | mlopez@ecn.es / miren@gmail.com |

### Paso 3:
  **Empleado**
  | *NSS* | Nombre | Puesto | Salario |
  | ----- | ------ | ------ | ------- |
  | 111 | pepe | España | 45 |
  | 222 | josu | francia | 66 |
  | 333 | miren | Gran Bretaña | 60 |
  
  **Emails**
  | NSS | Emails |
  | --- | ------ |
  | 111 | osep@ecn.es |
  | 111 | jefez@gmail.com |
  | 222 | jsanchez@ecn.es |
  | 333 | mlopez@ecn.es |
  | 333 | miren@gmail.com |

### Paso 4:
  
    
### Paso 5:

### Paso 6:

### Paso 7:

### Paso 8:

### Paso 9:
