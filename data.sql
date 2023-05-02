/* Populate database with sample data. */

INSERT INTO animals (name) VALUES ('Luna');
INSERT INTO animals (name) VALUES ('Daisy');
INSERT INTO animals (name) VALUES ('Charlie');


INSERT INTO animals (id, name, species, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
    (1, 'Charmander', 'unknown', '2020-02-08', 0, false, -11.00),
    (2, 'Plantmon', 'unknown', '2021-11-15', 2, true, -5.70),
    (3, 'Squirtle', 'unknown', '1993-04-02', 3, false, -12.13),
    (4, 'Angemon', 'unknown', '2005-06-12', 1, true, -45.00),
    (5, 'Boarmon', 'unknown', '2005-06-07', 7, true, 20.40),
    (6, 'Blossom', 'unknown', '1998-10-13', 3, true, 17.00),
    (7, 'Ditto', 'unknown', '2022-05-14', 4, true, 22.00);
