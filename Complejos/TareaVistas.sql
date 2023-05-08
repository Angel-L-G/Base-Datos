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
        /*+----------+------------+-----------+---------------------+
        | actor_id | first_name | last_name | last_update         |
        +----------+------------+-----------+---------------------+
        |        8 | MATTHEW    | JOHANSSON | 2006-02-15 04:34:33 |
        |       64 | RAY        | JOHANSSON | 2006-02-15 04:34:33 |
        |      146 | ALBERT     | JOHANSSON | 2006-02-15 04:34:33 |
        +----------+------------+-----------+---------------------+
        */
    --Actores que contengan una O en su nombre.
        select * from actor where first_name regexp "o" limit 10;
        /*+----------+------------+--------------+---------------------+
        | actor_id | first_name | last_name    | last_update         |
        +----------+------------+--------------+---------------------+
        |        1 | PENELOPE   | GUINESS      | 2006-02-15 04:34:33 |
        |        5 | JOHNNY     | LOLLOBRIGIDA | 2006-02-15 04:34:33 |
        |        9 | JOE        | SWANK        | 2006-02-15 04:34:33 |
        |       11 | ZERO       | CAGE         | 2006-02-15 04:34:33 |
        |       19 | BOB        | FAWCETT      | 2006-02-15 04:34:33 |
        |       24 | CAMERON    | STREEP       | 2006-02-15 04:34:33 |
        |       28 | WOODY      | HOFFMAN      | 2006-02-15 04:34:33 |
        |       38 | TOM        | MCKELLEN     | 2006-02-15 04:34:33 |
        |       39 | GOLDIE     | BRODY        | 2006-02-15 04:34:33 |
        |       40 | JOHNNY     | CAGE         | 2006-02-15 04:34:33 |
        +----------+------------+--------------+---------------------+
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
        select * from actor where first_name regexp "(o{2}|o.*o.*)" and last_name regexp "a";
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
        select * from city where city regexp "^a" limit 10;
        /*+---------+------------------------+------------+---------------------+
        | city_id | city                   | country_id | last_update         |
        +---------+------------------------+------------+---------------------+
        |       1 | A Coruña (La Coruña)   |         87 | 2006-02-15 04:45:25 |
        |       2 | Abha                   |         82 | 2006-02-15 04:45:25 |
        |       3 | Abu Dhabi              |        101 | 2006-02-15 04:45:25 |
        |       4 | Acuña                  |         60 | 2006-02-15 04:45:25 |
        |       5 | Adana                  |         97 | 2006-02-15 04:45:25 |
        |       6 | Addis Abeba            |         31 | 2006-02-15 04:45:25 |
        |       7 | Aden                   |        107 | 2006-02-15 04:45:25 |
        |       8 | Adoni                  |         44 | 2006-02-15 04:45:25 |
        |       9 | Ahmadnagar             |         44 | 2006-02-15 04:45:25 |
        |      10 | Akishima               |         50 | 2006-02-15 04:45:25 |
        +---------+------------------------+------------+---------------------+
        */
    --Ciudades que acaban por s.
        select * from city where city regexp "s$" limit 10;
        /*+---------+----------------+------------+---------------------+
        | city_id | city           | country_id | last_update         |
        +---------+----------------+------------+---------------------+
        |      25 | Angra dos Reis |         15 | 2006-02-15 04:45:25 |
        |      26 | Anápolis       |         15 | 2006-02-15 04:45:25 |
        |      79 | Bilbays        |         29 | 2006-02-15 04:45:25 |
        |     102 | Caracas        |        104 | 2006-02-15 04:45:25 |
        |     118 | Ciomas         |         45 | 2006-02-15 04:45:25 |
        |     120 | Citrus Heights |        103 | 2006-02-15 04:45:25 |
        |     125 | Coatzacoalcos  |         60 | 2006-02-15 04:45:25 |
        |     135 | Dallas         |        103 | 2006-02-15 04:45:25 |
        |     137 | Daugavpils     |         54 | 2006-02-15 04:45:25 |
        |     147 | Dos Quebradas  |         24 | 2006-02-15 04:45:25 |
        +---------+----------------+------------+---------------------+
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
        select * from city where city regexp " " limit 10;
        /*+---------+-------------------------+------------+---------------------+
        | city_id | city                    | country_id | last_update         |
        +---------+-------------------------+------------+---------------------+
        |       1 | A Coruña (La Coruña)    |         87 | 2006-02-15 04:45:25 |
        |       3 | Abu Dhabi               |        101 | 2006-02-15 04:45:25 |
        |       6 | Addis Abeba             |         31 | 2006-02-15 04:45:25 |
        |      18 | Allappuzha (Alleppey)   |         44 | 2006-02-15 04:45:25 |
        |      20 | Almirante Brown         |          6 | 2006-02-15 04:45:25 |
        |      25 | Angra dos Reis          |         15 | 2006-02-15 04:45:25 |
        |      28 | Aparecida de Goiânia    |         15 | 2006-02-15 04:45:25 |
        |      41 | Augusta-Richmond County |        103 | 2006-02-15 04:45:25 |
        |      45 | Bahía Blanca            |          6 | 2006-02-15 04:45:25 |
        |      53 | Bandar Seri Begawan     |         16 | 2006-02-15 04:45:25 |
        +---------+-------------------------+------------+---------------------+
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
        select * from film where length=(SELECT max(length) from film);
        /*+---------+--------------------+-----------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+--------------------------------------------------------+---------------------+
        | film_id | title              | description                                                                                                     | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                                       | last_update         |
        +---------+--------------------+-----------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+--------------------------------------------------------+---------------------+
        |     141 | CHICAGO NORTH      | A Fateful Yarn of a Mad Cow And a Waitress who must Battle a Student in California                              |         2006 |           1 |                 NULL |               6 |        4.99 |    185 |            11.99 | PG-13  | Deleted Scenes,Behind the Scenes                       | 2006-02-15 05:03:42 |
        |     182 | CONTROL ANTHEM     | A Fateful Documentary of a Robot And a Student who must Battle a Cat in A Monastery                             |         2006 |           1 |                 NULL |               7 |        4.99 |    185 |             9.99 | G      | Commentaries                                           | 2006-02-15 05:03:42 |
        |     212 | DARN FORRESTER     | A Fateful Story of a A Shark And a Explorer who must Succumb a Technical Writer in A Jet Boat                   |         2006 |           1 |                 NULL |               7 |        4.99 |    185 |            14.99 | G      | Deleted Scenes                                         | 2006-02-15 05:03:42 |
        |     349 | GANGS PRIDE        | A Taut Character Study of a Woman And a A Shark who must Confront a Frisbee in Berlin                           |         2006 |           1 |                 NULL |               4 |        2.99 |    185 |            27.99 | PG-13  | Behind the Scenes                                      | 2006-02-15 05:03:42 |
        |     426 | HOME PITY          | A Touching Panorama of a Man And a Secret Agent who must Challenge a Teacher in A MySQL Convention              |         2006 |           1 |                 NULL |               7 |        4.99 |    185 |            15.99 | R      | Trailers,Commentaries,Behind the Scenes                | 2006-02-15 05:03:42 |
        |     609 | MUSCLE BRIGHT      | A Stunning Panorama of a Sumo Wrestler And a Husband who must Redeem a Madman in Ancient India                  |         2006 |           1 |                 NULL |               7 |        2.99 |    185 |            23.99 | G      | Deleted Scenes                                         | 2006-02-15 05:03:42 |
        |     690 | POND SEATTLE       | A Stunning Drama of a Teacher And a Boat who must Battle a Feminist in Ancient China                            |         2006 |           1 |                 NULL |               7 |        2.99 |    185 |            25.99 | PG-13  | Trailers,Commentaries,Behind the Scenes                | 2006-02-15 05:03:42 |
        |     817 | SOLDIERS EVOLUTION | A Lacklusture Panorama of a A Shark And a Pioneer who must Confront a Student in The First Manned Space Station |         2006 |           1 |                 NULL |               7 |        4.99 |    185 |            27.99 | R      | Trailers,Commentaries,Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
        |     872 | SWEET BROTHERHOOD  | A Unbelieveable Epistle of a Sumo Wrestler And a Hunter who must Chase a Forensic Psychologist in A Baloon      |         2006 |           1 |                 NULL |               3 |        2.99 |    185 |            27.99 | R      | Deleted Scenes                                         | 2006-02-15 05:03:42 |
        |     991 | WORST BANGER       | A Thrilling Drama of a Madman And a Dentist who must Conquer a Boy in The Outback                               |         2006 |           1 |                 NULL |               4 |        2.99 |    185 |            26.99 | PG     | Deleted Scenes,Behind the Scenes                       | 2006-02-15 05:03:42 |
        +---------+--------------------+-----------------------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+--------------------------------------------------------+---------------------+
        */
    --Película con menor duración.
        select * from film where length=(SELECT min(length) from film);
        /*+---------+---------------------+--------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+
        | film_id | title               | description                                                                                      | release_year | language_id | original_language_id | rental_duration | rental_rate | length | replacement_cost | rating | special_features                              | last_update         |
        +---------+---------------------+--------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+
        |      15 | ALIEN CENTER        | A Brilliant Drama of a Cat And a Mad Scientist who must Battle a Feminist in A MySQL Convention  |         2006 |           1 |                 NULL |               5 |        2.99 |     46 |            10.99 | NC-17  | Trailers,Commentaries,Behind the Scenes       | 2006-02-15 05:03:42 |
        |     469 | IRON MOON           | A Fast-Paced Documentary of a Mad Cow And a Boy who must Pursue a Dentist in A Baloon            |         2006 |           1 |                 NULL |               7 |        4.99 |     46 |            27.99 | PG     | Commentaries,Behind the Scenes                | 2006-02-15 05:03:42 |
        |     504 | KWAI HOMEWARD       | A Amazing Drama of a Car And a Squirrel who must Pursue a Car in Soviet Georgia                  |         2006 |           1 |                 NULL |               5 |        0.99 |     46 |            25.99 | PG-13  | Trailers,Commentaries                         | 2006-02-15 05:03:42 |
        |     505 | LABYRINTH LEAGUE    | A Awe-Inspiring Saga of a Composer And a Frisbee who must Succumb a Pioneer in The Sahara Desert |         2006 |           1 |                 NULL |               6 |        2.99 |     46 |            24.99 | PG-13  | Commentaries,Behind the Scenes                | 2006-02-15 05:03:42 |
        |     730 | RIDGEMONT SUBMARINE | A Unbelieveable Drama of a Waitress And a Composer who must Sink a Mad Cow in Ancient Japan      |         2006 |           1 |                 NULL |               3 |        0.99 |     46 |            28.99 | PG-13  | Commentaries,Deleted Scenes,Behind the Scenes | 2006-02-15 05:03:42 |
        +---------+---------------------+--------------------------------------------------------------------------------------------------+--------------+-------------+----------------------+-----------------+-------------+--------+------------------+--------+-----------------------------------------------+---------------------+
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
        select f.title,c.name from film as f, category as c, film_category as fc
        where f.film_id=fc.film_id and fc.category_id=c.category_id limit 10;
        /*+---------------------+--------+
        | title               | name   |
        +---------------------+--------+
        | AMADEUS HOLY        | Action |
        | AMERICAN CIRCUS     | Action |
        | ANTITRUST TOMATOES  | Action |
        | ARK RIDGEMONT       | Action |
        | BAREFOOT MANCHURIAN | Action |
        | BERETS AGENT        | Action |
        | BRIDE INTRIGUE      | Action |
        | BULL SHAWSHANK      | Action |
        | CADDYSHACK JEDI     | Action |
        | CAMPUS REMEMBER     | Action |
        +---------------------+--------+
        */
    --Mostrar el country, la ciudad y dirección de cada miembro del staff.
        select s.first_name, s.last_name, a.address, ci.city, co.country from staff as s
            , address as a, city as ci, country as co where s.address_id=a.address_id 
            and a.city_id=ci.city_id and ci.country_id=co.country_id;
        /*+------------+-----------+----------------------+------------+-----------+
        | first_name | last_name | address              | city       | country   |
        +------------+-----------+----------------------+------------+-----------+
        | Mike       | Hillyer   | 23 Workhaven Lane    | Lethbridge | Canada    |
        | Jon        | Stephens  | 1411 Lillydale Drive | Woodridge  | Australia |
        +------------+-----------+----------------------+------------+-----------+
        */
    --Mostrar el country, la ciudad y dirección de cada customer.
        select cu.first_name, cu.last_name, a.address, ci.city, co.country 
        from customer as cu, city as ci, country as co, address as a 
        where cu.address_id=a.address_id and a.city_id=ci.city_id 
        and ci.country_id=co.country_id limit 10;
        /*+------------+-----------+-------------------------------+-----------------+----------------+
        | first_name | last_name | address                       | city            | country        |
        +------------+-----------+-------------------------------+-----------------+----------------+
        | VERA       | MCCOY     | 1168 Najafabad Parkway        | Kabul           | Afghanistan    |
        | MARIO      | CHEATHAM  | 1924 Shimonoseki Drive        | Batna           | Algeria        |
        | JUDY       | GRAY      | 1031 Daugavpils Parkway       | Béchar          | Algeria        |
        | JUNE       | CARROLL   | 757 Rustenburg Avenue         | Skikda          | Algeria        |
        | ANTHONY    | SCHWAB    | 1892 Nabereznyje Telny Lane   | Tafuna          | American Samoa |
        | CLAUDE     | HERZOG    | 486 Ondo Parkway              | Benguela        | Angola         |
        | MARTIN     | BALES     | 368 Hunuco Boulevard          | Namibe          | Angola         |
        | BOBBY      | BOUDREAU  | 1368 Maracabo Boulevard       | South Hill      | Anguilla       |
        | WILLIE     | MARKHAM   | 1623 Kingstown Drive          | Almirante Brown | Argentina      |
        | JORDAN     | ARCHULETA | 1229 Varanasi (Benares) Manor | Avellaneda      | Argentina      |
        +------------+-----------+-------------------------------+-----------------+----------------+
        */
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
        select count(f.title) from film as f, actor as a, film_actor as fa 
        where a.first_name='ED' and a.last_name='Chase' 
        and a.actor_id=fa.actor_id and fa.film_id=f.film_id;
        /*+----------------+
        | count(f.title) |
        +----------------+
        |             22 |
        +----------------+
        */
    --Media de duración de las películas cada categoría.
        select c.name, count(f.title) from category as c, film_category as fc, film as f
        where f.film_id=fc.film_id and fc.category_id=c.category_id group by c.category_id;
        /*+-------------+----------------+
        | name        | count(f.title) |
        +-------------+----------------+
        | Action      |             64 |
        | Animation   |             66 |
        | Children    |             60 |
        | Classics    |             57 |
        | Comedy      |             58 |
        | Documentary |             68 |
        | Drama       |             62 |
        | Family      |             69 |
        | Foreign     |             73 |
        | Games       |             61 |
        | Horror      |             56 |
        | Music       |             51 |
        | New         |             63 |
        | Sci-Fi      |             61 |
        | Sports      |             74 |
        | Travel      |             57 |
        +-------------+----------------+
        */
--Vistas
    --Vista1
        Create view staff_list AS
            SELECT 
            s.staff AS ID, 
                CONCAT(s.first_name, " ", s.last_name) AS name, 
                a.address AS address, 
                a.postal_code AS `zip code`,
                a.phone AS phone, 
                city.city AS city, 
                country.country AS country, 
            FROM 
            staff AS s JOIN address AS a 
                ON s.address_id = a.address_id 
                JOIN city 
                ON a.city_id = city.city_id
            JOIN country 
                ON city.country_id = country.country_id;

        select * from staff_list limit 10;
    --Vista2
        Create view cantidad_peliculas_por_categoria AS
            select 
                c.name, count(f.title) 
            from 
                category as c, 
                film_category as fc, 
                film as f
            where 
                f.film_id=fc.film_id 
            and 
                fc.category_id=c.category_id 
            group by c.category_id;

        select * from cantidad_peliculas_por_categoria limit 10;
    --Vista3
        Create view category_film_list AS
            select 
                f.title,c.name 
            from 
                film as f, 
                category as c, 
                film_category as fc
            where 
                f.film_id=fc.film_id 
            and 
                fc.category_id=c.category_id 
            limit 10;
        
        select * from category_film_list limit 10;
    --Vista4
        Create view actores_por_pelicula AS
            select 
                CONCAT(a.first_name, " ", a.last_name) AS name,f.title 
            from
                actor as a,
                film as f,
                film_actor as fa 
            where
                a.actor_id=fa.actor_id 
            and 
                fa.film_id=f.film_id 
            limit 10;

        select * from actores_por_pelicula limit 10;
    --Vista5
        drop view actores_por_pelicula_y_rating;

        Create view actores_por_pelicula_y_rating AS
            select 
                CONCAT(a.first_name, " ", a.last_name) AS name, count(f.title)
            from
                actor as a,
                film as f,
                film_actor as fa 
            where
                a.actor_id=fa.actor_id 
            and 
                fa.film_id=f.film_id 
            GROUP by name
            limit 10;

        select * from actores_por_pelicula_y_rating limit 10;


