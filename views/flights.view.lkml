# The name of this view in Looker is "Flights"
view: flights {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: demo_db.flights ;;

  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

    # Here's what a typical dimension looks like in LookML.
    # A dimension is a groupable field that can be used to filter query results.
    # This dimension will be called "Arr Delay" in Explore.

  dimension: arr_delay {
    type: number
    sql: ${TABLE}.arr_delay ;;
  }

  parameter: dimensions_parameter {
    label: "Select Dimension"
    view_label: "Braze Dimension"
    type: string
    allowed_value: {label: "Channel" value: "channel"}
    allowed_value: {label: "Audience" value: "audience"}
    allowed_value: {label: "Creative Type" value: "creativetype"}
    allowed_value: {label: "Creative" value: "creative"}
    allowed_value: {label: "Campaign Name" value: "campaignname"}
  }

  dimension: dashboard_buttons_delivery {
    label: "Button Dim Delivery"
    view_label: "Button Dashboard"
    type: string
    sql: "button dimension delivery" ;;
    html:
      {%- assign dim_raw = dimensions_parameter._parameter_value | remove: "'" | remove: '"' | remove: "%27" | strip -%}

      {% if dim_raw == blank %}{% assign dim_raw = _filters['flights.dimensions_parameter'] | remove: "'" | remove: '"' | strip %}{% endif %}

      {% if dim_raw == 'channel' %}{% assign dim_link = 'channel' %}
      {% elsif dim_raw == 'audience' %}{% assign dim_link = 'audience' %}
      {% elsif dim_raw == 'creativetype' %}{% assign dim_link = 'creativetype' %}
      {% elsif dim_raw == 'creative' %}{% assign dim_link = 'creative' %}
      {% elsif dim_raw == 'campaignname' %}{% assign dim_link = 'campaignname' %}
      {% else %}{% assign dim_link = dim_raw %}
      {% endif %}

      <div style="display: flex; gap: 10px; padding: 10px 0; flex-wrap: wrap;">
      <a href="/dashboards/jpsOcExyezXRbZgU4fpctZ?tab_name=Delivery&Messages+Sent=%3E%3D200&Select+Dimension={{ dim_link }}"style="padding: 6px 16px; border-radius: 6px; text-decoration: none; border: 1px solid #d1d5db; background-color: white; color: #4B5563;">Message Sent</a>

      <a href="/dashboards/jpsOcExyezXRbZgU4fpctZ?tab_name=Delivery&Messages+Sent=%3E%3D200&Select+Dimension={{ dim_link }}"style="padding: 6px 16px; border-radius: 6px; text-decoration: none; border: 1px solid #d1d5db; background-color: white; color: #4B5563;">Open Rate %</a>

      <a href="/dashboards/jpsOcExyezXRbZgU4fpctZ?tab_name=Delivery&Messages+Sent=%3E%3D200&Select+Dimension={{ dim_link }}"style="padding: 6px 16px; border-radius: 6px; text-decoration: none; border: 1px solid #d1d5db; background-color: white; color: #4B5563;">CTR %</a>

      ;;
  }

  measure: tooltip_test {
    type: count
    html: <span title="test">{{rendered_value}}</span> ;;
  }

  #testing

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
    timeframes: [time, month, year]
    datatype: timestamp
    sql: ${TABLE}.arr_time ;;
    #allow_fill: yes
  }

  dimension: set {
    type: string
    sql: "SELECT state, COUNT(DISTINCT code) as airports_in_state_count FROM faa.airports GROUP BY 1 ORDER BY 1" ;;
  }

  dimension: cancelled {
    type: string
    sql: ${TABLE}.cancelled ;;
  }

  dimension: carrier {
    #label: "  Region Name"
    type: string
    sql: ${TABLE}.carrier ;;
    drill_fields: [details*]
    #link: {
    #  label: "testing down"
    #  url: "https://gcpl2314.cloud.looker.com/browse"
    #}
  }

  dimension: dep_delay {
    type: number
    sql: ${TABLE}.dep_delay ;;
  }

  dimension_group: dep {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.dep_time ;;
  }

  dimension: destination {
    #label: "SIC"
    type: string
    sql: ${TABLE}.destination ;;
  }

  dimension: distance {
    type: number
    sql: ${TABLE}.distance ;;
    description: "Filter by this to improve the query"
  }

  dimension: diverted {
    type: string
    sql: ${TABLE}.diverted ;;
  }

  dimension: flight_num {
    #label: " Division Name"
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

  measure: percent_of_total_advanced_movements {
    label: "Percent of total advanced movements"
    group_label: "Percentage"
    type: percent_of_total
    value_format: "0.0\%"
    sql: ${flight_time};;
  }

  set: details {
    fields: [flight_num, carrier, arr_time]
  }

}
