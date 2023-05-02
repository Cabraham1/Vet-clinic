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
