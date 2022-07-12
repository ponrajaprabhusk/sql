-- CREATE DATABASE my_events;

-- CREATE TABLE events(
--     id INT PRIMARY KEY AUTO_INCREMENT, 
--     name VARCHAR(300) NOT NULL CHECK (LENGTH(name) > 5),
--     date_planned TIMESTAMP NOT NULL,
--     image VARCHAR(1000),
--     description TEXT NOT NULL,
--     max_participants INT CHECK(max_participants > 0),
--     min_age INT CHECK(min_age > 0 )
-- );  

-- INSERT INTO events (
--     name,
--     date_planned, 
--     description,
--     max_participants,
--     min_age   
-- )
--     VALUES (
--         'A First Event',
--         '2022-06-27 16:30:15',
--         'This is description of the first event!!',
--         20,
--         18
--     ),
--     (
--         'A Second Event',
--         '2022-06-28 16:30:15',
--         'This is description of the Second event!!',
--         10,
--         18
--     );


-- UPDATE events 
-- SET min_age = 16
-- WHERE id = 1 

-- SELECT * FROM events 
-- WHERE date_planned > '2022-06-28' AND min_age = 18 ;
-- ORDER BY id DESC;

-- CREATE TABLE cities (
--   name VARCHAR(200) PRIMARY KEY
-- );

-- CREATE TABLE locations (
--   id INT PRIMARY KEY AUTO_INCREMENT, -- MySQL
--   -- id SERIAL PRIMARY KEY, -- Postgresl
--   title VARCHAR(300),
--   street VARCHAR(300) NOT NULL,
--   house_number VARCHAR(10) NOT NULL,
--   postal_code VARCHAR(5) NOT NULL,
--   city_name VARCHAR(200) REFERENCES cities ON DELETE RESTRICT ON UPDATE CASCADE
-- );

-- CREATE TABLE events (
--   id INT PRIMARY KEY AUTO_INCREMENT, -- MySQL
--   -- id SERIAL PRIMARY KEY, -- Postgresl
--   name VARCHAR(300) NOT NULL CHECK (LENGTH(name) > 5),
--   date_planned TIMESTAMP NOT NULL,
--   image VARCHAR(300),
--   description TEXT NOT NULL,
--   max_participants INT CHECK (max_participants > 0),
--   min_age INT CHECK (min_age > 0),
--   location_id INT REFERENCES locations ON DELETE CASCADE
-- );

-- CREATE TABLE cities (
--   name VARCHAR(200) PRIMARY KEY
-- );

-- CREATE TABLE locations (
--   -- id INT PRIMARY KEY AUTO_INCREMENT, -- MySQL
--   id SERIAL PRIMARY KEY, -- Postgresl
--   title VARCHAR(300),
--   street VARCHAR(300) NOT NULL,
--   house_number VARCHAR(10) NOT NULL,
--   postal_code VARCHAR(5) NOT NULL,
--   city_name VARCHAR(200) REFERENCES cities ON DELETE RESTRICT ON UPDATE CASCADE
-- );

-- CREATE TABLE users (
--   -- id INT PRIMARY KEY AUTO_INCREMENT, -- MySQL
--   id SERIAL PRIMARY KEY, -- Postgresl
--   first_name VARCHAR(300) NOT NULL,
--   last_name VARCHAR(300) NOT NULL,
--   birthdate DATE NOT NULL,
--   email VARCHAR(300) NOT NULL
-- );

-- CREATE TABLE organizers (
--   password VARCHAR(500) NOT NULL,
--   user_id INT PRIMARY KEY REFERENCES users ON DELETE CASCADE
-- );

-- CREATE TABLE tags (
--   name VARCHAR(100) PRIMARY KEY
-- );

-- CREATE TABLE events (
--   -- id INT PRIMARY KEY AUTO_INCREMENT, -- MySQL
--   id SERIAL PRIMARY KEY, -- Postgresl
--   name VARCHAR(300) NOT NULL CHECK (LENGTH(name) > 5),
--   date_planned TIMESTAMP NOT NULL,
--   image VARCHAR(300),
--   description TEXT NOT NULL,
--   max_participants INT CHECK (max_participants > 0),
--   min_age INT CHECK (min_age > 0),
--   location_id INT REFERENCES locations ON DELETE CASCADE,
--   organizer_id INT REFERENCES organizers ON DELETE CASCADE
-- );

-- CREATE TABLE events_users (
--   event_id INT REFERENCES events ON DELETE CASCADE,
--   user_id INT REFERENCES users ON DELETE CASCADE,
--   PRIMARY KEY (event_id, user_id)
-- );

-- CREATE TABLE events_tags (
--   event_id INT REFERENCES events ON DELETE CASCADE,
--   tag_name VARCHAR(100) REFERENCES tags ON DELETE CASCADE,
--   PRIMARY KEY (event_id, tag_name)
-- );

-- INSERT INTO tags (name)
-- VALUES ('socialize'), ('learn'), ('connect'), ('dinner'), ('breakfast');

-- INSERT INTO cities (name)
-- VALUES ('Munich'), ('Berlin'), ('Cologne'), ('Frankfurt'), ('Hamburg');

-- INSERT INTO locations (title, street, house_number, postal_code, city_name)
-- VALUES 
--   ('Beerhall', 'Beerstreet', '5A', '80135', 'Munich'),
--   (NULL, 'Beerstreet', '10', '81035', 'Munich'),
--   (NULL, 'Gardenstreet', '101', '80031', 'Munich'),
--   ('The Green One', 'Veggiestreet', '12', '12141', 'Berlin'),
--   (NULL, 'Park Plaza', '1', '11011', 'Berlin'),
--   ('Partyhouse', 'Carnevalstreet', '3', '12345', 'Cologne'),
--   (NULL, 'Some Street', '18', '72657', 'Hamburg');


-- INSERT INTO users (first_name, last_name, birthdate, email)
-- VALUES 
--   ('Max', 'Schwarz', '1989-05-01', 'max@test.com'),
--   ('Manuel', 'Lorenz', '1988-10-19', 'manuel@test.com'),
--   ('Julie', 'Barnes', '1986-02-13', 'julie@test.com'),
--   ('Michael', 'Smith', '1982-11-11', 'michael@test.com');


-- INSERT INTO organizers (password, user_id)
-- VALUES 
--   ('mypw1', 1), -- passwords would typically be stored encrypted
--   ('somepw2', 2);


-- INSERT INTO events (name, date_planned, image, description, max_participants, min_age, location_id, organizer_id)
-- VALUES 
--   (
--     'New in town', 
--     '2022-02-01 17:30:00', 
--     'path/to/image.jpg', 
--     'You are new in town? Join us and meet like-minded new people!',
--     20,
--     16,
--     1,
--     1
--   );


-- INSERT INTO events_tags (event_id, tag_name)
-- VALUES 
--   (1, 'socialize'),
--   (1, 'connect'),
--   (1, 'dinner');


-- INSERT INTO events_users (event_id, user_id)
-- VALUES 
--   (1, 3),
--   (1, 4);

-- SELECT * FROM users;

-- SELECT 
--   e.id AS event_id, 
--   e.name, 
--   e.date_planned, 
--   loc.title, 
--   loc.street, 
--   loc.house_number, 
--   loc.city_name 
-- FROM events AS e
-- INNER JOIN locations AS loc ON e.location_id = loc.id;

-- SELECT 
--   e.id AS event_id, 
--   e.name, 
--   e.date_planned, 
--   loc.title, 
--   loc.street, 
--   loc.house_number, 
--   loc.city_name,
--   u.first_name,
--   u.last_name 
-- FROM events AS e
-- INNER JOIN locations AS loc ON e.location_id = loc.id
-- INNER JOIN events_users AS eu ON eu.event_id = e.id
-- INNER JOIN users AS u ON eu.user_id = u.id;

-- SELECT * FROM locations AS loc
-- LEFT JOIN events AS e ON e.location_id = loc.id;

-- SELECT * FROM cities AS c
-- LEFT JOIN locations AS loc ON loc.city_name = c.name
-- LEFT JOIN events AS e ON e.location_id = loc.id;

-- SELECT * FROM users
-- WHERE first_name LIKE 'Ma%';

-- SELECT COUNT(id) FROM locations;

-- SELECT c.name, loc.street, COUNT(loc.id) AS num_locations FROM cities AS c
-- LEFT JOIN locations AS loc ON loc.city_name = c.name
-- GROUP BY c.name, loc.street;

-- SELECT c.name, COUNT(loc.id) AS num_locations FROM cities AS c
-- LEFT JOIN locations AS loc ON loc.city_name = c.name
-- WHERE loc.city_name = 'Munich'
-- GROUP BY c.name
-- HAVING COUNT(loc.id) > 1;