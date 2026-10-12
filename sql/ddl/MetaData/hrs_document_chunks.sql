-- Purpose: Stores searchable Codebook text passages for AI Agent retrieval and source-grounded responses.
DROP TABLE IF EXISTS dev_catalog.hrs_agent_metadata.hrs_document_chunks;
CREATE TABLE IF NOT EXISTS dev_catalog.hrs_agent_metadata.hrs_document_chunks (
    chunk_id BIGINT GENERATED ALWAYS AS IDENTITY COMMENT 'Surrogate identifier for the document chunk',
    document_id STRING NOT NULL COMMENT 'Stable identifier for the source document',
    page_number INT NOT NULL COMMENT 'One-based PDF page number',
    chunk_index INT COMMENT 'Sequence number of the chunk within the document or page',
    section_heading STRING COMMENT 'Codebook section or subsection heading',
    chunk_text STRING NOT NULL COMMENT 'Extracted text passage for search and retrieval',
    codebook_version STRING NOT NULL COMMENT 'Version of the Codebook used for extraction',
    created_timestamp TIMESTAMP DEFAULT CURRENT_TIMESTAMP() COMMENT 'Record creation timestamp'
) USING DELTA;
-- Identifier: chunk_id
-- The existing hrs_document_pages table remains the page-level extraction archive. This table stores smaller text passages prepared for search and retrieval.