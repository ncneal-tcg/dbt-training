WITH payments AS (
    SELECT 
        id AS payment_id,
        orderid AS order_id,
        paymentmethod AS payment_method,
        created,
        status,
        amount
    FROM dbt.dbt_nneal.stripe_payment
)

SELECT * FROM payments