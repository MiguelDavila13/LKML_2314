connection: "thelook"
label: "Test"

#include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

include: "/views/sold_measures.view.lkml"
include: "/views/product_analysis_mv.view.lkml"

# include: "/**/*.view.lkml"                 # include all views in this project
# include: "my_dashboard.dashboard.lookml"   # include a LookML dashboard called my_dashboard

explore: product_analysis_mv {
  label: "Product Analysis"

  join: sold_measures {
    type: left_outer
    relationship: many_to_one
    # join conditions are flexible depending on what non-return associated dimensions are in the query
    # this is a unique list per organization
    sql_on: 1=1
            {% if product_analysis_mv.carrier._in_query -%} and ${product_analysis_mv.carrier}=${sold_measures.carrier} {% endif %}
            {% if product_analysis_mv.size._in_query -%} and ${product_analysis_mv.size}=${sold_measures.destination} {% endif %}
            ;;
  }
}

view: +product_analysis_mv {
  dimension: carrier { hidden: no label: "Carrier"}
  dimension: size { hidden: no}
}

view: +sold_measures {
  derived_table: {
    sql:  select  uuid_string() as pk,
                    order_date
                  {%- if product_analysis_mv.carrier._in_query -%} , carrier {%- endif -%}
                  {%- if product_analysis_mv.size._in_query -%} , destination {%- endif -%}
                  , sum(items_sold) as sum_items_sold
          from    "demo_db.flights"
          group by  2
                  {%- if product_analysis_mv.carrier._in_query -%} , carrier {%- endif -%}
                  {%- if product_analysis_mv.size._in_query -%} , destination {%- endif -%}
                  ;;
  }
  dimension: pk {
    primary_key: yes
    hidden: yes
  }
  # declare all possible dimensions in query (hidden)
  # always include both dates
  #dimension: order_date { hidden: yes }
  dimension: carrier { hidden: yes }
  dimension: destination { hidden: yes }
}
