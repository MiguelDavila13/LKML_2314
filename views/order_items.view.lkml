# The name of this view in Looker is "Order Items"
view: order_items {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.order_items ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    hidden: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Inventory Item ID" in Explore.

  dimension: inventory_item_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.inventory_item_id ;;
  }

  dimension: order_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.order_id ;;
  }

  dimension: phone {
    type: string
    sql: ${TABLE}.phone ;;
  }

  dimension: phones {
    type: string
    sql: ${TABLE}.phones;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: returned {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.returned_at ;;

  }

  dimension: date_testing{
    type: string
    # sql: ${returned_date}} ;;
    order_by_field: returned_week
    sql: CONCAT('w/e ',${returned_week}) ;;
  }

  dimension: date_testing2 {
    type: string
    order_by_field: returned_week
    sql: DATE_FORMAT(${returned_week}, '%d-%m-%Y') ;;
  }

  dimension_group: created {
    type: time
    view_label: "_PoP"
    timeframes: [
      raw,
      time,
      hour_of_day,
      date,
      day_of_week,
      day_of_week_index,
      day_of_month,
      day_of_year,
      week,
      week_of_year,
      month,
      month_name,
      month_num,
      quarter,
      year
    ]
    sql: ${TABLE}.created_at ;;
    convert_tz: no
  }

  dimension: wtd_only {
    group_label: "To-Date Filters"
    label: "WTD"
    view_label: "_PoP"
    type: yesno
    sql:  (EXTRACT(DOW FROM ${created_raw}) < EXTRACT(DOW FROM GETDATE())
                    OR
                (EXTRACT(DOW FROM ${created_raw}) = EXTRACT(DOW FROM GETDATE()) AND
                EXTRACT(HOUR FROM ${created_raw}) < EXTRACT(HOUR FROM GETDATE()))
                    OR
                (EXTRACT(DOW FROM ${created_raw}) = EXTRACT(DOW FROM GETDATE()) AND
                EXTRACT(HOUR FROM ${created_raw}) <= EXTRACT(HOUR FROM GETDATE()) AND
                EXTRACT(MINUTE FROM ${created_raw}) < EXTRACT(MINUTE FROM GETDATE())))  ;;
  }

  dimension: mtd_only {
    group_label: "To-Date Filters"
    label: "MTD"
    view_label: "_PoP"
    type: yesno
    sql:  (EXTRACT(DAY FROM ${created_raw}) < EXTRACT(DAY FROM GETDATE())
                    OR
                (EXTRACT(DAY FROM ${created_raw}) = EXTRACT(DAY FROM GETDATE()) AND
                EXTRACT(HOUR FROM ${created_raw}) < EXTRACT(HOUR FROM GETDATE()))
                    OR
                (EXTRACT(DAY FROM ${created_raw}) = EXTRACT(DAY FROM GETDATE()) AND
                EXTRACT(HOUR FROM ${created_raw}) <= EXTRACT(HOUR FROM GETDATE()) AND
                EXTRACT(MINUTE FROM ${created_raw}) < EXTRACT(MINUTE FROM GETDATE())))  ;;
  }

  dimension: ytd_only {
    group_label: "To-Date Filters"
    label: "YTD"
    view_label: "_PoP"
    type: yesno
    sql:  (EXTRACT(DOY FROM ${created_raw}) < EXTRACT(DOY FROM GETDATE())
                    OR
                (EXTRACT(DOY FROM ${created_raw}) = EXTRACT(DOY FROM GETDATE()) AND
                EXTRACT(HOUR FROM ${created_raw}) < EXTRACT(HOUR FROM GETDATE()))
                    OR
                (EXTRACT(DOY FROM ${created_raw}) = EXTRACT(DOY FROM GETDATE()) AND
                EXTRACT(HOUR FROM ${created_raw}) <= EXTRACT(HOUR FROM GETDATE()) AND
                EXTRACT(MINUTE FROM ${created_raw}) < EXTRACT(MINUTE FROM GETDATE())))  ;;
  }

  dimension: sale_price {
    label: "Total Phased EPI GBP"
    type: number
    sql: ${TABLE}.sale_price ;;
   value_format_name: gbp_0
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: average_sale_price {
    type: average
    sql: ${sale_price} ;;
  }

  measure: count {
    label: "Count of order_items"
    type: count
    hidden: yes
  }

  measure: count_orders {
    label: "Count of orders"
    type: count_distinct
    sql: ${order_id} ;;
    hidden: yes
  }

  measure: total_sale_price {
    label: "Total Sales"
    view_label: "_PoP"
    type: sum
    sql: ${sale_price} ;;
    value_format_name: usd
    drill_fields: [created_date]
  }
}
