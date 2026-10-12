-- Purpose: Stores meanings for coded values, including documented special response and missing-value codes.
drop table if exists dev_catalog.hrs_agent_metadata.hrs_variable_value_labels;
CREATE TABLE IF NOT EXISTS dev_catalog.hrs_agent_metadata.hrs_variable_value_labels (
    variable_id BIGINT NOT NULL COMMENT 'Reference to the variable catalog',
    value_code STRING NOT NULL COMMENT 'Source value code, stored as text to preserve representation',
    value_label STRING COMMENT 'Meaning of the coded value',
    wave_number INT COMMENT 'Wave when the label is wave-specific; NULL otherwise',
    source_page INT COMMENT 'Codebook page containing the value label',
    codebook_version STRING NOT NULL COMMENT 'Version of the Codebook used for extraction',
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP() COMMENT 'Record creation timestamp'
) USING DELTA;
-- Logical unique key: variable_id + value_code + applicable wave + codebook_version
-- If a variable's value labels change by wave, retain the wave-specific distinctions. Validate duplicates using a consistent rule for handling NULL wave values.