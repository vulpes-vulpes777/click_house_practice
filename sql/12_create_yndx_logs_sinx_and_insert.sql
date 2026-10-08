create table v_obodinskiq.yndx_logs_sinx
(
    date Date32,
    dt DateTime64,
    visitid String,
    rand_string String,
    isnewuser Int64,
    starturl  String,
    endurl String,
    pageviews Int64,
    visitduration Int64,
    regioncountry String,
    regioncity String,
    clientid String,
    ipaddress String,
    clienttimezone Int64,
    devicecategory Int64,
    mobilephone String,
    mobilephonemodel String,
    operatingsystem String,
    browser String
)
engine = MergeTree()
order by (visitid, date);

insert into v_obodinskiq.yndx_logs_sinx
select
    toDate('2024-01-01') + (number % 365) as date,
    toDateTime('2024-01-01 00:00:00') + (number % 31536000) as dt,
    number + 1 as visitid,
    concat('str_', toString(rand() % 1000000)) as rand_string,
    number % 2 as isnewuser,
    concat('https://astondevs.ru/page/', toString(number % 1000)) as starturl,
    concat('https://astondevs.ru/page/', toString(number % 500)) as endurl,
    (number % 50) + 1 as pageviews,
    (number % 3600) + 1 as visitduration,
    ['Uzbekistan', 'Russia', 'Belarus', 'Kazakhstan', 'Serbia'][(number % 5) + 1] as regioncountry,
    concat('city_', toString(number % 100)) as regioncity,
    (number % 1000000) + 1 as clientid,
    concat(toString(number % 256), '.', toString(number % 256), '.', toString(number % 256), '.', toString(number % 256)) as ipaddress,
    (number % 24) - 12 as clienttimezone,
    number % 5 as devicecategory,
    concat('+7', toString(number % 10000000000)) as mobilephone,
    ['iPhone', 'Samsung', 'Xiaomi', 'Huawei'][(number % 4) + 1] as mobilephonemodel,
    ['iOS', 'Android', 'Windows', 'macOS'][(number % 4) + 1] as operatingsystem,
    ['Chrome', 'Safari', 'Firefox', 'Edge'][(number % 4) + 1] as browser
from numbers(10000000);

-- Оптимизируем таблицу после вставки 10 миллионов строк было 5 частей, а должна была быть одна
optimize table v_obodinskiq.yndx_logs_sinx final;