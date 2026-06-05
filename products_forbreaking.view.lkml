view: products_forbreaking {
  derived_table: {
    sql:  select  id
                  {%- if inventory_items_forbreaking.product_id._in_query -%} , "PASSED" as product_id_dimention_validation {%- endif -%}
                  {%- if inventory_items_forbreaking.size._in_query -%} , "PASSED" as size_dimention_validation {%- endif -%}
                  , "No validation here" as additionaldimention
          from    demo_db.products
          group by  1
                  {%- if inventory_items_forbreaking.product_id._in_query -%}
                  -- product_id IN QUERY
                  {%- endif -%}
                  {%- if inventory_items_forbreaking.size._in_query -%}
                  -- size IN QUERY
                  {%- endif -%}
                  ;;
  }
  dimension: id {
    primary_key: yes
    type: number
  }
  dimension: product_id_dimention_validation {
    type: string
  }
  dimension: size_dimention_validation {
    type: string
  }
  dimension: additionaldimention {
    type: string
  }
 }
