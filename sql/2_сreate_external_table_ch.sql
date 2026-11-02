-- создание схемы
create database if not exists v_obodinskiq;

-- создание именованной коллекции 
create named collection gp_creds_v_obodinskiq as
	host = 'test',
	port = test,
	database = 'test',
	user = 'test',
	password = 'test' not overridable,
	schema = 'test';

-- создание внешней таблицы в ClickHouse, используя движок PostgreSQL
create table v_obodinskiq.yndx_logs_ext
as postgresql(gp_creds_v_obodinskiq, table = 'yndx_logs_cp');
