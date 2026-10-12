-- Purpose: Records documented variable applicability by HRS cohort. Populate only when cohort-level coverage is supported by the Codebook or approved documentation.
DROP TABLE IF EXISTS dev_catalog.hrs_agent_metadata.hrs_variable_cohort_coverage;
CREATE TABLE IF NOT EXISTS dev_catalog.hrs_agent_metadata.hrs_variable_cohort_coverage (
    variable_id BIGINT NOT NULL COMMENT 'Reference to the variable catalog',
    hacohort_number INT NOT NULL COMMENT 'HRS cohort identifier',
    coverage_status STRING COMMENT 'Documented availability or applicability status',
    source_page INT COMMENT 'Codebook page supporting the coverage information',
    codebook_version STRING NOT NULL COMMENT 'Version of the Codebook used for extraction',
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP() COMMENT 'Record creation timestamp'
) USING DELTA;
-- Logical unique key: variable_id + hacohort_number + codebook_version