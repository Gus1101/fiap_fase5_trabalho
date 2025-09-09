{{ config(materialized='view') }}

with vendas_valor_por_estado as (

    select
        estado,
        regiao_pais,
        count(distinct cod_pedido) as num_pedidos
    from {{ ref('stg_vendas') }}
    group by estado, regiao_pais
    having count(distinct cod_pedido) > 8000

)

select *
from vendas_valor_por_estado
order by num_pedidos desc
