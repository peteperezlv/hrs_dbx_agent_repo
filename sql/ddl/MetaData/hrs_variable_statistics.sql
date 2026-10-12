-- Purpose: Stores Codebook descriptive statistics by wave only.
DROP TABLE IF EXISTS dev_catalog.hrs_agent_metadata.hrs_variable_statistics;
CREATE TABLE IF NOT EXISTS dev_catalog.hrs_agent_metadata.hrs_variable_statistics (
    variable_id BIGINT NOT NULL COMMENT 'Reference to the variable catalog',
    wave_number INT NOT NULL COMMENT 'HRS survey wave number',
    statistic_name STRING NOT NULL COMMENT 'Statistic type, such as minimum, maximum, mean, or standard deviation',
    statistic_value DOUBLE COMMENT 'Numeric statistic reported in the Codebook',
    source_page INT COMMENT 'Codebook page containing the statistic',
    codebook_version STRING NOT NULL COMMENT 'Version of the Codebook used for extraction',
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP() COMMENT 'Record creation timestamp'
) USING DELTA;
-- Logical unique key: variable_id + wave_number + statistic_name + codebook_version
-- No cohort-level statistics or sample-size column is included because the Codebook statistics are reported by wave only and sample size is not confirmed as available.