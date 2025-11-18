project_name: "thelook_migueld_mtr"
new_lookml_runtime: yes
visualization: {
  id: "cartoon-marketplace-dev"
  label: "cartoon Viz"
  url: "https://marketplace-api.looker.com/viz-dist/cartoon.js"

# # Use local_dependency: To enable referencing of another project
# # on this instance with include: statements
#
# local_dependency: {
#   project: "name_of_other_project"
# }
#remote_dependency: exchange_rate {
#  url: "https://github.com/looker-open-source/block-cortex-demand-sensing.git"
#  ref: "be7f245e3cd2102be0d894e92e8c3401e4c98bcf"
}
  constant: fiscal_week_start {
    value: "{% assign fiscal_week_start_offset = fiscal_week_number | minus: 1 | times: 7 | times: 24 | times: 60 | times: 60 %} {% assign fiscal_week_start = fiscal_year_start | date:'%s' | plus: fiscal_week_start_offset | date: '%Y-%m-%d' %}"
    }


  constant: fiscal_week_end {
    value: "{% assign fiscal_week_end_offset = 1 | times: 6 | times: 24 | times: 60 | times: 60 %} {% assign fiscal_week_end = fiscal_week_start | date:'%s' | plus: fiscal_week_end_offset | date: '%Y-%m-%d' %}"
  }
