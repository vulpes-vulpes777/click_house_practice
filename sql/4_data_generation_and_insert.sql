-- генерация и вставка данных, 6.21 секунд
insert into v_obodinskiq.yndx_logs_ext_ch
select
    toDate('2024-01-01') + (number % 365) AS date,
    toDateTime('2024-01-01 00:00:00') + (number % 31536000) AS dt,
    number + 1 AS visitid,
    number % 2 AS isnewuser,
    concat('https://astondevs.ru/page/', toString(number % 1000)) AS starturl,
    concat('https://astondevs.ru/page/', toString(number % 500)) AS endurl,
    (number % 50) + 1 AS pageviews,
    (number % 3600) + 1 AS visitduration,
    ['Uzbekistan', 'Russia', 'Belarus', 'Kazakhstan', 'Serbia'][(number % 5) + 1] AS regioncountry,
    concat('city_', toString(number % 100)) AS regioncity,
    (number % 1000000) + 1 AS clientid,
    concat(toString(number % 256), '.', toString(number % 256), '.', toString(number % 256), '.', toString(number % 256)) AS ipaddress,
    (number % 24) - 12 AS clienttimezone,
    number % 5 AS devicecategory,
    concat('+7', toString(number % 10000000000)) AS mobilephone,
    ['iPhone', 'Samsung', 'Xiaomi', 'Huawei'][(number % 4) + 1] AS mobilephonemodel,
    ['iOS', 'Android', 'Windows', 'macOS'][(number % 4) + 1] AS operatingsystem,
    ['Chrome', 'Safari', 'Firefox', 'Edge'][(number % 4) + 1] AS browser
from numbers(10000000);