/* Populate database with sample data. */



INSERT INTO animals (id, name, species, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
    (1, 'Charmander', 'unknown', '2020-02-08', 0, false, -11.00),
    (2, 'Plantmon', 'unknown', '2021-11-15', 2, true, -5.70),
    (3, 'Squirtle', 'unknown', '1993-04-02', 3, false, -12.13),
    (4, 'Angemon', 'unknown', '2005-06-12', 1, true, -45.00),
    (5, 'Boarmon', 'unknown', '2005-06-07', 7, true, 20.40),
    (6, 'Blossom', 'unknown', '1998-10-13', 3, true, 17.00),
    (7, 'Ditto', 'unknown', '2022-05-14', 4, true, 22.00);

    
    INSERT INTO animals (id, name, species, date_of_birth, escape_attempts, neutered, weight_kg)
VALUES
    (1, 'Charmander', 'unknown', '2020-02-08', 0, false, -11.00),
    (2, 'Plantmon', 'unknown', '2021-11-15', 2, true, -5.70),
    (3, 'Squirtle', 'unknown', '1993-04-02', 3, false, -12.13),
    (4, 'Angemon', 'unknown', '2005-06-12', 1, true, -45.00),
    (5, 'Boarmon', 'unknown', '2005-06-07', 7, true, 20.40),
    (6, 'Blossom', 'unknown', '1998-10-13', 3, true, 17.00),
    (7, 'Ditto', 'unknown', '2022-05-14', 4, true, 22.00);




INSERT INTO owners (full_name, age)
VALUES
  ('Sam Smith', 34),
  ('Jennifer Orwell', 19),
  ('Bob', 45),
  ('Melody Pond', 77),
  ('Dean Winchester', 14),
  ('Jodie Whittaker', 38);
  
  INSERT INTO species (name)
VALUES
  ('Pokemon'),
  ('Digimon');


-- Set the species_id for Digimon to 2
UPDATE animals
SET species_id = 2
WHERE name LIKE '%mon';

-- Set the species_id for Pokemon to 1
UPDATE animals
SET species_id = 1
WHERE name NOT LIKE '%mon';


-- Set the owner_id for Sam Smith's animals
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE name = 'Sam Smith')
WHERE name = 'Agumon';

-- Set the owner_id for Jennifer Orwell's animals
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE name = 'Jennifer Orwell')
WHERE name IN ('Gabumon', 'Pikachu');

-- Set the owner_id for Bob's animals
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE name = 'Bob')
WHERE name IN ('Devimon', 'Plantmon');

-- Set the owner_id for Melody Pond's animals
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE name = 'Melody Pond')
WHERE name IN ('Charmander', 'Squirtle', 'Blossom');

-- Set the owner_id for Dean Winchester's animals
UPDATE animals
SET owner_id = (SELECT id FROM owners WHERE name = 'Dean Winchester')
WHERE name IN ('Angemon', 'Boarmon');


-- INSERT owners details

INSERT INTO owners (full_name, age) VALUES ('Sam Smith', 34);
INSERT INTO owners (full_name, age) VALUES ('Jennifer Orwell', 19);
INSERT INTO owners (full_name, age) VALUES ('Bob', 45);
INSERT INTO owners (full_name, age) VALUES ('Melody Pond', 77);
INSERT INTO owners (full_name, age) VALUES ('Dean Winchester', 14);
INSERT INTO owners (full_name, age) VALUES ('Jodie Whittaker', 38);



-- insert into species
INSERT INTO species (name) VALUES ('Pokemon');
INSERT INTO species (name) VALUES ('Digimon');


-- To modify the inserted animals to include the species_id value based on the name
UPDATE animals
SET species_id = 
    CASE 
        WHEN name LIKE '%mon' THEN (SELECT id FROM species WHERE name = 'Digimon')
        ELSE (SELECT id FROM species WHERE name = 'Pokemon')
    END;


-- Modify your inserted animals to include owner information (owner_id)
UPDATE animals SET owner_id = 1 WHERE name = 'Agumon';
UPDATE animals SET owner_id = 2 WHERE name IN ('Gabumon', 'Pikachu');
UPDATE animals SET owner_id = 3 WHERE name IN ('Devimon', 'Plantmon');
UPDATE animals SET owner_id = 4 WHERE name IN ('Charmander', 'Squirtle', 'Blossom');
UPDATE animals SET owner_id = 5 WHERE name IN ('Angemon', 'Boarmon');
