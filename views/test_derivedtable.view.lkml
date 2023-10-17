# If necessary, uncomment the line below to include explore_source.
# include: "alexo_23_16.model.lkml"

view: test_derivedtable {
  derived_table: {
    explore_source: order_items {
      column: count {}
      column: city { field: users.city }
      derived_column: pk {
        sql: 1 = 1 ;;
      }
      bind_all_filters: yes

    }
  }
  dimension: count {
    description: ""
    type: number
  }
  dimension: city {
    description: ""
  }

  dimension: overall_price_bucket {
    type: string
    sql:  CASE WHEN ${count} <= 500 then 'Bottom'
                WHEN ${count} >500 and ${count} <= 650 then 'Below Average'
                WHEN ${count} > 650 and ${count} <= 1000 then 'Average'
                WHEN ${count} > 1000 then 'Top'
                END;;
    hidden: yes

  }
}
