select
    id as payment_id,
    orderid AS order_id,
    paymentmethod,
    status,
    amount/100 AS amount,
    created

from {{ source('stripe', 'payment') }}