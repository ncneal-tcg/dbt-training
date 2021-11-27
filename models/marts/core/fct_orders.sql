with orders as (
    select * from {{ ref('stg_orders') }}
),

payments as (
    select * from {{ ref('stg_payments') }}
),

final as (
    select 
        orders.order_id,
        orders.customer_id,
        sum(payments.amount) as amount
    from orders
    left join payments
        on orders.order_id = payments.order_id
    group by 1,2
)

select * from final