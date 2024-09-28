 --1. Crear una base de datos llamada desafio_películas.
 CREATE DATABASE desafio_peliculas;

-- 2. Cargar ambos archivos a su tabla correspondiente.
--Ingresados desde DBEAVER  en la opción import data
-- se inicia trabajo con la terminal de postgres,
-- ajustan las primary key y foreign key con el comando 
ALTER TABLE peliculas ADD COLUMN id SERIAL PRIMARY KEY;
ALTER TABLE reparto ADD CONSTRAINT fk_pelicula FOREIGN KEY (id_pelicula) REFERENCES peliculas(id);

--postgres=# \c desafio_peliculas

-- consultar tabla peliculas
SELECT * from peliculas;
-- consultar tabla reparto
SELECT* from reparto;

--3. Obtener el ID de la película “Titanic”.
SELECT id FROM peliculas WHERE "Pelicula"= 'Titanic';

--4. Listar a todos los actores que aparecen en la película "Titanic".
SELECT actor FROM reparto WHERE id_pelicula = 2;

--5. Consultar en cuántas películas del top 100 participa Harrison Ford.
SELECT COUNT(*)
FROM peliculas JOIN reparto ON peliculas.id = reparto.id_pelicula
WHERE reparto.actor = 'Harrison Ford';

-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de
-- manera ascendente.
SELECT * FROM peliculas WHERE "A±o estreno" BETWEEN 1990 AND 1999 ORDER BY "Pelicula" ASC;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser
--nombrado para la consulta como “longitud_titulo”.
SELECT "Pelicula", CHAR_LENGTH("Pelicula") AS longitud_titulo FROM peliculas;
-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas.
