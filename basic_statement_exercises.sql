show databases;
use albums_db;
select database();
show tables;

-- 1. Use the albums_db database.
show databases;
use albums_db;
select database();
show tables;

select *
from albums;

-- 2. What is the primary key for the albums table? id
select id 
from albums;

-- 3. What does the column named 'name' represent? album name
select *
 from albums;
 -- name of the album

-- 4. What do you think the sales column represents? unit sold in millions (might not know)




-- 5. Find the name of all albums by Pink Floyd. The Dark Side of the Moon, The Wall
select name, artist
from albums
where artist = 'Pink Floyd';

-- 6. What is the year Sgt. Pepper's Lonely Hearts Club Band was released? 1967
select release_date, name
from albums
where name = 'Sgt. Pepper\'s Lonely Hearts Club Band';

-- 7.  What is the genre for the album Nevermind? Grunge, Alternative Rock
select name, genre
from albums
where artist = 'Nirvana';

-- 8. Which albums were released in the 1990s? The Bodyguard, Jagged Little Pill, Come on Over, Falling into You, Let's Talk About Love, Dangerous, The Immaculate Collection, Titanic: Music from Motion Picture, Mettalica, Nevermind, Supernatural
select name, release_date
from albums
where release_date between 1990 and 1999;

-- 9. Which albums had less than 20 million certified sales? Grease, Bad, Sgt Pepper, Dirty Dancing, Let's Talk About Love,
-- Dangerous, The Immaculate Collection, Abbey Road, Born in the USA, Brother in Arms, Titanic, Nevermind, The Wall
select name, sales
from albums
where sales < 20;
