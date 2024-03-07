view: derivedtest {
#   # Or, you could make this view a derived table, like this:
   derived_table: {
     sql: SELECT
         *
       FROM demo_db.flights as flights
       WHERE flight_num = (flight_num)
       ;;
      sql_trigger_value: 1 ;;
      indexes: ["flight_num"]
   }

  parameter: param_test {
    type: string

  suggestions: ["test1","test2"]
  }

  dimension: arr_delay {
    type: number

    sql: ${TABLE}.arr_delay ;;
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_arr_delay {
    type: sum
    sql: ${arr_delay} ;;  }
  measure: average_arr_delay {
    type: average
    sql: ${arr_delay} ;;  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: arr {
    type: time
    datatype: timestamp
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.arr_time ;;
    allow_fill: yes
  }

  dimension: cancelled {
    type: string
    sql: ${TABLE}.cancelled ;;
  }

  dimension: carrier {
    type: string
    sql: ${TABLE}.carrier ;;
    link: {
      label: "testing down"
      url: "https://gcpl2314.cloud.looker.com/browse"
    }
  }

  dimension: dep_delay {
    type: number
    sql: ${TABLE}.dep_delay ;;
  }

  dimension_group: dep {
    type: time
    datatype: date
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dep_time ;;
  }

  dimension: destination {
    type: string
    sql: ${TABLE}.destination ;;
  }

  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
  }

  dimension: diverted {
    type: string
    sql: ${TABLE}.diverted ;;
  }

  dimension: flight_num {
    type: string
    sql: ${TABLE}.flight_num ;;
  }

  dimension: flight_time {
    type: number
    sql: ${TABLE}.flight_time ;;
  }

  dimension: id2 {
    type: number
    sql: ${TABLE}.id2 ;;
  }

  dimension: origin {
    type: string
    sql: ${TABLE}.origin ;;
  }

  dimension: tail_num {
    type: string
    sql: ${TABLE}.tail_num ;;
  }

  dimension: taxi_in {
    type: number
    sql: ${TABLE}.taxi_in ;;
  }

  dimension: taxi_out {
    type: number
    sql: ${TABLE}.taxi_out ;;
  }
  measure: count {
    type: count
  }
}
