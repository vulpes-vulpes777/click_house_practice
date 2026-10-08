-- смотрим метаданные
show create table v_obodinskiq.yndx_logs_ext;

-- смотрим схему метаданных	
CREATE TABLE v_obodinskiq.yndx_logs_ext
(
    `date` Nullable(Date32),
    `dt` Nullable(DateTime64(6)),
    `visitid` Nullable(String),
    `isnewuser` Nullable(Int64),
    `starturl` Nullable(String),
    `endurl` Nullable(String),
    `pageviews` Nullable(Int64),
    `visitduration` Nullable(Int64),
    `regioncountry` Nullable(String),
    `regioncity` Nullable(String),
    `clientid` Nullable(String),
    `ipaddress` Nullable(String),
    `clienttimezone` Nullable(Int64),
    `devicecategory` Nullable(Int64),
    `mobilephone` Nullable(String),
    `mobilephonemodel` Nullable(String),
    `operatingsystem` Nullable(String),
    `browser` Nullable(String)
) AS postgresql(gp_creds_v_obodinskiq, `table` = 'yndx_logs_cp')

-- создание новой таблицы v_obodinskiq.yndx_logs_ext_ch
create table v_obodinskiq.yndx_logs_ext_ch
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
order by (visitid, date);