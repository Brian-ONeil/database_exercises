show databases;
use albums_db;
select database();
show tables;

select *
from albums;

-- 1. Use the albums_db database.

-- 2. What is the primary key for the albums table? id

-- 3. What does the column named 'name' represent? album name

-- 4. What do you think the sales column represents? unit sold in millions (might not know)

-- 5. Find the name of all albums by Pink Floyd. The Dark Side of the Moon, The Wall
select name, artist
from albums
where artist = 'Pink Floyd';

-- 6. What is the year Sgt. Pepper's Lonely Hearts Club Band was released? 1967
select *
from albums
where artist = 'The Beatles';

-- 7.  What is the genre for the album Nevermind? Grunge
select name, genre
from albums
where artist = 'Nirvana';

-- 8. Which albums were released in the 1990s? Sgt. Pepper's Lonely Hearts Club Band, Abbey Road
select name, release_date
from albums
where release_date between 1960 and 1969;

-- 9. Which albums had less than 20 million certified sales? Grease, Bad, Sgt Pepper, Dirty Dancing, Let's Talk About Love,
-- Dangerous, The Immaculate Collection, Abbey Road, Born in the USA, Brother in Arms, Titanic, Nevermind, The Wall
select sales
from albums
where sales < 20;
