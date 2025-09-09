{{ config(materialized='view') }}

with vendas_valor_categoria as (

    SELECT
        categoriaprod,
        SUM(valor_total_bruto) AS valor_total
    FROM {{ ref('stg_vendas') }}
    GROUP BY categoriaprod
    ORDER BY valor_total DESC

)

SELECT * FROM vendas_valor_categoria
