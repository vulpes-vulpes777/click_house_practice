-- Запрос
explain indexes = 1
select * from v_obodinskiq.yndx_logs_sinx where rand_string = 'str_123456';

-- Результат запроса до создания индекса
Expression ((Project names + Projection))
  Expression ((WHERE + Change column names to column identifiers))
    ReadFromMergeTree (v_obodinskiq.yndx_logs_sinx)
    Indexes:
      PrimaryKey
        Condition: true
        Parts: 1/1
        Granules: 1224/1224
      Ranges: 1

-- Вывода после создания индекса нет, но сохранены ключевые выводы по метрикам.
-- Выводы в отчёте.
