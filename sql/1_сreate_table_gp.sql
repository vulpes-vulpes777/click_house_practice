-- создаём схему в GP
create schema v_obodinskiq;

-- создаём таблицу
create table v_obodinskiq.yndx_logs_cp as
select * from stg.yndx_logs_ext
distributed randomly;