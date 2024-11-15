---
- dashboard: testing_schedule
  title: testing schedule
  layout: newspaper
  preferred_viewer: dashboards-next
  preferred_slug: QQkF8B1DvriXZVuMqqc71S
  elements:
  - title: testing schedule
    name: testing schedule
    model: thelook_migueld_mtr
    explore: flights
    type: table
    fields: [flights.carrier, flights.distance]
    sorts: [flights.carrier]
    limit: 500
    column_limit: 50
    query_timezone: UTC
    listen: {}
    row:
    col:
    width:
    height:
  - title: second tile
    name: second tile
    model: thelook_migueld_mtr
    explore: flights
    type: looker_grid
    fields: [flights.carrier, flights.distance, flights.destination, flights.flight_num,
      flights.flight_time]
    sorts: [flights.carrier]
    limit: 500
    column_limit: 50
    query_timezone: UTC
    show_view_names: false
    show_row_numbers: true
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: false
    header_text_alignment: left
    header_font_size: 12
    rows_font_size: 12
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen: {}
    row:
    col:
    width:
    height:
