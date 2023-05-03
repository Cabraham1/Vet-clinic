/* Database schema to keep the structure of entire database. */

CREATE TABLE animals (
    name varchar(100)
);

CREATE TABLE animals (
  id INTEGER,
  name VARCHAR(255),
  species VARCHAR(255)
  date_of_birth DATE,
  escape_attempts INTEGER,
  neutered BOOLEAN,
  weight_kg DECIMAL(10, 2)
);


CREATE TABLE owners (
  id SERIAL PRIMARY KEY,
  full_name VARCHAR(255),
  age INTEGER
);


-- Drop the existing foreign key constraint on the species column
ALTER TABLE animals DROP CONSTRAINT IF EXISTS animals_species_fkey;

-- Drop the species column
ALTER TABLE animals DROP COLUMN IF EXISTS species;

-- Add the species_id column and create a foreign key constraint referencing the species table
ALTER TABLE animals ADD COLUMN species_id INTEGER REFERENCES species(id);

-- Add the owner_id column and create a foreign key constraint referencing the owners table
ALTER TABLE animals ADD COLUMN owner_id INTEGER REFERENCES owners(id);

-- Set the id column as auto-incremented primary key
ALTER TABLE animals ALTER COLUMN id SET DATA TYPE INTEGER;
ALTER TABLE animals ALTER COLUMN id SET NOT NULL; -- declare id column as NOT NULL first
ALTER TABLE animals ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (START WITH 1 INCREMENT BY 1);
ALTER TABLE animals ADD PRIMARY KEY (id);
