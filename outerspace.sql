CREATE TABLE stars (
    name VARCHAR(50) PRIMARY KEY,
    temp_in_kelvin VARCHAR(10) NOT NULL
);
-- INT for temp

CREATE TABLE planets (
    name VARCHAR(50) PRIMARY KEY,
    orbital_period_yrs FLOAT NOT NULL,
        CHECK (orbital_period_yrs > 0),
    orbits_around_star VARCHAR(50) NOT NULL REFERENCES stars
);


CREATE TABLE moons (
    name VARCHAR(50) PRIMARY KEY,
    planet VARCHAR(50) NOT NULL REFERENCES planets
);


INSERT INTO stars
    (name, temp_in_kelvin)
VALUES
    ('The Sun', '5800°K'),
    ('Proxima Centauri', '3042°K'),
    ('Gliese 876', '3192°K');


INSERT INTO planets
    (name, orbital_period_yrs, orbits_around_star)
VALUES
    ('Earth', 1.00, 'The Sun'),
    ('Mars', 1.882, 'The Sun'),
    ('Venus', 0.62, 'The Sun'),
    ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
    ('Gliese 876 b', 0.236, 'Gliese 876');


INSERT INTO moons
    (name, planet)
VALUES
    ('The Moon', 'Earth'),
    ('Phobos', 'Mars'),
    ('Deimos', 'Mars');


SELECT p.name, p.orbits_around_star, COUNT(m.name)
    FROM planets AS p
        LEFT OUTER JOIN moons AS m
            ON p.name = m.planet
    GROUP BY p.name
    ORDER BY p.name;
