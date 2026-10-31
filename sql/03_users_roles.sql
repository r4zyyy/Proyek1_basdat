CREATE USER backend_dev   WITH PASSWORD 'backend123';
CREATE USER bi_dev        WITH PASSWORD 'bi123';
CREATE USER data_engineer WITH PASSWORD 'de123';

GRANT USAGE ON SCHEMA salam TO backend_dev, bi_dev;

-- backend_dev: CRUD
GRANT SELECT, INSERT, UPDATE, DELETE ON ALL TABLES IN SCHEMA salam TO backend_dev;
GRANT USAGE, SELECT ON ALL SEQUENCES IN SCHEMA salam TO backend_dev;

-- bi_dev: read only
GRANT SELECT ON ALL TABLES IN SCHEMA salam TO bi_dev;

-- data_engineer: CREATE/ALTER/DROP + CRUD (jadikan owner agar bisa DROP)
ALTER SCHEMA salam OWNER TO data_engineer;
ALTER TABLE salam.mahasiswas OWNER TO data_engineer;
ALTER SEQUENCE salam.mahasiswas_id_seq OWNER TO data_engineer;

-- Agar tabel baru buatan data_engineer otomatis bisa diakses user lain
ALTER DEFAULT PRIVILEGES FOR ROLE data_engineer IN SCHEMA salam
  GRANT SELECT, INSERT, UPDATE, DELETE ON TABLES TO backend_dev;
ALTER DEFAULT PRIVILEGES FOR ROLE data_engineer IN SCHEMA salam
  GRANT SELECT ON TABLES TO bi_dev;