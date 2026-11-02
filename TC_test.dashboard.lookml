- name: add_a_unique_name_1793597998
  title: Untitled Visualization
  model: thelook_migueld_mtr
  explore: order_items
  type: table
  fields: [users.state, users.count]
  sorts: [users.count desc 0]
  limit: 500
  column_limit: 50
  dynamic_fields:
  - category: table_calculation
    expression: '1615841908445'
    label: TC Test
    value_format:
    value_format_name:
    _kind_hint: dimension
    table_calculation: tc_test
    _type_hint: number
  query_timezone: America/Los_Angeles
  table_theme: modern
  modern2026: true
