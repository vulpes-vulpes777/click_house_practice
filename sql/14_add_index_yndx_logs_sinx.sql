-- Добавляем вторичный индекс
alter table v_obodinskiq.yndx_logs_sinx
add index idx_rand_string rand_string type bloom_filter granularity 4;

-- Материализация индекса
alter table v_obodinskiq.yndx_logs_sinx materialize index idx_rand_string;