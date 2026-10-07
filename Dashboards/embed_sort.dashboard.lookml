---
- dashboard: embed_sort
  title: embed sort
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 8kQ1n78440zm0h7YswMPyn
  theme_name: ''
  layout_granularity: granular
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - title: embed sort
    name: embed sort
    model: thelook_migueld_mtr
    explore: flights
    type: table
    fields: [flights.flight_num, flights.destination, flights.carrier]
    filters:
      flights.distance: "<50"
      flights.carrier: OO
    sorts: [flights.flight_num]
    limit: 500
    column_limit: 50
    query_timezone: America/Los_Angeles
    show_view_names: false
    show_row_numbers: true
    truncate_column_names: false
    hide_totals: false
    hide_row_totals: false
    table_theme: editable
    limit_displayed_rows: false
    enable_conditional_formatting: false
    conditional_formatting_include_totals: false
    conditional_formatting_include_nulls: false
    defaults_version: 1
    listen:
      Distance: flights.distance
      Carrier: flights.carrier
    row: 0
    col: 0
    width: 21
    height: 13
    tab_name: ''
  filters:
  - name: Distance
    title: Distance
    type: field_filter
    default_value: "<50"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
    model: thelook_migueld_mtr
    explore: flights
    listens_to_filters: []
    field: flights.distance
  - name: Carrier
    title: Carrier
    type: field_filter
    default_value: OO
    allow_multiple_values: true
    required: false
    ui_config:
      type: advanced
      display: popover
    model: thelook_migueld_mtr
    explore: flights
    listens_to_filters: []
    field: flights.carrier
