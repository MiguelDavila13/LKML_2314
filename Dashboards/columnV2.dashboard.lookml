---
- dashboard: columnv2
  title: testing column behavior
  preferred_viewer: dashboards-next
  description: ''
  preferred_slug: u1byCvc1fDEusXTmemN2Xs
  layout: newspaper
  tabs:
  - name: ''
    label: ''
  elements:
  - title: testing column behavior
    name: testing column behavior
    model: thelook_migueld_mtr
    explore: flights
    type: table
    fields: [flights.dep_day_of_week, flights.average_arr_delay, flights.count, flights.tooltip_test,
      flights.total_arr_delay, flights.destination, flights.sum_arr_delay]
    pivots: [flights.dep_day_of_week]
    fill_fields: [flights.dep_day_of_week]
    filters:
      flights.dep_date: 2005-12
    sorts: [flights.dep_day_of_week, flights.average_arr_delay desc 0]
    limit: 500
    column_limit: 50
    total: true
    query_timezone: America/Denver
    show_view_names: false
    show_row_numbers: false
    transpose: false
    truncate_text: true
    hide_totals: false
    hide_row_totals: false
    size_to_fit: true
    table_theme: white
    limit_displayed_rows: false
    enable_conditional_formatting: true
    header_text_alignment: center
    header_font_size: '7'
    rows_font_size: '7'
    conditional_formatting_include_totals: true
    conditional_formatting_include_nulls: false
    show_sql_query_menu_options: false
    column_order: [flights.destination, flights.count,
      Mon|FIELD|1_flights.average_arr_delay, Mon|FIELD|1_trading_group_sales_budget.Takings_vs_Budget,
      Mon|FIELD|1_trading_group_sales_budget.Takings_LFL_vs_LY_Rate, Mon|FIELD|1_trading_group_sales_budget.Takings_vs_LW_Cash,
      Tue|FIELD|2_flights.average_arr_delay, Tue|FIELD|2_trading_group_sales_budget.Takings_vs_Budget,
      Tue|FIELD|2_trading_group_sales_budget.Takings_LFL_vs_LY_Rate, Tue|FIELD|2_trading_group_sales_budget.Takings_vs_LW_Cash,
      Wed|FIELD|3_flights.average_arr_delay, Wed|FIELD|3_trading_group_sales_budget.Takings_vs_Budget,
      Wed|FIELD|3_trading_group_sales_budget.Takings_LFL_vs_LY_Rate, Wed|FIELD|3_trading_group_sales_budget.Takings_vs_LW_Cash,
      Thu|FIELD|4_flights.average_arr_delay, Thu|FIELD|4_trading_group_sales_budget.Takings_vs_Budget,
      Thu|FIELD|4_trading_group_sales_budget.Takings_LFL_vs_LY_Rate, Thu|FIELD|4_trading_group_sales_budget.Takings_vs_LW_Cash,
      Fri|FIELD|5_flights.average_arr_delay, Fri|FIELD|5_trading_group_sales_budget.Takings_vs_Budget,
      Fri|FIELD|5_trading_group_sales_budget.Takings_LFL_vs_LY_Rate, Fri|FIELD|5_trading_group_sales_budget.Takings_vs_LW_Cash,
      Sat|FIELD|6_flights.average_arr_delay, Sat|FIELD|6_trading_group_sales_budget.Takings_vs_Budget,
      Sat|FIELD|6_trading_group_sales_budget.Takings_LFL_vs_LY_Rate, Sat|FIELD|6_trading_group_sales_budget.Takings_vs_LW_Cash,
      Sun|FIELD|7_flights.average_arr_delay, Sun|FIELD|7_trading_group_sales_budget.Takings_vs_Budget,
      Sun|FIELD|7_trading_group_sales_budget.Takings_LFL_vs_LY_Rate, Sun|FIELD|7_trading_group_sales_budget.Takings_vs_LW_Cash]
    show_totals: true
    show_row_totals: true
    truncate_header: false
    minimum_column_width: 1
    series_labels:
      flights.average_arr_delay: "£m"
      flights.count: _
      flights.tooltip_test: Vs Budget
      flights.total_arr_delay: LFL (%)
      flights.sum_arr_delay: WoW
      flights.destination: "."
    series_column_widths:
      flights.count: 1
      flights.destination: 1
      #Mon|FIELD|1_trading_group_sales_budget.takings_tw: 53
    series_cell_visualizations:
      flights.average_arr_delay:
        is_active: false
    series_text_format:
      flights.average_arr_delay:
        align: center
      flights.tooltip_test:
        align: center
      flights.total_arr_delay:
        align: center
      flights.destination:
        align: center
      flights.sum_arr_delay:
        bg_color: "#fff"
        fg_color: "#fff"
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
    ordering: none
    show_null_labels: false
    show_totals_labels: false
    show_silhouette: false
    totals_color: "#808080"
    defaults_version: 1
    hidden_pivots: {}
    note_state: collapsed
    note_display: above
    listen:
      Dep Date: flights.dep_date
    row: 0
    col: 0
    width: 13
    height: 12
    tab_name: ''
  filters:
  - name: Dep Date
    title: Dep Date
    type: field_filter
    default_value: 2005-12
    allow_multiple_values: true
    required: false
    ui_config:
      type: relative_timeframes
      display: inline
    model: thelook_migueld_mtr
    explore: flights
    listens_to_filters: []
    field: flights.dep_date
