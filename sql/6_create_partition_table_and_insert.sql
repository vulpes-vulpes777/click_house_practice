-- Создание партиционированной таблицы
create table v_obodinskiq.yndx_logs_ext_ch_partitioned
(
    date Date32,
    dt DateTime64,
    visitid String,
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
partition by toYYYYMM(date)
order by (visitid, date);

-- Перенос данных 9.15 секунд, время вставки увеличено, вероятно из-за партиционирования
insert into v_obodinskiq.yndx_logs_ext_ch_partitioned
select * from v_obodinskiq.yndx_logs_ext_ch;