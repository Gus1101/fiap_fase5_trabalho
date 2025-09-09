{{ config(materialized='view') }}

with vendas_por_ano_mes as (

    SELECT
        DATE_TRUNC('month', data)::date AS mes,
        SUM(valor_total_bruto) AS total_vendas,
        SUM(lucro_liquido) AS total_lucro,
        COUNT(DISTINCT cod_pedido) AS num_pedidos
    FROM {{ ref('stg_vendas') }}
    GROUP BY DATE_TRUNC('month', data)
    ORDER BY mes

)

SELECT * FROM vendas_por_ano_mes
