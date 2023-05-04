/* Database schema to keep the structure of entire database. */


CREATE TABLE animals (
  id INTEGER,
  name VARCHAR(255),
  species VARCHAR(255)
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL(10, 2)
);



-- Drop the existing foreign key constraint on the species column
ALTER TABLE animals DROP CONSTRAINT IF EXISTS animals_species_fkey;

-- Drop the species column
ALTER TABLE animals DROP COLUMN IF EXISTS species;

-- Modify animals table
ALTER TABLE animals
  DROP COLUMN species,
  ADD COLUMN species_id INTEGER REFERENCES species(id),
  ADD COLUMN owner_id INTEGER REFERENCES owners(id);

-- Add the species_id column and create a foreign key constraint referencing the species table
ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);

-- Add the owner_id column and create a foreign key constraint referencing the owners table
ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);

-- Set the id column as auto-incremented primary key
ALTER TABLE animals ALTER COLUMN id SET DATA TYPE INTEGER;
ALTER TABLE animals ALTER COLUMN id SET NOT NULL; -- declare id column as NOT NULL first
ALTER TABLE animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1);
ALTER TABLE animals ADD PRIMARY KEY (id);


CREATE TABLE species (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255)
);


CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255),
  age INTEGER
);

CREATE TABLE vets (
  id INTEGER PRIMARY KEY,
  name TEXT,
  age INTEGER,
  date_of_graduation DATE
);

CREATE TABLE specializations (
  vet_id INTEGER,
  species_id INTEGER,
  PRIMARY KEY (vet_id, species_id),
  FOREIGN KEY (vet_id) REFERENCES vets(id),
  FOREIGN KEY (species_id) REFERENCES species(id)
);


-- Create a table named vets
CREATE TABLE vets (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  age INTEGER,
  date_of_graduation DATE
);


-- Create a "join table" called specializations
CREATE TABLE specializations (
  vet_id INTEGER REFERENCES vets (id),
  species_id INTEGER REFERENCES species (id),
  PRIMARY KEY (vet_id, species_id)
);


-- Create a "join table" called visits
CREATE TABLE visits (
  id SERIAL PRIMARY KEY,
  animal_id INTEGER REFERENCES animals(animal_id),
  vet_id INTEGER REFERENCES vets(id),
  visit_date DATE
);


-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- changed visit_date TO date_of_visit
ALTER TABLE visits RENAME COLUMN visit_date TO date_of_visit;

