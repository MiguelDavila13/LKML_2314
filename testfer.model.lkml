connection: "thelook"
include: "/*.view.lkml"
explore: inventory_items_forbreaking {
  join: products_forbreaking {
    type: left_outer
    relationship: one_to_one
    sql_on: 1=1
     {% if inventory_items_forbreaking.product_id._in_query %}
-- product_id IN QUERY
    {% endif %}
    {% if inventory_items_forbreaking.size._in_query %}
--  size IN QUERY
    {%- endif -%}
    ;;
  }
}
