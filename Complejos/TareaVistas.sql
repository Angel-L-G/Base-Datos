--Leer Base de Datos

source /home/osboxes/Desktop/sakila-db/sakila-schema.sql;

source /home/osboxes/Desktop/sakila-db/sakila-data.sql;

use sakila
Database changed

select count(*) from film;
/*+----------+
| count(*) |
+----------+
|     1000 |
+----------+*/

select count(*) from film_text;
/*+----------+
| count(*) |
+----------+
|     1000 |
+----------+*/

--Consultas
    --Actores que tienen de primer nombre Scarlett.
        select * from actor where first_name regexp "Scarlett";
        /*+----------+------------+-----------+---------------------+
        | actor_id | first_name | last_name | last_update         |
        +----------+------------+-----------+---------------------+
        |       81 | SCARLETT   | DAMON     | 2006-02-15 04:34:33 |
        |      124 | SCARLETT   | BENING    | 2006-02-15 04:34:33 |
        +----------+------------+-----------+---------------------+
        */
    --Actores que tienen de apellido Johansson.
        select * from actor where last_name regexp "Johansson";
        +----------+------------+-----------+---------------------+
        | actor_id | first_name | last_name | last_update         |
        +----------+------------+-----------+---------------------+
        |        8 | MATTHEW    | JOHANSSON | 2006-02-15 04:34:33 |
        |       64 | RAY        | JOHANSSON | 2006-02-15 04:34:33 |
        |      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
        +----------+------------+-----------+---------------------+
    --Actores que contengan una O en su nombre.
        select * from actor where first_name regexp "o";
        /*+----------+-------------+--------------+---------------------+
        | actor_id | first_name  | last_name    | last_update         |
        +----------+-------------+--------------+---------------------+
        |        1 | PENELOPE    | GUINESS      | 2006-02-15 04:34:33 |
        |        5 | JOHNNY      | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
        |        9 | JOE         | SWANK        | 2006-02-15 04:34:33 |
        |       11 | ZERO        | CAGE         | 2006-02-15 04:34:33 |
        |       19 | BOB         | FAWCETT      | 2006-02-15 04:34:33 |
        |       24 | CAMERON     | STREEP       | 2006-02-15 04:34:33 |
        |       28 | WOODY       | HOFFMAN      | 2006-02-15 04:34:33 |
        |       38 | TOM         | MCKELLEN     | 2006-02-15 04:34:33 |
        |       39 | GOLDIE      | BRODY        | 2006-02-15 04:34:33 |
        |       40 | JOHNNY      | CAGE         | 2006-02-15 04:34:33 |
        |       41 | JODIE       | DEGENERES    | 2006-02-15 04:34:33 |
        |       42 | TOM         | MIRANDA      | 2006-02-15 04:34:33 |
        |       54 | PENELOPE    | PINKETT      | 2006-02-15 04:34:33 |
        |       63 | CAMERON     | WRAY         | 2006-02-15 04:34:33 |
        |       78 | GROUCHO     | SINATRA      | 2006-02-15 04:34:33 |
        |       82 | WOODY       | JOLIE        | 2006-02-15 04:34:33 |
        |       91 | CHRISTOPHER | BERRY        | 2006-02-15 04:34:33 |
        |      104 | PENELOPE    | CRONYN       | 2006-02-15 04:34:33 |
        |      106 | GROUCHO     | DUNST        | 2006-02-15 04:34:33 |
        |      111 | CAMERON     | ZELLWEGER    | 2006-02-15 04:34:33 |
        |      113 | MORGAN      | HOPKINS      | 2006-02-15 04:34:33 |
        |      114 | MORGAN      | MCDORMAND    | 2006-02-15 04:34:33 |
        |      115 | HARRISON    | BALE         | 2006-02-15 04:34:33 |
        |      120 | PENELOPE    | MONROE       | 2006-02-15 04:34:33 |
        |      137 | MORGAN      | WILLIAMS     | 2006-02-15 04:34:33 |
        |      140 | WHOOPI      | HURT         | 2006-02-15 04:34:33 |
        |      151 | GEOFFREY    | HESTON       | 2006-02-15 04:34:33 |
        |      162 | OPRAH       | KILMER       | 2006-02-15 04:34:33 |
        |      163 | CHRISTOPHER | WEST         | 2006-02-15 04:34:33 |
        |      171 | OLYMPIA     | PFEIFFER     | 2006-02-15 04:34:33 |
        |      172 | GROUCHO     | WILLIAMS     | 2006-02-15 04:34:33 |
        |      176 | JON         | CHASE        | 2006-02-15 04:34:33 |
        |      188 | ROCK        | DUKAKIS      | 2006-02-15 04:34:33 |
        |      191 | GREGORY     | GOODING      | 2006-02-15 04:34:33 |
        |      192 | JOHN        | SUVARI       | 2006-02-15 04:34:33 |
        |      200 | THORA       | TEMPLE       | 2006-02-15 04:34:33 |
        +----------+-------------+--------------+---------------------+
        */
    --Actores que contengan una O en su nombre y en una A en su apellido.
        select * from actor where first_name regexp "o" and last_name regexp "a";
        /*+----------+------------+--------------+---------------------+
        | actor_id | first_name | last_name    | last_update         |
        +----------+------------+--------------+---------------------+
        |        5 | JOHNNY     | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
        |        9 | JOE        | SWANK        | 2006-02-15 04:34:33 |
        |       11 | ZERO       | CAGE         | 2006-02-15 04:34:33 |
        |       19 | BOB        | FAWCETT      | 2006-02-15 04:34:33 |
        |       28 | WOODY      | HOFFMAN      | 2006-02-15 04:34:33 |
        |       40 | JOHNNY     | CAGE         | 2006-02-15 04:34:33 |
        |       42 | TOM        | MIRANDA      | 2006-02-15 04:34:33 |
        |       63 | CAMERON    | WRAY         | 2006-02-15 04:34:33 |
        |       78 | GROUCHO    | SINATRA      | 2006-02-15 04:34:33 |
        |      114 | MORGAN     | MCDORMAND    | 2006-02-15 04:34:33 |
        |      115 | HARRISON   | BALE         | 2006-02-15 04:34:33 |
        |      137 | MORGAN     | WILLIAMS     | 2006-02-15 04:34:33 |
        |      172 | GROUCHO    | WILLIAMS     | 2006-02-15 04:34:33 |
        |      176 | JON        | CHASE        | 2006-02-15 04:34:33 |
        |      188 | ROCK       | DUKAKIS      | 2006-02-15 04:34:33 |
        |      192 | JOHN       | SUVARI       | 2006-02-15 04:34:33 |
        +----------+------------+--------------+---------------------+
        */
    --Actores que contengan dos O en su nombre y en una A en su apellido.
        select * from actor where first_name regexp "o{2}" and last_name regexp "a";
        /*+----------+------------+-----------+---------------------+
        | actor_id | first_name | last_name | last_update         |
        +----------+------------+-----------+---------------------+
        |       28 | WOODY      | HOFFMAN   | 2006-02-15 04:34:33 |
        +----------+------------+-----------+---------------------+
        */
    --Actores donde su tercera letra sea B.
        select * from actor where first_name regexp ".{3}b.*";
        /*+----------+------------+-----------+---------------------+
        | actor_id | first_name | last_name | last_update         |
        +----------+------------+-----------+---------------------+
        |      182 | DEBBIE     | AKROYD    | 2006-02-15 04:34:33 |
        +----------+------------+-----------+---------------------+
        */
    --Ciudades que empiezan por a.
        select * from city where city regexp "^a";
        /*+---------+-------------------------+------------+---------------------+
        | city_id | city                    | country_id | last_update         |
        +---------+-------------------------+------------+---------------------+
        |       1 | A Coruña (La Coruña)    |         87 | 2006-02-15 04:45:25 |
        |       2 | Abha                    |         82 | 2006-02-15 04:45:25 |
        |       3 | Abu Dhabi               |        101 | 2006-02-15 04:45:25 |
        |       4 | Acuña                   |         60 | 2006-02-15 04:45:25 |
        |       5 | Adana                   |         97 | 2006-02-15 04:45:25 |
        |       6 | Addis Abeba             |         31 | 2006-02-15 04:45:25 |
        |       7 | Aden                    |        107 | 2006-02-15 04:45:25 |
        |       8 | Adoni                   |         44 | 2006-02-15 04:45:25 |
        |       9 | Ahmadnagar              |         44 | 2006-02-15 04:45:25 |
        |      10 | Akishima                |         50 | 2006-02-15 04:45:25 |
        |      11 | Akron                   |        103 | 2006-02-15 04:45:25 |
        |      12 | al-Ayn                  |        101 | 2006-02-15 04:45:25 |
        |      13 | al-Hawiya               |         82 | 2006-02-15 04:45:25 |
        |      14 | al-Manama               |         11 | 2006-02-15 04:45:25 |
        |      15 | al-Qadarif              |         89 | 2006-02-15 04:45:25 |
        |      16 | al-Qatif                |         82 | 2006-02-15 04:45:25 |
        |      17 | Alessandria             |         49 | 2006-02-15 04:45:25 |
        |      18 | Allappuzha (Alleppey)   |         44 | 2006-02-15 04:45:25 |
        |      19 | Allende                 |         60 | 2006-02-15 04:45:25 |
        |      20 | Almirante Brown         |          6 | 2006-02-15 04:45:25 |
        |      21 | Alvorada                |         15 | 2006-02-15 04:45:25 |
        |      22 | Ambattur                |         44 | 2006-02-15 04:45:25 |
        |      23 | Amersfoort              |         67 | 2006-02-15 04:45:25 |
        |      24 | Amroha                  |         44 | 2006-02-15 04:45:25 |
        |      25 | Angra dos Reis          |         15 | 2006-02-15 04:45:25 |
        |      26 | Anápolis                |         15 | 2006-02-15 04:45:25 |
        |      27 | Antofagasta             |         22 | 2006-02-15 04:45:25 |
        |      28 | Aparecida de Goiânia    |         15 | 2006-02-15 04:45:25 |
        |      29 | Apeldoorn               |         67 | 2006-02-15 04:45:25 |
        |      30 | Araçatuba               |         15 | 2006-02-15 04:45:25 |
        |      31 | Arak                    |         46 | 2006-02-15 04:45:25 |
        |      32 | Arecibo                 |         77 | 2006-02-15 04:45:25 |
        |      33 | Arlington               |        103 | 2006-02-15 04:45:25 |
        |      34 | Ashdod                  |         48 | 2006-02-15 04:45:25 |
        |      35 | Ashgabat                |         98 | 2006-02-15 04:45:25 |
        |      36 | Ashqelon                |         48 | 2006-02-15 04:45:25 |
        |      37 | Asunción                |         73 | 2006-02-15 04:45:25 |
        |      38 | Athenai                 |         39 | 2006-02-15 04:45:25 |
        |      39 | Atšinsk                 |         80 | 2006-02-15 04:45:25 |
        |      40 | Atlixco                 |         60 | 2006-02-15 04:45:25 |
        |      41 | Augusta-Richmond County |        103 | 2006-02-15 04:45:25 |
        |      42 | Aurora                  |        103 | 2006-02-15 04:45:25 |
        |      43 | Avellaneda              |          6 | 2006-02-15 04:45:25 |
        +---------+-------------------------+------------+---------------------+
*/
    --Ciudades que acaban por s.
        select * from city where city regexp "s$";
        /*+---------+----------------------------+------------+---------------------+
        | city_id | city                       | country_id | last_update         |
        +---------+----------------------------+------------+---------------------+
        |      25 | Angra dos Reis             |         15 | 2006-02-15 04:45:25 |
        |      26 | Anápolis                   |         15 | 2006-02-15 04:45:25 |
        |      79 | Bilbays                    |         29 | 2006-02-15 04:45:25 |
        |     102 | Caracas                    |        104 | 2006-02-15 04:45:25 |
        |     118 | Ciomas                     |         45 | 2006-02-15 04:45:25 |
        |     120 | Citrus Heights             |        103 | 2006-02-15 04:45:25 |
        |     125 | Coatzacoalcos              |         60 | 2006-02-15 04:45:25 |
        |     135 | Dallas                     |        103 | 2006-02-15 04:45:25 |
        |     137 | Daugavpils                 |         54 | 2006-02-15 04:45:25 |
        |     147 | Dos Quebradas              |         24 | 2006-02-15 04:45:25 |
        |     190 | Águas Lindas de Goiás      |         15 | 2006-02-15 04:45:25 |
        |     212 | Huejutla de Reyes          |         60 | 2006-02-15 04:45:25 |
        |     221 | Imus                       |         75 | 2006-02-15 04:45:25 |
        |     238 | Jelets                     |         80 | 2006-02-15 04:45:25 |
        |     266 | Kilis                      |         97 | 2006-02-15 04:45:25 |
        |     297 | Le Mans                    |         34 | 2006-02-15 04:45:25 |
        |     330 | Matamoros                  |         60 | 2006-02-15 04:45:25 |
        |     333 | Memphis                    |        103 | 2006-02-15 04:45:25 |
        |     391 | Ozamis                     |         75 | 2006-02-15 04:45:25 |
        |     401 | Patras                     |         39 | 2006-02-15 04:45:25 |
        |     413 | Poços de Caldas            |         15 | 2006-02-15 04:45:25 |
        |     424 | Quilmes                    |          6 | 2006-02-15 04:45:25 |
        |     441 | Saint Louis                |        103 | 2006-02-15 04:45:25 |
        |     442 | Saint-Denis                |         79 | 2006-02-15 04:45:25 |
        |     446 | Salinas                    |        103 | 2006-02-15 04:45:25 |
        |     460 | Santiago de los Caballeros |         27 | 2006-02-15 04:45:25 |
        |     482 | Sivas                      |         97 | 2006-02-15 04:45:25 |
        |     497 | Springs                    |         85 | 2006-02-15 04:45:25 |
        |     499 | Sterling Heights           |        103 | 2006-02-15 04:45:25 |
        |     529 | Tarsus                     |         97 | 2006-02-15 04:45:25 |
        |     570 | Vilnius                    |         56 | 2006-02-15 04:45:25 |
        +---------+----------------------------+------------+---------------------+
        */
    --Ciudades del country 61.
        select * from city where country_id=61;
        /*+---------+----------+------------+---------------------+
        | city_id | city     | country_id | last_update         |
        +---------+----------+------------+---------------------+
        |     115 | Chisinau |         61 | 2006-02-15 04:45:25 |
        +---------+----------+------------+---------------------+
        */
    --Ciudades del country Spain.
        select c.* from city as c,country as co where c.country_id=co.country_id and co.country = "spain";
        /*+---------+-------------------------+------------+---------------------+
        | city_id | city                    | country_id | last_update         |
        +---------+-------------------------+------------+---------------------+
        |       1 | A Coruña (La Coruña)    |         87 | 2006-02-15 04:45:25 |
        |     146 | Donostia-San Sebastián  |         87 | 2006-02-15 04:45:25 |
        |     181 | Gijón                   |         87 | 2006-02-15 04:45:25 |
        |     388 | Ourense (Orense)        |         87 | 2006-02-15 04:45:25 |
        |     459 | Santiago de Compostela  |         87 | 2006-02-15 04:45:25 |
        +---------+-------------------------+------------+---------------------+
        */
    --Ciudades con nombres compuestos.
        select * from city where city regexp " ";
        /*+---------+----------------------------+------------+---------------------+
        | city_id | city                       | country_id | last_update         |
        +---------+----------------------------+------------+---------------------+
        |       1 | A Coruña (La Coruña)       |         87 | 2006-02-15 04:45:25 |
        |       3 | Abu Dhabi                  |        101 | 2006-02-15 04:45:25 |
        |       6 | Addis Abeba                |         31 | 2006-02-15 04:45:25 |
        |      18 | Allappuzha (Alleppey)      |         44 | 2006-02-15 04:45:25 |
        |      20 | Almirante Brown            |          6 | 2006-02-15 04:45:25 |
        |      25 | Angra dos Reis             |         15 | 2006-02-15 04:45:25 |
        |      28 | Aparecida de Goiânia       |         15 | 2006-02-15 04:45:25 |
        |      41 | Augusta-Richmond County    |        103 | 2006-02-15 04:45:25 |
        |      45 | Bahía Blanca               |          6 | 2006-02-15 04:45:25 |
        |      53 | Bandar Seri Begawan        |         16 | 2006-02-15 04:45:25 |
        |      57 | Bat Yam                    |         48 | 2006-02-15 04:45:25 |
        |      69 | Benin City                 |         69 | 2006-02-15 04:45:25 |
        |      71 | Berhampore (Baharampur)    |         44 | 2006-02-15 04:45:25 |
        |      84 | Boa Vista                  |         15 | 2006-02-15 04:45:25 |
        |     100 | Cam Ranh                   |        105 | 2006-02-15 04:45:25 |
        |     101 | Cape Coral                 |        103 | 2006-02-15 04:45:25 |
        |     111 | Charlotte Amalie           |        106 | 2006-02-15 04:45:25 |
        |     120 | Citrus Heights             |        103 | 2006-02-15 04:45:25 |
        |     121 | Città del Vaticano         |         41 | 2006-02-15 04:45:25 |
        |     122 | Ciudad del Este            |         73 | 2006-02-15 04:45:25 |
        |     124 | Coacalco de Berriozábal    |         60 | 2006-02-15 04:45:25 |
        |     141 | Deba Habe                  |         69 | 2006-02-15 04:45:25 |
        |     144 | Dhule (Dhulia)             |         44 | 2006-02-15 04:45:25 |
        |     146 | Donostia-San Sebastián     |         87 | 2006-02-15 04:45:25 |
        |     147 | Dos Quebradas              |         24 | 2006-02-15 04:45:25 |
        |     153 | El Alto                    |         14 | 2006-02-15 04:45:25 |
        |     154 | El Fuerte                  |         60 | 2006-02-15 04:45:25 |
        |     155 | El Monte                   |        103 | 2006-02-15 04:45:25 |
        |     177 | Garden Grove               |        103 | 2006-02-15 04:45:25 |
        |     185 | Grand Prairie              |        103 | 2006-02-15 04:45:25 |
        |     190 | Águas Lindas de Goiás      |         15 | 2006-02-15 04:45:25 |
        |     212 | Huejutla de Reyes          |         60 | 2006-02-15 04:45:25 |
        |     233 | Jalib al-Shuyukh           |         53 | 2006-02-15 04:45:25 |
        |     246 | José Azueta                |         60 | 2006-02-15 04:45:25 |
        |     247 | Juazeiro do Norte          |         15 | 2006-02-15 04:45:25 |
        |     248 | Juiz de Fora               |         15 | 2006-02-15 04:45:25 |
        |     262 | Kansas City                |        103 | 2006-02-15 04:45:25 |
        |     279 | Kowloon and New Kowloon    |         42 | 2006-02-15 04:45:25 |
        |     288 | La Paz                     |         60 | 2006-02-15 04:45:25 |
        |     289 | La Plata                   |          6 | 2006-02-15 04:45:25 |
        |     290 | La Romana                  |         27 | 2006-02-15 04:45:25 |
        |     297 | Le Mans                    |         34 | 2006-02-15 04:45:25 |
        |     324 | Mandi Bahauddin            |         72 | 2006-02-15 04:45:25 |
        |     337 | Mit Ghamr                  |         29 | 2006-02-15 04:45:25 |
        |     346 | Munger (Monghyr)           |         44 | 2006-02-15 04:45:25 |
        |     352 | Nabereznyje Tšelny         |         80 | 2006-02-15 04:45:25 |
        |     358 | Nakhon Sawan               |         94 | 2006-02-15 04:45:25 |
        |     359 | Nam Dinh                   |        105 | 2006-02-15 04:45:25 |
        |     366 | Nha Trang                  |        105 | 2006-02-15 04:45:25 |
        |     368 | Novi Sad                   |        108 | 2006-02-15 04:45:25 |
        |     373 | Ocumare del Tuy            |        104 | 2006-02-15 04:45:25 |
        |     388 | Ourense (Orense)           |         87 | 2006-02-15 04:45:25 |
        |     393 | Pachuca de Soto            |         60 | 2006-02-15 04:45:25 |
        |     394 | Pak Kret                   |         94 | 2006-02-15 04:45:25 |
        |     395 | Palghat (Palakkad)         |         44 | 2006-02-15 04:45:25 |
        |     396 | Pangkal Pinang             |         45 | 2006-02-15 04:45:25 |
        |     406 | Phnom Penh                 |         18 | 2006-02-15 04:45:25 |
        |     413 | Poços de Caldas            |         15 | 2006-02-15 04:45:25 |
        |     418 | Purnea (Purnia)            |         44 | 2006-02-15 04:45:25 |
        |     425 | Rae Bareli                 |         44 | 2006-02-15 04:45:25 |
        |     430 | Richmond Hill              |         20 | 2006-02-15 04:45:25 |
        |     431 | Rio Claro                  |         15 | 2006-02-15 04:45:25 |
        |     441 | Saint Louis                |        103 | 2006-02-15 04:45:25 |
        |     449 | San Bernardino             |        103 | 2006-02-15 04:45:25 |
        |     450 | San Felipe de Puerto Plata |         27 | 2006-02-15 04:45:25 |
        |     451 | San Felipe del Progreso    |         60 | 2006-02-15 04:45:25 |
        |     452 | San Juan Bautista Tuxtepec |         60 | 2006-02-15 04:45:25 |
        |     453 | San Lorenzo                |         73 | 2006-02-15 04:45:25 |
        |     454 | San Miguel de Tucumán      |          6 | 2006-02-15 04:45:25 |
        |     456 | Santa Brbara dOeste        |         15 | 2006-02-15 04:45:25 |
        |     457 | Santa Fé                   |          6 | 2006-02-15 04:45:25 |
        |     458 | Santa Rosa                 |         75 | 2006-02-15 04:45:25 |
        |     459 | Santiago de Compostela     |         87 | 2006-02-15 04:45:25 |
        |     460 | Santiago de los Caballeros |         27 | 2006-02-15 04:45:25 |
        |     461 | Santo André                |         15 | 2006-02-15 04:45:25 |
        |     467 | Shahr-e Kord               |         46 | 2006-02-15 04:45:25 |
        |     476 | Shubra al-Khayma           |         29 | 2006-02-15 04:45:25 |
        |     478 | Siliguri (Shiliguri)       |         44 | 2006-02-15 04:45:25 |
        |     485 | São Bernardo do Campo      |         15 | 2006-02-15 04:45:25 |
        |     486 | São Leopoldo               |         15 | 2006-02-15 04:45:25 |
        |     493 | South Hill                 |          5 | 2006-02-15 04:45:25 |
        |     498 | Stara Zagora               |         17 | 2006-02-15 04:45:25 |
        |     499 | Sterling Heights           |        103 | 2006-02-15 04:45:25 |
        |     507 | Sungai Petani              |         59 | 2006-02-15 04:45:25 |
        |     533 | Tel Aviv-Jaffa             |         48 | 2006-02-15 04:45:25 |
        |     562 | Valle de la Pascua         |        104 | 2006-02-15 04:45:25 |
        |     563 | Valle de Santiago          |         60 | 2006-02-15 04:45:25 |
        |     566 | Varanasi (Benares)         |         44 | 2006-02-15 04:45:25 |
        |     567 | Vicente López              |          6 | 2006-02-15 04:45:25 |
        |     569 | Vila Velha                 |         15 | 2006-02-15 04:45:25 |
        |     572 | Vitória de Santo Antão     |         15 | 2006-02-15 04:45:25 |
        |     582 | Yamuna Nagar               |         44 | 2006-02-15 04:45:25 |
        +---------+----------------------------+------------+---------------------+
        */
    --Películas con una duración entre 80 y 100.
        select * from film where length between 80 and 100 limit 10;
        /*+---------+----------------------+-----------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+
        | film_id | title                | description                                                                                               | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                              | last_update         |
        +---------+----------------------+-----------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+
        |       1 | ACADEMY DINOSAUR     | A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies          |         2006 |           1 |                 NULL |               6 |        0.99 |     86 |            20.99 | PG     | Deleted Scenes,Behind the Scenes              | 2006-02-15 05:03:42 |
        |      14 | ALICE FANTASIA       | A Emotional Drama of a A Shark And a Database Administrator who must Vanquish a Pioneer in Soviet Georgia |         2006 |           1 |                 NULL |               6 |        0.99 |     94 |            23.99 | NC-17  | Trailers,Deleted Scenes,Behind the Scenes     | 2006-02-15 05:03:42 |
        |      17 | ALONE TRIP           | A Fast-Paced Character Study of a Composer And a Dog who must Outgun a Boat in An Abandoned Fun House     |         2006 |           1 |                 NULL |               3 |        0.99 |     82 |            14.99 | R      | Trailers,Behind the Scenes                    | 2006-02-15 05:03:42 |
        |      22 | AMISTAD MIDSUMMER    | A Emotional Character Study of a Dentist And a Crocodile who must Meet a Sumo Wrestler in California      |         2006 |           1 |                 NULL |               6 |        2.99 |     85 |            10.99 | G      | Commentaries,Behind the Scenes                | 2006-02-15 05:03:42 |
        |      23 | ANACONDA CONFESSIONS | A Lacklusture Display of a Dentist And a Dentist who must Fight a Girl in Australia                       |         2006 |           1 |                 NULL |               3 |        0.99 |     92 |             9.99 | R      | Trailers,Deleted Scenes                       | 2006-02-15 05:03:42 |
        |      26 | ANNIE IDENTITY       | A Amazing Panorama of a Pastry Chef And a Boat who must Escape a Woman in An Abandoned Amusement Park     |         2006 |           1 |                 NULL |               3 |        0.99 |     86 |            15.99 | G      | Commentaries,Deleted Scenes                   | 2006-02-15 05:03:42 |
        |      28 | ANTHEM LUKE          | A Touching Panorama of a Waitress And a Woman who must Outrace a Dog in An Abandoned Amusement Park       |         2006 |           1 |                 NULL |               5 |        4.99 |     91 |            16.99 | PG-13  | Deleted Scenes,Behind the Scenes              | 2006-02-15 05:03:42 |
        |      30 | ANYTHING SAVANNAH    | A Epic Story of a Pastry Chef And a Woman who must Chase a Feminist in An Abandoned Fun House             |         2006 |           1 |                 NULL |               4 |        2.99 |     82 |            27.99 | R      | Trailers,Deleted Scenes,Behind the Scenes     | 2006-02-15 05:03:42 |
        |      31 | APACHE DIVINE        | A Awe-Inspiring Reflection of a Pastry Chef And a Teacher who must Overcome a Sumo Wrestler in A U-Boat   |         2006 |           1 |                 NULL |               5 |        4.99 |     92 |            16.99 | NC-17  | Commentaries,Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
        |      39 | ARMAGEDDON LOST      | A Fast-Paced Tale of a Boat And a Teacher who must Succumb a Composer in An Abandoned Mine Shaft          |         2006 |           1 |                 NULL |               5 |        0.99 |     99 |            10.99 | G      | Trailers                                      | 2006-02-15 05:03:42 |
        +---------+----------------------+-----------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+
        */
    --Peliculas con un rental_rate entre 1 y 3.
        select * from film where rental_rate between 1 and 3 limit 10;
        /*+---------+-------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------+---------------------+
        | film_id | title             | description                                                                                                           | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                        | last_update         |
        +---------+-------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------+---------------------+
        |       3 | ADAPTATION HOLES  | A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory                      |         2006 |           1 |                 NULL |               7 |        2.99 |     50 |            18.99 | NC-17  | Trailers,Deleted Scenes                 | 2006-02-15 05:03:42 |
        |       4 | AFFAIR PREJUDICE  | A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank                          |         2006 |           1 |                 NULL |               5 |        2.99 |    117 |            26.99 | G      | Commentaries,Behind the Scenes          | 2006-02-15 05:03:42 |
        |       5 | AFRICAN EGG       | A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico |         2006 |           1 |                 NULL |               6 |        2.99 |    130 |            22.99 | G      | Deleted Scenes                          | 2006-02-15 05:03:42 |
        |       6 | AGENT TRUMAN      | A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China                             |         2006 |           1 |                 NULL |               3 |        2.99 |    169 |            17.99 | PG     | Deleted Scenes                          | 2006-02-15 05:03:42 |
        |       9 | ALABAMA DEVIL     | A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat   |         2006 |           1 |                 NULL |               3 |        2.99 |    114 |            21.99 | PG-13  | Trailers,Deleted Scenes                 | 2006-02-15 05:03:42 |
        |      15 | ALIEN CENTER      | A Brilliant Drama of a Cat And a Mad Scientist who must Battle a Feminist in A MySQL Convention                       |         2006 |           1 |                 NULL |               5 |        2.99 |     46 |            10.99 | NC-17  | Trailers,Commentaries,Behind the Scenes | 2006-02-15 05:03:42 |
        |      16 | ALLEY EVOLUTION   | A Fast-Paced Drama of a Robot And a Composer who must Battle a Astronaut in New Orleans                               |         2006 |           1 |                 NULL |               6 |        2.99 |    180 |            23.99 | NC-17  | Trailers,Commentaries                   | 2006-02-15 05:03:42 |
        |      22 | AMISTAD MIDSUMMER | A Emotional Character Study of a Dentist And a Crocodile who must Meet a Sumo Wrestler in California                  |         2006 |           1 |                 NULL |               6 |        2.99 |     85 |            10.99 | G      | Commentaries,Behind the Scenes          | 2006-02-15 05:03:42 |
        |      24 | ANALYZE HOOSIERS  | A Thoughtful Display of a Explorer And a Pastry Chef who must Overcome a Feminist in The Sahara Desert                |         2006 |           1 |                 NULL |               6 |        2.99 |    181 |            19.99 | R      | Trailers,Behind the Scenes              | 2006-02-15 05:03:42 |
        |      25 | ANGELS LIFE       | A Thoughtful Display of a Woman And a Astronaut who must Battle a Robot in Berlin                                     |         2006 |           1 |                 NULL |               3 |        2.99 |     74 |            15.99 | G      | Trailers                                | 2006-02-15 05:03:42 |
        +---------+-------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------+---------------------+
        */
    --Películas con un titulo de más de 12 letras.
        select * from film where title regexp ".{12}.*" limit 10;
        /*+---------+------------------+---------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
        | film_id | title            | description                                                                                                         | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                 | last_update         |
        +---------+------------------+---------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
        |       1 | ACADEMY DINOSAUR | A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies                    |         2006 |           1 |                 NULL |               6 |        0.99 |     86 |            20.99 | PG     | Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
        |       2 | ACE GOLDFINGER   | A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China                |         2006 |           1 |                 NULL |               3 |        4.99 |     48 |            12.99 | G      | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
        |       3 | ADAPTATION HOLES | A Astounding Reflection of a Lumberjack And a Car who must Sink a Lumberjack in A Baloon Factory                    |         2006 |           1 |                 NULL |               7 |        2.99 |     50 |            18.99 | NC-17  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
        |       4 | AFFAIR PREJUDICE | A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank                        |         2006 |           1 |                 NULL |               5 |        2.99 |    117 |            26.99 | G      | Commentaries,Behind the Scenes   | 2006-02-15 05:03:42 |
        |       6 | AGENT TRUMAN     | A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China                           |         2006 |           1 |                 NULL |               3 |        2.99 |    169 |            17.99 | PG     | Deleted Scenes                   | 2006-02-15 05:03:42 |
        |       7 | AIRPLANE SIERRA  | A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat                                   |         2006 |           1 |                 NULL |               6 |        4.99 |     62 |            28.99 | PG-13  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
        |       8 | AIRPORT POLLOCK  | A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India                                       |         2006 |           1 |                 NULL |               6 |        4.99 |     54 |            15.99 | R      | Trailers                         | 2006-02-15 05:03:42 |
        |       9 | ALABAMA DEVIL    | A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat |         2006 |           1 |                 NULL |               3 |        2.99 |    114 |            21.99 | PG-13  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
        |      10 | ALADDIN CALENDAR | A Action-Packed Tale of a Man And a Lumberjack who must Reach a Feminist in Ancient China                           |         2006 |           1 |                 NULL |               6 |        4.99 |     63 |            24.99 | NC-17  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
        |      11 | ALAMO VIDEOTAPE  | A Boring Epistle of a Butler And a Cat who must Fight a Pastry Chef in A MySQL Convention                           |         2006 |           1 |                 NULL |               6 |        0.99 |    126 |            16.99 | G      | Commentaries,Behind the Scenes   | 2006-02-15 05:03:42 |
        +---------+------------------+---------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
        */
    --Peliculas con un rating de PG o G.
        select * from film where rating="PG" or rating = "G" limit 10;
        /*+---------+-------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+
        | film_id | title             | description                                                                                                           | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                              | last_update         |
        +---------+-------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+
        |       1 | ACADEMY DINOSAUR  | A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies                      |         2006 |           1 |                 NULL |               6 |        0.99 |     86 |            20.99 | PG     | Deleted Scenes,Behind the Scenes              | 2006-02-15 05:03:42 |
        |       2 | ACE GOLDFINGER    | A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China                  |         2006 |           1 |                 NULL |               3 |        4.99 |     48 |            12.99 | G      | Trailers,Deleted Scenes                       | 2006-02-15 05:03:42 |
        |       4 | AFFAIR PREJUDICE  | A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank                          |         2006 |           1 |                 NULL |               5 |        2.99 |    117 |            26.99 | G      | Commentaries,Behind the Scenes                | 2006-02-15 05:03:42 |
        |       5 | AFRICAN EGG       | A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico |         2006 |           1 |                 NULL |               6 |        2.99 |    130 |            22.99 | G      | Deleted Scenes                                | 2006-02-15 05:03:42 |
        |       6 | AGENT TRUMAN      | A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China                             |         2006 |           1 |                 NULL |               3 |        2.99 |    169 |            17.99 | PG     | Deleted Scenes                                | 2006-02-15 05:03:42 |
        |      11 | ALAMO VIDEOTAPE   | A Boring Epistle of a Butler And a Cat who must Fight a Pastry Chef in A MySQL Convention                             |         2006 |           1 |                 NULL |               6 |        0.99 |    126 |            16.99 | G      | Commentaries,Behind the Scenes                | 2006-02-15 05:03:42 |
        |      12 | ALASKA PHANTOM    | A Fanciful Saga of a Hunter And a Pastry Chef who must Vanquish a Boy in Australia                                    |         2006 |           1 |                 NULL |               6 |        0.99 |    136 |            22.99 | PG     | Commentaries,Deleted Scenes                   | 2006-02-15 05:03:42 |
        |      13 | ALI FOREVER       | A Action-Packed Drama of a Dentist And a Crocodile who must Battle a Feminist in The Canadian Rockies                 |         2006 |           1 |                 NULL |               4 |        4.99 |    150 |            21.99 | PG     | Deleted Scenes,Behind the Scenes              | 2006-02-15 05:03:42 |
        |      19 | AMADEUS HOLY      | A Emotional Display of a Pioneer And a Technical Writer who must Battle a Man in A Baloon                             |         2006 |           1 |                 NULL |               6 |        0.99 |    113 |            20.99 | PG     | Commentaries,Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
        |      22 | AMISTAD MIDSUMMER | A Emotional Character Study of a Dentist And a Crocodile who must Meet a Sumo Wrestler in California                  |         2006 |           1 |                 NULL |               6 |        2.99 |     85 |            10.99 | G      | Commentaries,Behind the Scenes                | 2006-02-15 05:03:42 |
        +---------+-------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+
        */
    --Peliculas que no tengan un rating de NC-17.
        select * from film where rating not in ("NC-17") limit 10;
        /*+---------+------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
        | film_id | title            | description                                                                                                           | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                 | last_update         |
        +---------+------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
        |       1 | ACADEMY DINOSAUR | A Epic Drama of a Feminist And a Mad Scientist who must Battle a Teacher in The Canadian Rockies                      |         2006 |           1 |                 NULL |               6 |        0.99 |     86 |            20.99 | PG     | Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
        |       2 | ACE GOLDFINGER   | A Astounding Epistle of a Database Administrator And a Explorer who must Find a Car in Ancient China                  |         2006 |           1 |                 NULL |               3 |        4.99 |     48 |            12.99 | G      | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
        |       4 | AFFAIR PREJUDICE | A Fanciful Documentary of a Frisbee And a Lumberjack who must Chase a Monkey in A Shark Tank                          |         2006 |           1 |                 NULL |               5 |        2.99 |    117 |            26.99 | G      | Commentaries,Behind the Scenes   | 2006-02-15 05:03:42 |
        |       5 | AFRICAN EGG      | A Fast-Paced Documentary of a Pastry Chef And a Dentist who must Pursue a Forensic Psychologist in The Gulf of Mexico |         2006 |           1 |                 NULL |               6 |        2.99 |    130 |            22.99 | G      | Deleted Scenes                   | 2006-02-15 05:03:42 |
        |       6 | AGENT TRUMAN     | A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China                             |         2006 |           1 |                 NULL |               3 |        2.99 |    169 |            17.99 | PG     | Deleted Scenes                   | 2006-02-15 05:03:42 |
        |       7 | AIRPLANE SIERRA  | A Touching Saga of a Hunter And a Butler who must Discover a Butler in A Jet Boat                                     |         2006 |           1 |                 NULL |               6 |        4.99 |     62 |            28.99 | PG-13  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
        |       8 | AIRPORT POLLOCK  | A Epic Tale of a Moose And a Girl who must Confront a Monkey in Ancient India                                         |         2006 |           1 |                 NULL |               6 |        4.99 |     54 |            15.99 | R      | Trailers                         | 2006-02-15 05:03:42 |
        |       9 | ALABAMA DEVIL    | A Thoughtful Panorama of a Database Administrator And a Mad Scientist who must Outgun a Mad Scientist in A Jet Boat   |         2006 |           1 |                 NULL |               3 |        2.99 |    114 |            21.99 | PG-13  | Trailers,Deleted Scenes          | 2006-02-15 05:03:42 |
        |      11 | ALAMO VIDEOTAPE  | A Boring Epistle of a Butler And a Cat who must Fight a Pastry Chef in A MySQL Convention                             |         2006 |           1 |                 NULL |               6 |        0.99 |    126 |            16.99 | G      | Commentaries,Behind the Scenes   | 2006-02-15 05:03:42 |
        |      12 | ALASKA PHANTOM   | A Fanciful Saga of a Hunter And a Pastry Chef who must Vanquish a Boy in Australia                                    |         2006 |           1 |                 NULL |               6 |        0.99 |    136 |            22.99 | PG     | Commentaries,Deleted Scenes      | 2006-02-15 05:03:42 |
        +---------+------------------+-----------------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+----------------------------------+---------------------+
        */
    --Peliculas con un rating PG y duracion de más de 120.
        select * from film where rating in ("PG") and length>120 limit 10;
        /*+---------+----------------------+-------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-------------------------------------------+---------------------+
        | film_id | title                | description                                                                                           | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                          | last_update         |
        +---------+----------------------+-------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-------------------------------------------+---------------------+
        |       6 | AGENT TRUMAN         | A Intrepid Panorama of a Robot And a Boy who must Escape a Sumo Wrestler in Ancient China             |         2006 |           1 |                 NULL |               3 |        2.99 |    169 |            17.99 | PG     | Deleted Scenes                            | 2006-02-15 05:03:42 |
        |      12 | ALASKA PHANTOM       | A Fanciful Saga of a Hunter And a Pastry Chef who must Vanquish a Boy in Australia                    |         2006 |           1 |                 NULL |               6 |        0.99 |    136 |            22.99 | PG     | Commentaries,Deleted Scenes               | 2006-02-15 05:03:42 |
        |      13 | ALI FOREVER          | A Action-Packed Drama of a Dentist And a Crocodile who must Battle a Feminist in The Canadian Rockies |         2006 |           1 |                 NULL |               4 |        4.99 |    150 |            21.99 | PG     | Deleted Scenes,Behind the Scenes          | 2006-02-15 05:03:42 |
        |      37 | ARIZONA BANG         | A Brilliant Panorama of a Mad Scientist And a Mad Cow who must Meet a Pioneer in A Monastery          |         2006 |           1 |                 NULL |               3 |        2.99 |    121 |            28.99 | PG     | Trailers,Deleted Scenes                   | 2006-02-15 05:03:42 |
        |      41 | ARSENIC INDEPENDENCE | A Fanciful Documentary of a Mad Cow And a Womanizer who must Find a Dentist in Berlin                 |         2006 |           1 |                 NULL |               4 |        0.99 |    137 |            17.99 | PG     | Trailers,Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
        |      74 | BIRCH ANTITRUST      | A Fanciful Panorama of a Husband And a Pioneer who must Outgun a Dog in A Baloon                      |         2006 |           1 |                 NULL |               4 |        4.99 |    162 |            18.99 | PG     | Trailers,Commentaries,Deleted Scenes      | 2006-02-15 05:03:42 |
        |      88 | BORN SPINAL          | A Touching Epistle of a Frisbee And a Husband who must Pursue a Student in Nigeria                    |         2006 |           1 |                 NULL |               7 |        4.99 |    179 |            17.99 | PG     | Trailers,Commentaries,Deleted Scenes      | 2006-02-15 05:03:42 |
        |      93 | BRANNIGAN SUNRISE    | A Amazing Epistle of a Moose And a Crocodile who must Outrace a Dog in Berlin                         |         2006 |           1 |                 NULL |               4 |        4.99 |    121 |            27.99 | PG     | Trailers                                  | 2006-02-15 05:03:42 |
        |      99 | BRINGING HYSTERICAL  | A Fateful Saga of a A Shark And a Technical Writer who must Find a Woman in A Jet Boat                |         2006 |           1 |                 NULL |               7 |        2.99 |    136 |            14.99 | PG     | Trailers                                  | 2006-02-15 05:03:42 |
        |     103 | BUCKET BROTHERHOOD   | A Amazing Display of a Girl And a Womanizer who must Succumb a Lumberjack in A Baloon Factory         |         2006 |           1 |                 NULL |               7 |        4.99 |    133 |            27.99 | PG     | Commentaries,Deleted Scenes               | 2006-02-15 05:03:42 |
        +---------+----------------------+-------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-------------------------------------------+---------------------+
        */
    --¿Cuantos actores hay?
        select count(*) from actor;
        /*+----------+
        | count(*) |
        +----------+
        |      200 |
        +----------+
        */
    --¿Cuántas ciudades tiene el country Spain?
        select count(c.city) from city as c,country as co where c.country_id=co.country_id and co.country = "spain";
        /*+---------------+
        | count(c.city) |
        +---------------+
        |             5 |
        +---------------+
        */
    --¿Cuántos countries hay que empiezan por a?
        select count(*) from country where country regexp "^a";
        /*+----------+
        | count(*) |
        +----------+
        |       10 |
        +----------+
        */
    --Media de duración de peliculas con PG.
        select avg(length) from film where rating in ("PG");
        /*+-------------+
        | avg(length) |
        +-------------+
        |    112.0052 |
        +-------------+
        */
    --Suma de rental_rate de todas las peliculas.
        select sum(rental_rate) from film;
        /*+------------------+
        | sum(rental_rate) |
        +------------------+
        |          2980.00 |
        +------------------+
        */
    --Pelicula con mayor duración.
        select max(length) from film;
        /*+-------------+
        | max(length) |
        +-------------+
        |         185 |
        +-------------+
        */
    --Película con menor duración.
        select min(length) from film;
        /*+-------------+
        | min(length) |
        +-------------+
        |          46 |
        +-------------+
        */
    --Mostrar las ciudades del country Spain (multitabla).
        select c.* from city as c,country as co where c.country_id=co.country_id and co.country = "spain";
        /*+---------+-------------------------+------------+---------------------+
        | city_id | city                    | country_id | last_update         |
        +---------+-------------------------+------------+---------------------+
        |       1 | A Coruña (La Coruña)    |         87 | 2006-02-15 04:45:25 |
        |     146 | Donostia-San Sebastián  |         87 | 2006-02-15 04:45:25 |
        |     181 | Gijón                   |         87 | 2006-02-15 04:45:25 |
        |     388 | Ourense (Orense)        |         87 | 2006-02-15 04:45:25 |
        |     459 | Santiago de Compostela  |         87 | 2006-02-15 04:45:25 |
        +---------+-------------------------+------------+---------------------+
        */   
    --Mostrar el nombre de la película y el nombre de los actores.
    select a.first_name,f.title from actor as a,film as f,film_actor as fa where a.actor_id=fa.actor_id and fa.film_id=f.film_id limit 10;
    /*+------------+-----------------------+
    | first_name | title                 |
    +------------+-----------------------+
    | PENELOPE   | ACADEMY DINOSAUR      |
    | PENELOPE   | ANACONDA CONFESSIONS  |
    | PENELOPE   | ANGELS LIFE           |
    | PENELOPE   | BULWORTH COMMANDMENTS |
    | PENELOPE   | CHEAPER CLYDE         |
    | PENELOPE   | COLOR PHILADELPHIA    |
    | PENELOPE   | ELEPHANT TROJAN       |
    | PENELOPE   | GLEAMING JAWBREAKER   |
    | PENELOPE   | HUMAN GRAFFITI        |
    | PENELOPE   | KING EVOLUTION        |
    +------------+-----------------------+
    */
    --Mostrar el nombre de la película y el de sus categorías.

    --Mostrar el country, la ciudad y dirección de cada miembro del staff.

    --Mostrar el country, la ciudad y dirección de cada customer.

    --Numero de películas de cada rating
        select count(*) from film group by rating;
        /*+----------+
        | count(*) |
        +----------+
        |      194 |
        |      178 |
        |      210 |
        |      223 |
        |      195 |
        +----------+
        */
    --Cuantas películas ha realizado el actor ED CHASE.

    --Media de duración de las películas cada categoría.


--Vistas
    --Vista1



    --Vista2



    --Vista3



    --Vista4



    --Vista5



