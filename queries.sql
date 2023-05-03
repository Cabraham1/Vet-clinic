/*Queries that provide answers to the questions from all projects.*/

SELECT * from animals WHERE name = 'Luna';

SELECT * FROM animals
WHERE name LIKE '%mon';


SELECT name FROM animals
WHERE date_of_birth BETWEEN '2016-01-01' AND '2019-12-31';


SELECT name FROM animals
WHERE neutered = true AND escape_attempts < 3;


SELECT date_of_birth FROM animals
WHERE name IN ('Agumon', 'Pikachu');


SELECT name, escape_attempts FROM animals
WHERE weight_kg > 10.5;


SELECT * FROM animals
WHERE neutered = true;


SELECT * FROM animals
WHERE name != 'Gabumon';


SELECT * FROM animals
WHERE weight_kg BETWEEN 10.4 AND 17.3;

BEGIN TRANSACTION;

UPDATE animals
SET species = 'unspecified';

-- Verify that the change was made
SELECT * FROM animals;

ROLLBACK;

-- Verify that the change was rolled back
SELECT * FROM animals;


BEGIN TRANSACTION;

-- Set the "species" column to "digimon" for all animals with a name ending in "mon"
UPDATE animals
SET species = 'digimon'
WHERE name LIKE '%mon';

-- Set the "species" column to "pokemon" for all animals that don't have a species value yet
UPDATE animals
SET species = 'pokemon'
WHERE species IS NULL OR species = 'unknown';

-- Commit the transaction
COMMIT;

-- Verify that the changes were made and persisted after commit
SELECT * FROM animals;


BEGIN TRANSACTION;

-- Delete all records in the "animals" table
DELETE FROM animals;

-- Rollback the transaction
ROLLBACK;

-- Verify that all records in the "animals" table still exist
SELECT * FROM animals;


BEGIN TRANSACTION;

-- Delete all animals born after Jan 1st, 2022
DELETE FROM animals WHERE date_of_birth > '2022-01-01';

-- Create a savepoint for the transaction
SAVEPOINT my_savepoint;

-- Update all animals' weight to be their weight multiplied by -1
UPDATE animals SET weight_kg = weight_kg * -1;

-- Rollback to the savepoint
ROLLBACK TO my_savepoint;

-- Update all animals' weights that are negative to be their weight multiplied by -1
UPDATE animals SET weight_kg = weight_kg * -1 WHERE weight_kg < 0;

-- Commit the transaction
COMMIT;


SELECT COUNT(*) AS total_animals FROM animals;

SELECT COUNT(*) AS non_escapers FROM animals WHERE escape_attempts = 0;

SELECT AVG(weight_kg) AS avg_weight FROM animals;

SELECT neutered, SUM(escape_attempts) AS total_escapes
FROM animals
GROUP BY neutered
ORDER BY total_escapes DESC
LIMIT 1;

SELECT species, MIN(weight_kg) AS min_weight, MAX(weight_kg) AS max_weight
FROM animals
GROUP BY species;

SELECT species, AVG(escape_attempts) AS avg_escapes
FROM animals
WHERE date_of_birth BETWEEN '1990-01-01' AND '2000-12-31'
GROUP BY species;


-- Animals belonging to Melody pond
SELECT animals.name
FROM animals
JOIN owners ON animals.owner_id = owners.id
WHERE owners.full_name = 'Melody Pond';

-- Animals that are pokemon
SELECT animals.name
FROM animals
JOIN species ON animals.species_id = species.id
WHERE species.name = 'Pokemon';

-- list of all owners
SELECT owners.full_name, animals.name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id;

-- number of animals per specie
SELECT species.name, COUNT(animals.id)
FROM species
JOIN animals ON species.id = animals.species_id
GROUP BY species.name;