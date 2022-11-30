# Tarea 6
## Pedidos

| Id_orden | Fecha | Id_cliente | Nom_cliente	| Ciudad | Num_art | nom_art | cant | Precio |
| -------- | ----- | ---------- | ----------- | ------ | ------- | ------- | ---- | ------ |
| 2301 | 23/11/22 	| 101 	| Martin 	| S/C Tenerife 	| 3786 	| Red 	| 3 	| 35,00 | 
| 2301 | 23/11/22 	| 101 	| Martin 	| S/C Tenerife 	| 4011 	| Raqueta 	| 6 	| 65,00 | 
| 2301 | 23/11/22 	| 101 	| Martin 	| S/C Tenerife 	| 9132 	| Paq-3 	| 8 	| 4,75 | 
| 2302 | 25/11/22 	| 107 	| Herman 	| Las Palmas de Gran Canaria 	| 5794 	| Paq-6 	| 4 	| 5,00 | 
| 2303 | 27/11/22	| 110 	| Pedro 	| San Cristobal de la Laguna 	| 4011 	| Raqueta 	| 2 	| 65,00 | 
| 2303 | 27/11/22 	| 110 	| Pedro 	| San Cristobal de la Laguna 	| 3141 	| Funda 	| 2 	| 10,00 | 

### Paso 1-2:
Si cumple la 1FN ( primera fomorma normal ) ya que no tiene valores multivaluados y todos los valores son atomicos.

### Paso 3-4:
No cumple la segunda forma normal ya que no todas las propiedades tienen relacion con la clave primaria.

**Articulo**
| *Num_art* | nom_art | cant | Precio |
| --------- | ------- | ---- | ------ |
| 3786 | Red | 3 | 35,00 |
| 4011 | Raqueta | 6 | 65,00 |
| 9132 | Paq-3 | 8 | 4,75 |
| 5794 | Paq-6 | 4 | 5,00 |
| 4011 | Raqueta | 2 | 65,00 |
| 3141 | Funda | 2 | 10,00 |

**Relacion Contiene** ( entre Orden y Articulo )


**Orden**
| *Id_Orden* | Fecha |
| ---------- | ----- |
| 2301 | 23/11/22 |
| 2301 | 23/11/22 |
| 2301 | 23/11/22 |
| 2302 | 25/11/22 |
| 2303 | 27/11/22 |
| 2303 | 27/11/22 |


**Cliente**
| *Id_Cliente* | Nom_Cliente | Ciudad |
| ------------ | ----------- | ------ |
| 101 | Martin | S/C Tenerife |
| 101 | Martin | S/C Tenerife |
| 101 | Martin | S/C Tenerife |
| 107 | Herman | Las Palmas de Gran Canaria |
| 110 | Pedro | San Cristobal de la Laguna |
| 110 | Pedro | San Cristobal de la Laguna |


