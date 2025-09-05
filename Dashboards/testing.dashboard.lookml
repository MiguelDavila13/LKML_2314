---
- dashboard: testing
  title: Testing LookML Dashboard
  layout: newspaper
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: 8gGWFWypX4twQ7ogU38Idh
  elements:
  - title: Testing for LookML Dashboard
    name: Testing for LookML Dashboard
    model: thelook_migueld_mtr
    explore: flights
    type: looker_grid
    fields: [flights.flight_num, flights.carrier, flights.destination, flights.flight_time,
      flights.tooltip_test]
    pivots: [flights.carrier]
    filters:
      flights.flight_time: "<20"
    sorts: [flights.carrier, flights.tooltip_test desc 0]
    limit: 500
    column_limit: 50
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
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Flight Time: flights.flight_time
    row: 0
    col: 0
    width: 12
    height: 8
  - title: Test Tile
    name: Test Tile
    model: thelook_migueld_mtr
    explore: flights
    type: looker_grid
    fields: [flights.flight_num, flights.carrier, flights.destination, flights.flight_time,
      flights.tooltip_test]
    pivots: [flights.carrier]
    filters:
      flights.flight_time: "<10"
    sorts: [flights.carrier, flights.tooltip_test desc 0]
    limit: 500
    column_limit: 50
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
    hidden_pivots: {}
    x_axis_gridlines: false
    y_axis_gridlines: true
    show_y_axis_labels: true
    show_y_axis_ticks: true
    y_axis_tick_density: default
    y_axis_tick_density_custom: 5
    show_x_axis_label: true
    show_x_axis_ticks: true
    y_axis_scale_mode: linear
    x_axis_reversed: false
    y_axis_reversed: false
    plot_size_by_field: false
    trellis: ''
    stacking: ''
    legend_position: center
    point_style: none
    show_value_labels: false
    label_density: 25
    x_axis_scale: auto
    y_axis_combined: true
    show_null_points: true
    interpolation: linear
    defaults_version: 1
    listen:
      Flight Time: flights.flight_time
    row: 0
    col: 12
    width: 12
    height: 8
  filters:
  - name: Flight Time
    title: Flight Time
    type: field_filter
    default_value: "<20"
    allow_multiple_values: true
    required: false
    ui_config:
      type: range_slider
      display: inline
    model: thelook_migueld_mtr
    explore: flights
    listens_to_filters: []
    field: flights.flight_time
