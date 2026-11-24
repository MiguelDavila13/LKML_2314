- dashboard: move_folder_test
  title: Move Folder Test
  layout: newspaper
  preferred_viewer: dashboards-next
  tile_size: 100

  filters:

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
