-- создание схемы
create database if not exists v_obodinskiq;

-- создание именованной коллекции 
create named collection gp_creds_v_obodinskiq as
	host = '172.17.1.74',
	port = 5432,
	database = 'postgres',
	user = 'postgres',
	password = 'postgres' not overridable,
	schema = 'v_obodinskiq';

-- создание внешней таблицы в ClickHouse, используя движок PostgreSQL
create table v_obodinskiq.yndx_logs_ext
as postgresql(gp_creds_v_obodinskiq, table = 'yndx_logs_cp');