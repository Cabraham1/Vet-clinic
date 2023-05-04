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

-- Adding the data for vets:
INSERT INTO vets (name, age, date_of_graduation)
VALUES ('William Tatcher', 45, '2000-04-23'),
       ('Maisy Smith', 26, '2019-01-17'),
       ('Stephanie Mendez', 64, '1981-05-04'),
       ('Jack Harkness', 38, '2008-06-08');


-- Adding the data for specialties
INSERT INTO specializations (vet_id, species_id)
VALUES
  (1, 1),
  (3, 1),
  (3, 2),
  (4, 2);


-- Adding the data for visits
INSERT INTO visits (animal_id, vet_id, visit_date) VALUES
  ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-05-24'),
  ((SELECT id FROM animals WHERE name = 'Agumon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-07-22'),
  ((SELECT id FROM animals WHERE name = 'Gabumon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-02'),
  ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-01-05'),
  ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-03-08'),
  ((SELECT id FROM animals WHERE name = 'Pikachu'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-05-14'),
  ((SELECT id FROM animals WHERE name = 'Devimon'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2021-05-04'),
  ((SELECT id FROM animals WHERE name = 'Charmander'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2021-02-24'),
  ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-12-21'),
  ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2020-08-10'),
  ((SELECT id FROM animals WHERE name = 'Plantmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2021-04-07'),
  ((SELECT id FROM animals WHERE name = 'Squirtle'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2019-09-29'),
  ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-10-03'),
  ((SELECT id FROM animals WHERE name = 'Angemon'), (SELECT id FROM vets WHERE name = 'Jack Harkness'), '2020-11-04'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-01-24'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2019-05-15'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-02-27'),
  ((SELECT id FROM animals WHERE name = 'Boarmon'), (SELECT id FROM vets WHERE name = 'Maisy Smith'), '2020-08-03'),
  ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'Stephanie Mendez'), '2020-05-24'),
  ((SELECT id FROM animals WHERE name = 'Blossom'), (SELECT id FROM vets WHERE name = 'William Tatcher'), '2021-01-11');


-- This will add 3.594.280 visits considering you have 10 animals, 4 vets, and it will use around ~87.000 timestamps (~4min approx.)
INSERT INTO visits (animal_id, vet_id, date_of_visit) SELECT * FROM (SELECT id FROM animals) animal_ids, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;

-- This will add 2.500.000 owners with full_name = 'Owner <X>' and email = 'owner_<X>@email.com' (~2min approx.)
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';