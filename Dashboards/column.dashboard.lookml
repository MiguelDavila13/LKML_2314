#---
#- dashboard: column
#  title: Test column behavior
#  preferred_viewer: dashboards-next
#  description: ''
#  preferred_slug: yVpOHmXrIwnC5DNknXCSyv
#  layout: newspaper
#  tabs:
#  - name: ''
#    label: ''
#  elements:
#  - title: Test column behavior
#    name: Test column behavior
#    model: thelook_migueld_mtr
#    explore: flights
#    type: looker_grid
#    fields: [flights.dep_day_of_week, flights.average_arr_delay, flights.count, flights.tooltip_test,
#    flights.total_arr_delay, flights.destination]
#    pivots: [flights.dep_day_of_week]
#    #fields: [order, trading_group_sales_budget.takings_tw, trading_group_sales_budget.Takings_vs_Budget,
#    #  trading_group_sales_budget.Takings_LFL_vs_LY_Rate, trading_group_sales_budget.Takings_vs_LW_Cash,
#    #  dim_calendar_hub.week_day_desc_short_name, trading_group_sales_budget.commercial_division,
#    #  trading_group_sales_budget.commercial_trading_group]
#    #pivots: [dim_calendar_hub.week_day_desc_short_name]
#    #filters:
#    #  trading_group_sales_budget.channel: Main Store
#    #  dim_calendar_hub.is_current_week: "Y"
#    #  trading_group_sales_budget.commercial_division: "-UNASSIGNED-DIVISION"
#    #  trading_group_sales_budget.commercial_trading_group: "-%(Central)%"
#    sorts: [order, dim_calendar_hub.week_day_desc_short_name desc, trading_group_sales_budget.commercial_division,
#      trading_group_sales_budget.commercial_trading_group]
#    subtotals: [order, trading_group_sales_budget.commercial_division]
#    limit: 500
#    column_limit: 50
#    total: true
#    dynamic_fields:
#    - category: dimension
#      expression: "if (${trading_group_sales_budget.commercial_division} = \"Ambient\
#        \ Food\", 1,\n  if (${trading_group_sales_budget.commercial_division} = \"\
#        Ambient Non Food\", 2,\n    if (${trading_group_sales_budget.commercial_division}\
#        \ = \"Ambient\", 3,\nif (${trading_group_sales_budget.commercial_division}\
#        \ = \"Fresh\" , \n4,\nif (${trading_group_sales_budget.commercial_division}\
#        \ = \"Market Street\" , \n5,\nif (${trading_group_sales_budget.commercial_division}\
#        \ = \"General Merchandise\" , 6,\nif (${trading_group_sales_budget.commercial_division}\
#        \ = \"Home And Leisure\" , 6,\nif (${trading_group_sales_budget.commercial_division}\
#        \ = \"Clothes\" , 7,\nif (${trading_group_sales_budget.commercial_division}\
#        \ = \"Food Services\" , 8,\nif (${trading_group_sales_budget.commercial_division}\
#        \ =  \"Services\" , 9, 0\n))))))))))"
#      label: order
#      value_format:
#      value_format_name:
#      dimension: order
#      _kind_hint: dimension
#      _type_hint: number
#    show_view_names: false
#    show_row_numbers: false
#    transpose: false
#    truncate_text: true
#    hide_totals: false
#    hide_row_totals: false
#    size_to_fit: true
#    table_theme: white
#    limit_displayed_rows: false
#    enable_conditional_formatting: true
#    header_text_alignment: center
#    header_font_size: '7'
#    rows_font_size: '7'
#    conditional_formatting_include_totals: true
#    conditional_formatting_include_nulls: false
#    show_sql_query_menu_options: false
#    column_order: [trading_group_sales_budget.commercial_division, trading_group_sales_budget.commercial_trading_group,
#      Mon|FIELD|1_trading_group_sales_budget.takings_tw, Mon|FIELD|1_trading_group_sales_budget.Takings_vs_Budget,
#      Mon|FIELD|1_trading_group_sales_budget.Takings_LFL_vs_LY_Rate, Mon|FIELD|1_trading_group_sales_budget.Takings_vs_LW_Cash,
#      Tue|FIELD|2_trading_group_sales_budget.takings_tw, Tue|FIELD|2_trading_group_sales_budget.Takings_vs_Budget,
#      Tue|FIELD|2_trading_group_sales_budget.Takings_LFL_vs_LY_Rate, Tue|FIELD|2_trading_group_sales_budget.Takings_vs_LW_Cash,
#      Wed|FIELD|3_trading_group_sales_budget.takings_tw, Wed|FIELD|3_trading_group_sales_budget.Takings_vs_Budget,
#      Wed|FIELD|3_trading_group_sales_budget.Takings_LFL_vs_LY_Rate, Wed|FIELD|3_trading_group_sales_budget.Takings_vs_LW_Cash,
#      Thu|FIELD|4_trading_group_sales_budget.takings_tw, Thu|FIELD|4_trading_group_sales_budget.Takings_vs_Budget,
#      Thu|FIELD|4_trading_group_sales_budget.Takings_LFL_vs_LY_Rate, Thu|FIELD|4_trading_group_sales_budget.Takings_vs_LW_Cash,
#      Fri|FIELD|5_trading_group_sales_budget.takings_tw, Fri|FIELD|5_trading_group_sales_budget.Takings_vs_Budget,
#      Fri|FIELD|5_trading_group_sales_budget.Takings_LFL_vs_LY_Rate, Fri|FIELD|5_trading_group_sales_budget.Takings_vs_LW_Cash,
#      Sat|FIELD|6_trading_group_sales_budget.takings_tw, Sat|FIELD|6_trading_group_sales_budget.Takings_vs_Budget,
#      Sat|FIELD|6_trading_group_sales_budget.Takings_LFL_vs_LY_Rate, Sat|FIELD|6_trading_group_sales_budget.Takings_vs_LW_Cash,
#      Sun|FIELD|7_trading_group_sales_budget.takings_tw, Sun|FIELD|7_trading_group_sales_budget.Takings_vs_Budget,
#      Sun|FIELD|7_trading_group_sales_budget.Takings_LFL_vs_LY_Rate, Sun|FIELD|7_trading_group_sales_budget.Takings_vs_LW_Cash]
#    show_totals: true
#    show_row_totals: true
#    truncate_header: false
#    minimum_column_width: 1
#    series_labels:
#      trading_group_sales_budget.takings_tw: "£m"
#      trading_group_sales_budget.commercial_trading_group: _
#      trading_group_sales_budget.Takings_vs_Budget: Vs Budget
#      trading_group_sales_budget.Takings_LFL_vs_LY_Rate: LFL (%)
#      trading_group_sales_budget.Takings_vs_LW_Cash: WoW
#      trading_group_sales_budget.commercial_division: "."
#    series_column_widths:
#      trading_group_sales_budget.commercial_trading_group: 1
#      trading_group_sales_budget.commercial_division: 1
#      Mon|FIELD|1_trading_group_sales_budget.takings_tw: 53
#    series_cell_visualizations:
#      trading_group_sales_budget.takings_tw:
#        is_active: false
#    series_text_format:
#      trading_group_sales_budget.takings_tw:
#        align: center
#      trading_group_sales_budget.Takings_vs_Budget:
#        align: center
#      trading_group_sales_budget.Takings_LFL_vs_LY_Rate:
#        align: center
#      trading_group_sales_budget.Takings_vs_LW_Cash:
#        align: center
#      trading_group_sales_budget.commercial_trading_group:
#        bg_color: "#fff"
#        fg_color: "#fff"
#    header_background_color: "#d7d7d7"
#    conditional_formatting: [{type: less than, value: 0, background_color: '', font_color: "#EA4335",
#        color_application: {collection_id: morrisons, palette_id: morrisons-diverging-0,
#          options: {constraints: {min: {type: minimum}, mid: {type: number, value: 0},
#              max: {type: maximum}}, mirror: true, reverse: false, stepped: false}},
#        bold: false, italic: false, strikethrough: false, fields: !!null ''}]
#    series_value_format:
#      trading_group_sales_budget.takings_tw:
#        format_string: "#,##0.0,,;(#,##0.0,,)"
#      trading_group_sales_budget.Takings_vs_Budget:
#        format_string: "#,##0.0,,;(#,##0.0,,)"
#      trading_group_sales_budget.Takings_LFL_vs_LY_Rate:
#        format_string: 0.0%;(0.0%)
#        format_string: "#,##0.0,,;(#,##0.0,,)"
#    x_axis_gridlines: false
#    y_axis_gridlines: true
#    show_y_axis_labels: true
#    show_y_axis_ticks: true
#    y_axis_tick_density: default
#    y_axis_tick_density_custom: 5
#    show_x_axis_label: true
#    show_x_axis_ticks: true
#    y_axis_scale_mode: linear
#    x_axis_reversed: false
#    y_axis_reversed: false
#    plot_size_by_field: false
#    trellis: ''
#    stacking: ''
#    legend_position: center
#    point_style: none
#    show_value_labels: false
#    label_density: 25
#    x_axis_scale: auto
#    y_axis_combined: true
#    ordering: none
#    show_null_labels: false
#    show_totals_labels: false
#    show_silhouette: false
#    totals_color: "#808080"
#    defaults_version: 1
#    hidden_fields: [order]
#    hidden_pivots: {}
#    note_state: collapsed
#    note_display: above
#    listen:
#      Channel: trading_group_sales_budget.channel
#      Current Week Indicator: dim_calendar_hub.is_current_week
#      Commercial Division: trading_group_sales_budget.commercial_division
#      Commercial Trading Group: trading_group_sales_budget.commercial_trading_group
#    row: 0
#    col: 0
#    width: 13
#    height: 12
#    tab_name: ''
#  filters:
#  - name: Channel
#    title: Channel
#    type: field_filter
#    default_value: Main Store
#    allow_multiple_values: true
#    required: false
#    ui_config:
#      type: advanced
#      display: popover
#    model: commercial
#    explore: trading_group_sales_budget
#    listens_to_filters: []
#    field: trading_group_sales_budget.channel
#  - name: Current Week Indicator
#    title: Current Week Indicator
#    type: field_filter
#    default_value: "Y"
#    allow_multiple_values: true
#    required: false
#    ui_config:
#      type: advanced
#      display: popover
#    model: commercial
#    explore: trading_group_sales_budget
#    listens_to_filters: []
#    field: dim_calendar_hub.is_current_week
#  - name: Commercial Division
#    title: Commercial Division
#    type: field_filter
#    default_value: "-UNASSIGNED-DIVISION"
#    allow_multiple_values: true
#    required: false
#    ui_config:
#      type: advanced
#      display: popover
#    model: commercial
#    explore: trading_group_sales_budget
#    listens_to_filters: []
#    field: trading_group_sales_budget.commercial_division
#  - name: Commercial Trading Group
#    title: Commercial Trading Group
#    type: field_filter
#    default_value: "-%(Central)%"
#    allow_multiple_values: true
#    required: false
#    ui_config:
#      type: advanced
#      display: popover
#    model: commercial
#    explore: trading_group_sales_budget
#    listens_to_filters: []
#    field: trading_group_sales_budget.commercial_trading_group
