# The name of this view in Looker is "Users"
view: users {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.users ;;
  drill_fields: [id]

  # This primary key is the unique key for this table in the underlying database.
  # You need to define a primary key in a view in order to join to other views.

  dimension: id {
    primary_key: yes
    type: number
    sql: ${TABLE}.id ;;
  }
    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Age" in Explore.

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }

  measure: maxtest {
    type: string
    sql: MAX(${TABLE}.city) ;;
  }

  measure: nomaxtest {
    type: string
    sql: ${TABLE}.city ;;
  }

  measure: maxdate {
    type: date
    sql: MAX(${created_raw}) ;;
  }

  dimension: test {
    case: {
      when: {
        sql: 1 ;;
        label: "testing and declaring"
      }
      when: {
        sql: 2 ;;
        label: "asfdasdfasf"
      }
    }
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_age {
    type: sum
    sql: ${age} ;;  }
  measure: average_age {
    type: average
    sql: ${age} ;;  }

  dimension: city {
    type: string
    suggest_persist_for: "0 seconds"
    sql: ${TABLE}.city ;;

    #link: {
    #  label: "Link to PDF"
    #  url: "http://www.google.com/search?q={{users.state}}"
    #  icon_url: "http://google.com/favicon.ico"
    #}

  }

  dimension: pdf_name {
    type: string
    sql: ${TABLE}.pdf_name ;;
    #link: {
    #  label: "Link to PDF"
    #  url: "{{HERE_YOUR_VIEW.pdf_link}}"
    #}
  }

  dimension: test_field {
    type: string
    sql: "" ;;
  }

  measure: test_measure {
    type: count
    filters: [test_field: ""]
  }

  dimension: country {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.country ;;
  }
  # Dates and timestamps can be represented in Looker using a dimension group of type: time.
  # Looker converts dates and timestamps to the specified timeframes within the dimension group.

  dimension_group: created {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year, fiscal_quarter]
    sql: ${TABLE}.created_at ;;
  }

  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }

  dimension: first_name {
    type: string
    sql: ${TABLE}.first_name ;;
  }

  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }

  dimension: last_name {
    type: string
    sql: ${TABLE}.last_name ;;
  }

  dimension: state {
    type: string
    map_layer_name: us_states
    sql: ${TABLE}.state ;;
    map_layer_name: us_states
  }

  dimension: testQuarter {
    type: number
    value_format_name: usd_0
    sql: CASE
        WHEN ${created_fiscal_quarter} =
        (DATE_FORMAT(TIMESTAMP(CONCAT(CAST(YEAR(DATE_ADD(TIMESTAMP(DATE_FORMAT(users.created_at ,'%Y-%m-01')),
        INTERVAL -1 month)) AS CHAR), '-',
        LPAD(CAST(((QUARTER(DATE_ADD(TIMESTAMP(DATE_FORMAT(users.created_at ,'%Y-%m-01')),
        INTERVAL -1 month)) - 1) * 3) + 1 AS CHAR), 2, '0'), '-01')),'%Y-%m')) THEN 10
        ElSE 0 END;;
  }

  dimension: zip {
    type: zipcode
    sql: ${TABLE}.zip ;;
  }
  measure: count {
    type: count
    drill_fields: [test3*]
  }

  set: test1 {
    fields: [id,last_name]
  }

  set: tes2 {
    fields: [first_name, city]
  }

  set: test3 {
    fields: [test1*, state, tes2*]
  }

  set: ALL_FIELDS {
    fields:
    [test_measure]
  }

  # ----- Sets of fields for drilling ------
  set: detail {
    fields: [
  id,
  last_name,
  count,
  first_name,
  events.count,
  orders.count,
  saralooker.count,
  sindhu.count,
  user_data.count
  ]
  }

}
