explain indexes = 1
select count(*) from v_obodinskiq.yndx_logs_ext_ch
where visitid = '100000';

explain indexes = 1
select count(*) from v_obodinskiq.yndx_logs_ext_ch_partitioned
where date = '2024-01-01';

explain indexes = 1
select count(*) from v_obodinskiq.yndx_logs_finx
where visitid = '100000';

explain indexes = 1
select count(*) from v_obodinskiq.yndx_logs_sinx
where visitid = '100000';

explain indexes = 1
select count(*) from v_obodinskiq.yndx_logs_ttl
where visitid = '100000';