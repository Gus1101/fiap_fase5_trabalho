{{ config(materialized='view') }}

with ranking_formas_pagamento as (

    SELECT
        formapagto,
        COUNT(*) AS num_transacoes
    FROM {{ ref('stg_vendas') }}
    GROUP BY formapagto
    ORDER BY num_transacoes DESC

)

SELECT * FROM ranking_formas_pagamento