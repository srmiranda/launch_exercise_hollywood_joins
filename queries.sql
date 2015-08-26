-- 1. What are the top 50 worst rated movies? The results should
-- include the movie title and rating and be sorted by the worst
-- rating first.

-- YOUR QUERY HERE
SELECT movies.title, movies.rating
FROM movies
WHERE movies.rating IS NOT NULL
ORDER BY movies.rating asc
LIMIT 50;

-- 2. What movies do not have a rating? The results should include
-- just the movie titles in sorted order.

-- YOUR QUERY HERE
SELECT movies.title
FROM movies
WHERE movies.rating IS NULL
ORDER BY movies.title;

-- 3. What movies have the word "thrilling" in their synopsis? The
-- results should just include the movie title.

-- YOUR QUERY HERE
SELECT movies.synopsis
FROM movies
WHERE movies.synopsis LIKE '%thrilling%';

-- 4. What were the highest rated 'Science Fiction & Fantasy' movies
-- released in the 80's? The results should include the movie title,
-- the year released, and rating sorted by highest rating first.

-- YOUR QUERY HERE
SELECT movies.title, movies.year, movies.rating
FROM movies
WHERE movies.genre_id = 17 AND movies.year >= 1980 AND movies.year <= 1989
ORDER BY movies.rating desc;

-- 5. What actors have starred as James Bond? The results should
-- include the actor name, movie title, year released, and be sorted
-- by year in ascending order (earliest year appears first).

-- YOUR QUERY HERE
SELECT actors.name, movies.title, movies.year
FROM actors
JOIN cast_members
ON actors.id = cast_members.actor_id
JOIN movies
ON movies.id = cast_members.movie_id
WHERE cast_members.character LIKE '%James Bond%'
ORDER by year asc;

-- 6. What movies has Julianne Moore starred in? The results should
-- include the movie title, year released, and name of the genre,
-- sorted by genre first and then movie title.

-- YOUR QUERY HERE
SELECT movies.title, movies.year, genres.name
FROM actors
JOIN cast_members
ON actors.id = cast_members.actor_id
JOIN movies
ON movies.id = cast_members.movie_id
JOIN genres
ON movies.genre_id = genres.id
WHERE actors.name LIKE 'Julianne Moore'
ORDER BY genres.name, movies.year;

-- 7. What were the five earliest horror movies and what studios
-- produced them? Include the movie title, year released, and studio
-- name (if any) in the results sorted by year.

-- YOUR QUERY HERE
SELECT movies.title, movies.year, studios.name AS studio_name
FROM movies
LEFT OUTER JOIN studios
ON movies.studio_id = studios.id
JOIN genres
ON movies.genre_id = genres.id
WHERE genres.name LIKE 'Horror'
ORDER BY movies.year asc
LIMIT 5;
