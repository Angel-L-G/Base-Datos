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
  ### La cardinalidad seria 1:N
  **Empleado**
  | *NSS* | Nombre | Puesto | Salario |
  | ----- | ------ | ------ | ------- |
  | 111 | pepe | jefe Area | 3000 |
  | 222 | josu | Admtivo | 1500 |
  | 333 | miren | Admtivo | 1500 |
  
  **Emails**
  | NSS | Emails |
  | --- | ------ |
  | 111 | osep@ecn.es |
  | 111 | jefez@gmail.com |
  | 222 | jsanchez@ecn.es |
  | 333 | mlopez@ecn.es |
  | 333 | miren@gmail.com |

### Paso 4:
  Comprobar si se cumple la 2ª Forma Normal.
No cumple la segunda forma normal ya que podemos sacar las columnas de puesto y salario a una tabla extra que se llame trabajo.

### Paso 5:
  Normalizar si no se cumple el apartado 4.
  
   **Trabajo**
  | NSS | *Puesto* | Salario |
  | --- | -------- | ------- |
  | 111 | jefe Area | 3000 |
  | 222 | Admtivo | 1500 |
  | 333 | Admtiva | 1500 |
    
   **Empleado**
  | *NSS* | Nombre |
  | ----- | ------ |
  | 111 | pepe |
  | 222 | josu |
  | 333 | miren |
  
  **Emails**
  | NSS | *Emails* |
  | --- | -------- |
  | 111 | osep@ecn.es |
  | 111 | jefez@gmail.com |
  | 222 | jsanchez@ecn.es |
  | 333 | mlopez@ecn.es |
  | 333 | miren@gmail.com | 
  
### Paso 6:
  Comprobar si se cumple la 3ª Forma Normal.
  Las tablas generadas si cumplen la 3ª forma normal ya que no hay transitividad.
  
### Paso 7:
  Normalizar si no se cumple el apartado 5.

### Paso 8:
  Indicar claves candidatas de todas las tablas resultantes.
    Las claves candidatas Serian 
        -NSS
        -Emails
        -Puesto
        
### Paso 9:
  Genera el diagrama E/R resultante.
