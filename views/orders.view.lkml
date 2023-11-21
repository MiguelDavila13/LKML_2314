# The name of this view in Looker is "Orders"
view: orders {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.orders ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.created_at ;;
  }

  dimension: minutes_after_midnight_test {
    type: number
    sql: EXTRACT(HOUR FROM ${TABLE}.created_at) * 60 + EXTRACT(MINUTE FROM ${TABLE}.created_at) ;;
  }

  measure: avr_time {
    type: number
    sql: AVG(EXTRACT(HOUR FROM ${TABLE}.created_at) * 60 + EXTRACT(MINUTE FROM ${TABLE}.created_at)) ;;
   # value_format_name: "hh:mm A"
    html:
    {% assign hours = value | divided_by:60 %}
    {% assign minutes = value | modulo: 60 | floor %}
    {% if hours < 12 %}
    {{hours | floor}}:{{minutes | round:0 | prepend: '0' | slice: -2,2}} AM
    {% elsif hours == 12 %}
    {{hours | floor | minus: 12}}:{{minutes | round:0 | prepend: '0' | slice: -2,2}} PM
    {% else %}
    {{hours | floor | minus: 12}}:{{minutes | round:0 | prepend: '0' | slice: -2,2}} PM
    {% endif %}
    ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Status" in Explore.

  dimension: status {
    type: string
    sql: ${TABLE}.status ;;
  }

  dimension: user_id {
    type: number
    # hidden: yes
    sql: ${TABLE}.user_id ;;
  }
  measure: count {
    type: count
    drill_fields: [detail*]
  }

  measure: returned_count {
    type: count_distinct
    sql: ${id} ;;
    #filters: [status: "COMPLETED"]
    drill_fields: [detail_2*]
    link: {
      label: "Explore Top 20"
      url: "{{ link }}&sorts=orders.created_date+desc,products.item_name+asc&limit=20"
    }
  }

  measure: count_test {
    type: count_distinct
    sql: ${id} ;;
    drill_fields: [id, created_date, status]
    link: {
      label: "Drill as line"
      url: "
      {% assign vis_config = '{\"type\": \"looker_line\"}' %}
      {{ link }}&vis_config={{ vis_config | encode_uri }}&toggle=dat,pik,vis&limit=5000"
 # \{\{ link \}\}&vis_config=\{\{ vis_config | encode_uri \}\}&toggle=dat,pik,vis&limit=5000"
}
}

  set: detail_2 {
    fields: [id, status, created_date, products.brand, products.item_name, users.email]
  }

  measure: count_cancelled {
    type: number
    sql: COUNT(IF(${status} = "CANCELLED", ${id},0)) ;;
  }

  measure: count_cancelled_status {
    type: count_distinct
    sql: IF(${status} = "CANCELLED", ${id}, null) ;;
  }

  measure: count_completed_status {
    type: count_distinct
    sql: IF(${status} = "COMPLETED", ${id}, null) ;;
  }

  measure: count_pending_status {
    type: count_distinct
    sql: IF(${status} = "PENDING", ${id}, null) ;;
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  users.id,
  users.first_name,
  users.last_name,
  billion_orders.count,
  fakeorders.count,
  hundred_million_orders.count,
  hundred_million_orders_wide.count,
  order_items.count,
  order_items_vijaya.count,
  ten_million_orders.count
  ]
  }

}
