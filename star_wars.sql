DROP TABLE IF EXISTS lightsabers;
DROP TABLE IF EXISTS characters;

/*the columns of new table must be separated by commas.*/
/*the name column has a flexible memory for up to 255 characters*/
/*the darkside column is a Boolean flag*/


CREATE TABLE characters (
  name VARCHAR(255),
  darkside BOOLEAN,
  age INT
);

/* we can run the tables in terminal using command psql -d star_wars -f star_wars.sql,
where -d means using database, and -f means using the file.  */

INSERT INTO characters(name, darkside, age) VALUES ('Obi-Wan Kenobi', false, 27);
INSERT INTO characters(name, darkside, age) VALUES ('Anakin Skywalker', false, 19);
INSERT INTO characters(name, darkside, age) VALUES ('Darth Maul', true, 32);


/*Line up the values properly when inserting new data into the table.
Use single quotation marks with strings.
After we insert data into our table, we can print it out using the following statement*/


--we can also insert multiple values into the table by using commas to separate new entries, then ending with a semicolon
INSERT INTO characters(name, darkside, age)
            VALUES
            ('Jar Jar Binks', true, 69),
            ('Admiral Ackbar', false, 99),
            ('Chewbacca', false, 200);

--we can also add in data that might miss a value
INSERT INTO characters(name, darkside)
           VALUES
           ('Yoda', false);

-- SELECT * FROM characters;

--CRUD system is what we want our database to do: create, read, update, and delete

SELECT COUNT(*) FROM characters;

SELECT SUM(age) FROM characters;

--we can update all the ages to one with this command
-- UPDATE characters SET age = 1;
--we can also update one or more specfic data point with this command
UPDATE characters SET age= 875 WHERE name= 'Yoda';

UPDATE characters SET (name, darkside)= ('Darth Vader', true) WHERE name= 'Anakin Skywalker';


SELECT * FROM characters;
-- We can delete everything from table like this
-- DELETE FROM characters;
DELETE FROM characters WHERE name = 'Obi-Wan Kenobi';

INSERT INTO characters (name, darkside, age) VALUES ('Stormtrooper', true, 25);
INSERT INTO characters (name, darkside, age) VALUES ('Stormtrooper', true, 25);
INSERT INTO characters (name, darkside, age) VALUES ('Stormtrooper', true, 25);
INSERT INTO characters (name, darkside, age) VALUES ('Stormtrooper', true, 25);
INSERT INTO characters (name, darkside, age) VALUES ('Stormtrooper', true, 25);

SELECT * FROM characters;


-- we can add a unique identifier to each row so that we can identify entries more concisely
DROP TABLE IF EXISTS characters;

CREATE TABLE characters (
  id PRIMARY KEY SERIAL,
  name VARCHAR(255),
  darkside BOOLEAN,
  age INT
);

INSERT INTO characters (name, darkside, age) VALUES ('Stormtrooper', true, 25);
INSERT INTO characters (name, darkside, age) VALUES ('Stormtrooper', true, 25);
INSERT INTO characters (name, darkside, age) VALUES ('Stormtrooper', true, 25);
INSERT INTO characters (name, darkside, age) VALUES ('Stormtrooper', true, 25);
INSERT INTO characters (name, darkside, age) VALUES ('Stormtrooper', true, 25);

-- SELECT * FROM characters;

--so now we can update one specific stormtrooper
UPDATE characters SET (name, darkside) = ('Finn', false) WHERE id = 4;

-- SELECT * FROM characters;

-- we can create our table so that it does not accept null (empty) values
CREATE TABLE lightsabers (
  id SERIAL PRIMARY KEY,
  hilt_metal VARCHAR(255) NOT NULL,
  colour VARCHAR(255) NOT NULL,
  character_id INT REFERENCES characters(id) NOT NULL
);

INSERT INTO lightsabers (hilt_metal, colour, character_id)
             VALUES
             ('silver', 'blue', 7),
             ('palladium', 'green', 4),
             ('gold', 'red', 3);

SELECT * FROM lightsabers;

-- changing the ID is highly problematic because it might mean we would lose a lot of our data
-- we also cannot reset an ID that already exists
-- UPDATE lightsabers SET id= 3 WHERE colour= 'blue';

-- SELECT * FROM lightsabers;
