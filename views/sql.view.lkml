view: sql {
    derived_table: {
      sql: SELECT
          order_items.order_id  AS `order_items.order_id`,
          order_items.sale_price  AS `order_items.sale_price`,
          orders.status  AS `orders.status`
      FROM demo_db.order_items  AS order_items
      LEFT JOIN demo_db.orders  AS orders ON order_items.order_id = orders.id
      GROUP BY
          1,
          2,
          3
      ORDER BY
          1
      LIMIT 500 ;;
    }

    measure: count {
      type: count
      drill_fields: [detail*]
    }

    dimension: order_items_order_id {
      type: number
      sql: ${TABLE}.`order_items.order_id` ;;
    }

    dimension: order_items_sale_price {
      type: number
      sql: ${TABLE}.`order_items.sale_price` ;;
    }

    dimension: orders_status {
      type: string
      sql: ${TABLE}.`orders.status` ;;
    }

    dimension: concat_tes {
      type: string
      sql: concat(${order_items_sale_price}," -- ",${orders_status}) ;;
      drill_fields: [detail*]
    }

    set: detail {
      fields: [
        concat_tes,
        order_items_order_id,
        order_items_sale_price,
        orders_status
      ]
    }
  }
