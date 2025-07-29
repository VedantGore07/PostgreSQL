-- 1. Adjusting max_connections
-- -This parameter controls the maximum number of concurrent connections to the database.
ALTER SYSTEM SET max_connections = 200;
--2. Configuring shared_buffers
--This parameter determines how much memory is dedicated to PostgreSQl for caching data.
ALTER SYSTEM SET shared_buffers = '4GB';
-- 3. Tuning work_mem
-- -This parameter sets the amount of memory to be used by internal sort operations and hash tables before writ
ALTER SYSTEM SET work_mem = ' 64MB';
-- -4. Setting maintenance_work_mem
--This parameter specifies the maximum amount of memory to be used for maintenance operations, such as VACUUM
ALTER SYSTEM SET maintenance_work_mem = ' 1GB';
--5. Optimizing autovacuum settings
--Ensure that the autovacuum process is properly configured to maintain database health.
ALTER SYSTEM SET autovacuum = 'on';
ALTER SYSTEM SET autovacuum_naptime = '1min';
ALTER SYSTEM SET autovacuum_vacuum_threshold = 50;
ALTER SYSTEM SET autovacuum_analyze_threshold = 50;
--6. Using pg prewarm extension
--This extension can be used to load relation data into the buffer cache on server start.
CREATE EXTENSION pg_prewarm;
-- -7. Monitoring and adjusting checkpoint settings
-- these settings control the frequency and behaviour of checkpoints, which can impact performance.
ALTER SYSTEM SET checkpoint_timeout = '15min';
ALTER SYSTEM SET checkpoint_completion_target = 0.9;



select pg_reload_conf();