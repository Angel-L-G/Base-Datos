# Tarea 1
## Gestión de Aeropuertos
Se ha creado una base de datos con los datos de ciudades y sus aeropuertos. Los campos y los tipos de datos son los que se indican a continuación:

    Ciudad: Nombre de la ciudad (único).
    HabCiudad_M: número de habitantes de la ciudad en millones.
    País: País en el que se encuentra la ciudad.
    HabPais_M: Número de habitantes del país en millones.
    PerteneceUE: campo booleano. TRUE si el país Pertenece a la Unión Europea; FALSE, no pertenece a la Unión Europea.
    codigoAeropuerto: único.
    NombreAeropuerto: único.
    Distancia_km: distancia del aeropuerto a la ciudad en km.
    
### Paso 1: 
  codAeropuerto
  NombreAeropuerto
  Ciudad

### Paso 2:
  La 1FN no se cumple ya que los campos codAeropuerto, NombreAeropuerto y Distancia_km 
  
### Paso 3:
  Normalizar
  | codAeropuerto | NombreAeropuerto | Distancia_km |
  | ------------- | ---------------- | ------------ |
  | MAD | Barajas | 13 |
  | CDG | Roissy De Gaulle | 23 |
  | ORY | Orly | 16 |
  | LHT | Heathrow | 28 |
  | LTN | Luto | 48 |
  | BEG | nikola Tesla | 12 |
  | VIE | Schwechat | 18 |
