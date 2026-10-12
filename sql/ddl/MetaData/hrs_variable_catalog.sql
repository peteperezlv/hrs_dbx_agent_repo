-- Purpose: Stores master definitions and Codebook references for RAND HRS variables.
DROP TABLE IF EXISTS dev_catalog.hrs_agent_metadata.hrs_variable_catalog;
CREATE TABLE IF NOT EXISTS dev_catalog.hrs_agent_metadata.hrs_variable_catalog (
    variable_id BIGINT GENERATED ALWAYS AS IDENTITY COMMENT 'Surrogate identifier for a variable definition',
    variable_name STRING NOT NULL COMMENT 'RAND HRS source variable name',
    variable_label STRING COMMENT 'Variable label documented in the Codebook',
    definition STRING COMMENT 'Description of the variable and what it measures',
    survey_section STRING COMMENT 'Codebook subject area or survey section',
    measurement_unit STRING COMMENT 'Measurement unit when documented',
    source_page INT COMMENT 'Codebook page supporting the variable definition',
    codebook_version STRING NOT NULL COMMENT 'Version of the Codebook used for extraction',
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP() COMMENT 'Record creation timestamp',
    updated_timestamp TIMESTAMP COMMENT 'Timestamp of the last metadata update'
) USING DELTA;
-- Logical unique key: variable_name + codebook_version.  Enfore via DML.