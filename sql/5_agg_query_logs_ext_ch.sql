-- Запрос 1. Запрос на агрегацию - простой count с группировкой, длительность 0.11 секунд
select
 	regioncountry, 
	count(*) as cnt_rc_visits
from v_obodinskiq.yndx_logs_ext_ch
group by regioncountry
order by cnt_rc_visits;

-- Запрос 2. Агрегация с фильтрацией по дате, длительность 0.095 секунд
select
    toStartOfMonth(date) as month_dt,
    regioncountry,
    sum(pageviews) as total_pageviews,
    avg(visitduration) as avg_duration
from v_obodinskiq.yndx_logs_ext_ch
where date >= '2024-06-01' and date < '2024-07-01'
group by month_dt, regioncountry
order by total_pageviews desc;

-- Запрос 3. Агрегация по высококардинальному столбцу, длительность 0.58 секунд
select
    clientid,
    count(*) as visits,
    sum(pageviews) as total_pageviews
from v_obodinskiq.yndx_logs_ext_ch
group by clientid
order by total_pageviews desc
limit 100;