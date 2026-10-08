-- Проверка производительности
explain indexes = 1
select
    count(*)
from v_obodinskiq.yndx_logs_ext_ch_partitioned
where date >= '2024-06-01' and date < '2024-12-01';