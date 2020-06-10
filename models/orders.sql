
WITH payments AS (
    SELECT order_id,
    SUM(amount) AS amount
    FROM {{ref('stg_payment')}}
    WHERE status = 'success'
    GROUP BY order_id
)


SELECT o.order_id,
       o.customer_id,
       p.amount,
       o.order_date
 FROM {{ref('stg_orders')}} AS o
LEFT JOIN payments AS p
  ON p.order_id = o.order_id