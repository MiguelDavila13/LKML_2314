view: product_analysis_mv {
  sql_table_name: demo_db.flights ;;
  fields_hidden_by_default: yes

  #Color was changed for carrier
  dimension: carrier {
    type: string
    sql: ${TABLE}.carrier ;;
  }

  #size was changed for destination
  dimension: destination {
    type: string
    sql: ${TABLE}.destination ;;
  }
  #dimension: order_date {
  #  type: date
  #  sql: ${TABLE}."ORDER_DATE" ;;
  #}
}
