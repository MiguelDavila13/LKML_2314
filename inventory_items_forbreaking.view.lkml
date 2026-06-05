view: inventory_items_forbreaking {
  sql_table_name: demo_db.inventory_items ;;
  dimension:  product_id{
    type: number
    sql: ${TABLE}.product_id ;;
  }
  dimension: size {
    type: string
    sql: "LARGE" ;;
  }

}
