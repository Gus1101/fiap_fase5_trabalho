{{ config(materialized='view') }}

with cent_dist_demanda as (

    SELECT
        centro_distribuicao,
        COUNT(DISTINCT cod_pedido) AS num_pedidos
    FROM {{ ref('stg_vendas') }}
    GROUP BY centro_distribuicao
    ORDER BY num_pedidos DESC

)

SELECT * FROM cent_dist_demanda
