with cte_vendas as (
    
    select *
    from {{source("postgres","vendas")}}

)

select * from cte_vendas