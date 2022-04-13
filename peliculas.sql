\c alvaro
DROP DATABASE peliculas;
CREATE DATABASE peliculas;
\c peliculas

-- Cargar ambos archivos a su tabla correspondiente. (1 Punto)
CREATE TABLE peliculas(
    id SERIAL,  -- este es el campo princial de la tabla 
    pelicula VARCHAR(70), -- es un campo de varchar  
    agnoEstreno SMALLINT, 
    director VARCHAR(30),
    PRIMARY KEY (id)
);
\copy peliculas FROM 'peliculas.csv' csv header; -- copie en la tabla peliculas desde el archivo "peliculas.csv" que es un archivo csv que tiene cabeceras

CREATE TABLE reparto(
    peliculasId INT,
    reparto VARCHAR (40),
    FOREIGN KEY(peliculasId) REFERENCES peliculas(id) --relaciona ambas tablas creadas
);
\copy reparto FROM 'reparto.csv' csv; -- copie en la tabla reparto desde el archivo "reparto.csv" que es un archivo csv
SELECT COUNT(id) AS nroPeliculas FROM peliculas; --muestranos la cuenta id que le vamos a llamar nroPeliculas desde el archivo pelicula
SELECT COUNT(peliculasId) AS nroReparto FROM reparto;

-- 3. Obtener el ID de la película “Titanic”. (1 Punto)
SELECT id FROM peliculas WHERE pelicula = 'Titanic';

-- 4. Listar a todos los actores que aparecen en la película "Titanic". (1 Puntos)
SELECT reparto FROM reparto WHERE peliculasId = 2;

-- 5. Consultar en cuántas películas del top 100 participa Harrison Ford. (2 Puntos)
SELECT COUNT(reparto) AS HarrisonFord FROM reparto WHERE reparto = 'Harrison Ford';

-- 6. Indicar las películas estrenadas entre los años 1990 y 1999 ordenadas por título de manera ascendente. (1 punto)
SELECT pelicula, agnoEstreno FROM peliculas WHERE agnoEstreno BETWEEN 1990 AND 1999 ORDER BY pelicula ASC;

-- 7. Hacer una consulta SQL que muestre los títulos con su longitud, la longitud debe ser nombrado para la consulta como “longitud_titulo”. (1 punto)
SELECT pelicula, LENGTH (pelicula) AS longitud_titulo FROM peliculas;

-- 8. Consultar cual es la longitud más grande entre todos los títulos de las películas. (2 punto)
SELECT pelicula, LENGTH (pelicula) AS longitud_de_titulo FROM peliculas ORDER BY LENGTH (pelicula) DESC LIMIT 1;