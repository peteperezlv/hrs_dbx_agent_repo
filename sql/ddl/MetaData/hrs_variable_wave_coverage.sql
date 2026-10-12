-- Purpose: Records documented variable availability by survey wave.
drop table if exists dev_catalog.hrs_agent_metadata.hrs_variable_wave_coverage;
CREATE TABLE IF NOT EXISTS dev_catalog.hrs_agent_metadata.hrs_variable_wave_coverage (
    variable_id BIGINT NOT NULL COMMENT 'Reference to the variable catalog',
    wave_number INT NOT NULL COMMENT 'HRS survey wave number',
    survey_year INT COMMENT 'Survey year associated with the wave',
    coverage_status STRING COMMENT 'Documented availability or applicability status',
    source_page INT COMMENT 'Codebook page supporting the coverage information',
    codebook_version STRING NOT NULL COMMENT 'Version of the Codebook used for extraction',
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP() COMMENT 'Record creation timestamp'
) USING DELTA;
-- Logical unique key: variable_id + wave_number + codebook_version